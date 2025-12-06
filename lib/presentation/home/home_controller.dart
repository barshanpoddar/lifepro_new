import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifepro_new/domain/entities/daily_entry.dart';
import 'package:lifepro_new/domain/entities/daily_plan.dart';
import 'package:lifepro_new/domain/repositories/wellbeing_repository.dart';
import 'package:lifepro_new/presentation/home/home_state.dart';
import 'package:lifepro_new/presentation/providers/providers.dart';
import 'package:uuid/uuid.dart';

class HomeController extends StateNotifier<HomeState> {
  final WellbeingRepository _repository;

  HomeController(this._repository) : super(const HomeState()) {
    loadData();
  }

  Future<void> loadData() async {
    state = state.copyWith(isLoading: true);
    try {
      final now = DateTime.now();
      final todayEntry = await _repository.getEntry(now);
      final stats = await _repository.getStats();
      final todayPlan = await _repository.getPlan(now);

      state = state.copyWith(
        isLoading: false,
        hasCheckedIn: todayEntry != null,
        moodToday: todayEntry?.moodScore.toString(),
        stressLevel: todayEntry?.stressLevel ?? 0,
        points: stats.points,
        streak: stats.currentStreak,
        todayPlan: todayPlan,
        waterIntake: stats.waterIntake,
        steps: stats.steps,
        sleepHours: stats.sleepHours,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> updateWater(int cups) async {
    try {
      var stats = await _repository.getStats();
      stats = stats.copyWith(waterIntake: cups);
      await _repository.saveStats(stats);
      state = state.copyWith(waterIntake: cups);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    }
  }

  Future<void> updateSteps(int steps) async {
    try {
      var stats = await _repository.getStats();
      stats = stats.copyWith(steps: steps);
      await _repository.saveStats(stats);
      state = state.copyWith(steps: steps);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    }
  }

  Future<void> updateSleep(int hours) async {
    try {
      var stats = await _repository.getStats();
      stats = stats.copyWith(sleepHours: hours);
      await _repository.saveStats(stats);
      state = state.copyWith(sleepHours: hours);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    }
  }

  Future<void> refresh() async {
    await loadData();
  }

  Future<void> completeCheckIn(String mood, int stress) async {
    state = state.copyWith(isLoading: true);

    try {
      final now = DateTime.now();
      // 1. Save Entry
      // Mapping string mood to int for now, or just storing it.
      // DailyEntry requires int moodScore. Let's assume 'Good' -> 8, etc or just pass 7 for MVP.
      final entry = DailyEntry(
        id: const Uuid().v4(),
        date: now,
        moodScore: 7, // Placeholder mapping
        stressLevel: stress,
        note: mood, // Storing mood text in note for now
      );
      await _repository.saveEntry(entry);

      // 2. Update Stats
      var stats = await _repository.getStats();

      // Simple streak logic: if last check-in was yesterday, increment. If today, do nothing. If older, reset.
      // For MVP, just increment if not checked in today.
      // But we already checked `hasCheckedIn` in UI?
      // Let's just increment points.

      final newPoints = stats.points + 10;
      // Streak logic can be improved later
      final newStreak = stats.currentStreak + 1;

      stats = stats.copyWith(
        points: newPoints,
        currentStreak: newStreak,
        lastCheckInDate: now,
      );
      await _repository.saveStats(stats);

      // 3. Generate/Save Plan (Mock)
      final plan = DailyPlan(
        id: const Uuid().v4(),
        date: now,
        activities: [
          const PlanActivity(
            id: '1',
            title: 'Deep Breathing',
            description: 'Take 5 deep breaths',
            type: 'mindfulness',
          ),
          const PlanActivity(
            id: '2',
            title: 'Hydrate',
            description: 'Drink a glass of water',
            type: 'health',
          ),
        ],
        summary: "Focus on recovery.",
      );
      await _repository.savePlan(plan);

      // 4. Update State
      state = state.copyWith(
        isLoading: false,
        hasCheckedIn: true,
        moodToday: mood,
        stressLevel: stress,
        points: newPoints,
        streak: newStreak,
        todayPlan: plan,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }
}

final homeControllerProvider = StateNotifierProvider<HomeController, HomeState>(
  (ref) {
    final repository = ref.watch(wellbeingRepositoryProvider);
    return HomeController(repository);
  },
);
