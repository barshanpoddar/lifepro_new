// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyPlanImpl _$$DailyPlanImplFromJson(Map<String, dynamic> json) =>
    _$DailyPlanImpl(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      activities:
          (json['activities'] as List<dynamic>?)
              ?.map((e) => PlanActivity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      summary: json['summary'] as String?,
      isFallback: json['isFallback'] as bool? ?? false,
    );

Map<String, dynamic> _$$DailyPlanImplToJson(_$DailyPlanImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'activities': instance.activities,
      'summary': instance.summary,
      'isFallback': instance.isFallback,
    };

_$PlanActivityImpl _$$PlanActivityImplFromJson(Map<String, dynamic> json) =>
    _$PlanActivityImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      type: json['type'] as String,
      isCompleted: json['isCompleted'] as bool? ?? false,
    );

Map<String, dynamic> _$$PlanActivityImplToJson(_$PlanActivityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'type': instance.type,
      'isCompleted': instance.isCompleted,
    };
