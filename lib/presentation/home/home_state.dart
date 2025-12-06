import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lifepro_new/domain/entities/daily_plan.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool hasCheckedIn,
    DailyPlan? todayPlan,
    String? moodToday, // Nullable, as user might not have checked in
    @Default(0) int stressLevel,
    @Default(0) int points,
    @Default(0) int streak,
    @Default(0) int waterIntake,
    @Default(0) int steps,
    @Default(0) int sleepHours,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _HomeState;
}
