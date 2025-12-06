import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_plan.freezed.dart';
part 'daily_plan.g.dart';

@freezed
class DailyPlan with _$DailyPlan {
  const factory DailyPlan({
    required String id,
    required DateTime date,
    @Default([]) List<PlanActivity> activities,
    String? summary,
    @Default(false) bool isFallback,
  }) = _DailyPlan;

  factory DailyPlan.fromJson(Map<String, dynamic> json) =>
      _$DailyPlanFromJson(json);
}

@freezed
class PlanActivity with _$PlanActivity {
  const factory PlanActivity({
    required String id,
    required String title,
    required String description,
    required String type,
    @Default(false) bool isCompleted,
  }) = _PlanActivity;

  factory PlanActivity.fromJson(Map<String, dynamic> json) =>
      _$PlanActivityFromJson(json);
}
