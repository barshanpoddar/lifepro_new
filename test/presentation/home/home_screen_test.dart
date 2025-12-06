import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifepro_new/presentation/home/home_screen.dart';
import 'package:lifepro_new/presentation/home/home_controller.dart';
import 'package:lifepro_new/presentation/home/home_state.dart';

import 'package:lifepro_new/domain/repositories/wellbeing_repository.dart';
import 'package:lifepro_new/domain/entities/daily_entry.dart';
import 'package:lifepro_new/domain/entities/daily_plan.dart';
import 'package:lifepro_new/domain/entities/user_stats.dart';

class MockWellbeingRepository implements WellbeingRepository {
  @override
  Future<void> deleteEntry(String id) async {}

  @override
  Future<DailyEntry?> getEntry(DateTime date) async => null;

  @override
  Future<List<DailyEntry>> getHistory() async => [];

  @override
  Future<DailyPlan?> getPlan(DateTime date) async => null;

  @override
  Future<UserStats> getStats() async => const UserStats();

  @override
  Future<void> saveEntry(DailyEntry entry) async {}

  @override
  Future<void> savePlan(DailyPlan plan) async {}

  @override
  Future<void> saveStats(UserStats stats) async {}
}

class MockHomeController extends HomeController {
  MockHomeController(HomeState initial) : super(MockWellbeingRepository()) {
    state = initial;
  }

  @override
  Future<void> loadData() async {
    // Prevent real data loading during tests
  }
}

void main() {
  testWidgets('HomeScreen renders check-in card when not checked in', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          homeControllerProvider.overrideWith(
            (ref) => MockHomeController(
              const HomeState(hasCheckedIn: false, isLoading: false),
            ),
          ),
        ],
        child: const MaterialApp(home: HomeScreen()),
      ),
    );

    // Verify "How are you feeling today?" is shown
    expect(find.text("How are you feeling today?"), findsOneWidget);
    // Verify Start button
    expect(find.text("Start Daily Check-In"), findsOneWidget);
    // Verify Plan placeholder
    expect(
      find.text("Your daily plan will appear here after you check in."),
      findsOneWidget,
    );
  });

  testWidgets('HomeScreen renders plan when checked in', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          homeControllerProvider.overrideWith(
            (ref) => MockHomeController(
              const HomeState(
                hasCheckedIn: true,
                isLoading: false,
                moodToday: "Good",
              ),
            ),
          ),
        ],
        child: const MaterialApp(home: HomeScreen()),
      ),
    );

    // Verify "You're checked in!" is shown
    expect(find.text("You're checked in!"), findsOneWidget);
    // Verify Mood display
    expect(find.text("Mood: Good"), findsOneWidget);
    // Verify Plan section title
    expect(find.text("Today's Plan"), findsOneWidget);
  });

  testWidgets('Emergency button is present and opens modal', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          homeControllerProvider.overrideWith(
            (ref) => MockHomeController(const HomeState()),
          ),
        ],
        child: const MaterialApp(home: HomeScreen()),
      ),
    );

    final emergencyButton = find.text("Need Help?");
    expect(emergencyButton, findsOneWidget);

    await tester.dragUntilVisible(
      emergencyButton,
      find.byType(SingleChildScrollView),
      const Offset(0, -50),
    );
    await tester.pumpAndSettle();

    await tester.tap(emergencyButton);
    await tester.pumpAndSettle(); // Wait for modal animation

    expect(
      find.text("You are not alone. Reach out to someone you trust."),
      findsOneWidget,
    );
  });
}
