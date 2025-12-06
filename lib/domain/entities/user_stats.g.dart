// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserStatsImpl _$$UserStatsImplFromJson(Map<String, dynamic> json) =>
    _$UserStatsImpl(
      points: (json['points'] as num?)?.toInt() ?? 0,
      currentStreak: (json['currentStreak'] as num?)?.toInt() ?? 0,
      longestStreak: (json['longestStreak'] as num?)?.toInt() ?? 0,
      lastCheckInDate: json['lastCheckInDate'] == null
          ? null
          : DateTime.parse(json['lastCheckInDate'] as String),
      waterIntake: (json['waterIntake'] as num?)?.toInt() ?? 0,
      steps: (json['steps'] as num?)?.toInt() ?? 0,
      sleepHours: (json['sleepHours'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$UserStatsImplToJson(_$UserStatsImpl instance) =>
    <String, dynamic>{
      'points': instance.points,
      'currentStreak': instance.currentStreak,
      'longestStreak': instance.longestStreak,
      'lastCheckInDate': instance.lastCheckInDate?.toIso8601String(),
      'waterIntake': instance.waterIntake,
      'steps': instance.steps,
      'sleepHours': instance.sleepHours,
    };
