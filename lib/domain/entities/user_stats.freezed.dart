// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserStats _$UserStatsFromJson(Map<String, dynamic> json) {
  return _UserStats.fromJson(json);
}

/// @nodoc
mixin _$UserStats {
  int get points => throw _privateConstructorUsedError;
  int get currentStreak => throw _privateConstructorUsedError;
  int get longestStreak => throw _privateConstructorUsedError;
  DateTime? get lastCheckInDate => throw _privateConstructorUsedError;
  int get waterIntake => throw _privateConstructorUsedError; // cups
  int get steps => throw _privateConstructorUsedError;
  int get sleepHours => throw _privateConstructorUsedError;

  /// Serializes this UserStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserStatsCopyWith<UserStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStatsCopyWith<$Res> {
  factory $UserStatsCopyWith(UserStats value, $Res Function(UserStats) then) =
      _$UserStatsCopyWithImpl<$Res, UserStats>;
  @useResult
  $Res call({
    int points,
    int currentStreak,
    int longestStreak,
    DateTime? lastCheckInDate,
    int waterIntake,
    int steps,
    int sleepHours,
  });
}

/// @nodoc
class _$UserStatsCopyWithImpl<$Res, $Val extends UserStats>
    implements $UserStatsCopyWith<$Res> {
  _$UserStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? points = null,
    Object? currentStreak = null,
    Object? longestStreak = null,
    Object? lastCheckInDate = freezed,
    Object? waterIntake = null,
    Object? steps = null,
    Object? sleepHours = null,
  }) {
    return _then(
      _value.copyWith(
            points: null == points
                ? _value.points
                : points // ignore: cast_nullable_to_non_nullable
                      as int,
            currentStreak: null == currentStreak
                ? _value.currentStreak
                : currentStreak // ignore: cast_nullable_to_non_nullable
                      as int,
            longestStreak: null == longestStreak
                ? _value.longestStreak
                : longestStreak // ignore: cast_nullable_to_non_nullable
                      as int,
            lastCheckInDate: freezed == lastCheckInDate
                ? _value.lastCheckInDate
                : lastCheckInDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            waterIntake: null == waterIntake
                ? _value.waterIntake
                : waterIntake // ignore: cast_nullable_to_non_nullable
                      as int,
            steps: null == steps
                ? _value.steps
                : steps // ignore: cast_nullable_to_non_nullable
                      as int,
            sleepHours: null == sleepHours
                ? _value.sleepHours
                : sleepHours // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserStatsImplCopyWith<$Res>
    implements $UserStatsCopyWith<$Res> {
  factory _$$UserStatsImplCopyWith(
    _$UserStatsImpl value,
    $Res Function(_$UserStatsImpl) then,
  ) = __$$UserStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int points,
    int currentStreak,
    int longestStreak,
    DateTime? lastCheckInDate,
    int waterIntake,
    int steps,
    int sleepHours,
  });
}

/// @nodoc
class __$$UserStatsImplCopyWithImpl<$Res>
    extends _$UserStatsCopyWithImpl<$Res, _$UserStatsImpl>
    implements _$$UserStatsImplCopyWith<$Res> {
  __$$UserStatsImplCopyWithImpl(
    _$UserStatsImpl _value,
    $Res Function(_$UserStatsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? points = null,
    Object? currentStreak = null,
    Object? longestStreak = null,
    Object? lastCheckInDate = freezed,
    Object? waterIntake = null,
    Object? steps = null,
    Object? sleepHours = null,
  }) {
    return _then(
      _$UserStatsImpl(
        points: null == points
            ? _value.points
            : points // ignore: cast_nullable_to_non_nullable
                  as int,
        currentStreak: null == currentStreak
            ? _value.currentStreak
            : currentStreak // ignore: cast_nullable_to_non_nullable
                  as int,
        longestStreak: null == longestStreak
            ? _value.longestStreak
            : longestStreak // ignore: cast_nullable_to_non_nullable
                  as int,
        lastCheckInDate: freezed == lastCheckInDate
            ? _value.lastCheckInDate
            : lastCheckInDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        waterIntake: null == waterIntake
            ? _value.waterIntake
            : waterIntake // ignore: cast_nullable_to_non_nullable
                  as int,
        steps: null == steps
            ? _value.steps
            : steps // ignore: cast_nullable_to_non_nullable
                  as int,
        sleepHours: null == sleepHours
            ? _value.sleepHours
            : sleepHours // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserStatsImpl implements _UserStats {
  const _$UserStatsImpl({
    this.points = 0,
    this.currentStreak = 0,
    this.longestStreak = 0,
    this.lastCheckInDate,
    this.waterIntake = 0,
    this.steps = 0,
    this.sleepHours = 0,
  });

  factory _$UserStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserStatsImplFromJson(json);

  @override
  @JsonKey()
  final int points;
  @override
  @JsonKey()
  final int currentStreak;
  @override
  @JsonKey()
  final int longestStreak;
  @override
  final DateTime? lastCheckInDate;
  @override
  @JsonKey()
  final int waterIntake;
  // cups
  @override
  @JsonKey()
  final int steps;
  @override
  @JsonKey()
  final int sleepHours;

  @override
  String toString() {
    return 'UserStats(points: $points, currentStreak: $currentStreak, longestStreak: $longestStreak, lastCheckInDate: $lastCheckInDate, waterIntake: $waterIntake, steps: $steps, sleepHours: $sleepHours)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStatsImpl &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.currentStreak, currentStreak) ||
                other.currentStreak == currentStreak) &&
            (identical(other.longestStreak, longestStreak) ||
                other.longestStreak == longestStreak) &&
            (identical(other.lastCheckInDate, lastCheckInDate) ||
                other.lastCheckInDate == lastCheckInDate) &&
            (identical(other.waterIntake, waterIntake) ||
                other.waterIntake == waterIntake) &&
            (identical(other.steps, steps) || other.steps == steps) &&
            (identical(other.sleepHours, sleepHours) ||
                other.sleepHours == sleepHours));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    points,
    currentStreak,
    longestStreak,
    lastCheckInDate,
    waterIntake,
    steps,
    sleepHours,
  );

  /// Create a copy of UserStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStatsImplCopyWith<_$UserStatsImpl> get copyWith =>
      __$$UserStatsImplCopyWithImpl<_$UserStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserStatsImplToJson(this);
  }
}

abstract class _UserStats implements UserStats {
  const factory _UserStats({
    final int points,
    final int currentStreak,
    final int longestStreak,
    final DateTime? lastCheckInDate,
    final int waterIntake,
    final int steps,
    final int sleepHours,
  }) = _$UserStatsImpl;

  factory _UserStats.fromJson(Map<String, dynamic> json) =
      _$UserStatsImpl.fromJson;

  @override
  int get points;
  @override
  int get currentStreak;
  @override
  int get longestStreak;
  @override
  DateTime? get lastCheckInDate;
  @override
  int get waterIntake; // cups
  @override
  int get steps;
  @override
  int get sleepHours;

  /// Create a copy of UserStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserStatsImplCopyWith<_$UserStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
