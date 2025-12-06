import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_stats.freezed.dart';
part 'user_stats.g.dart';

@freezed
class UserStats with _$UserStats {
  const factory UserStats({
    @Default(0) int points,
    @Default(0) int currentStreak,
    @Default(0) int longestStreak,
    DateTime? lastCheckInDate,
    @Default(0) int waterIntake, // cups
    @Default(0) int steps,
    @Default(0) int sleepHours,
  }) = _UserStats;

  factory UserStats.fromJson(Map<String, dynamic> json) =>
      _$UserStatsFromJson(json);
}
