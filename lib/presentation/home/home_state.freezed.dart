// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HomeState {
  bool get hasCheckedIn => throw _privateConstructorUsedError;
  DailyPlan? get todayPlan => throw _privateConstructorUsedError;
  String? get moodToday =>
      throw _privateConstructorUsedError; // Nullable, as user might not have checked in
  int get stressLevel => throw _privateConstructorUsedError;
  int get points => throw _privateConstructorUsedError;
  int get streak => throw _privateConstructorUsedError;
  int get waterIntake => throw _privateConstructorUsedError;
  int get steps => throw _privateConstructorUsedError;
  int get sleepHours => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call({
    bool hasCheckedIn,
    DailyPlan? todayPlan,
    String? moodToday,
    int stressLevel,
    int points,
    int streak,
    int waterIntake,
    int steps,
    int sleepHours,
    bool isLoading,
    String? errorMessage,
  });

  $DailyPlanCopyWith<$Res>? get todayPlan;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasCheckedIn = null,
    Object? todayPlan = freezed,
    Object? moodToday = freezed,
    Object? stressLevel = null,
    Object? points = null,
    Object? streak = null,
    Object? waterIntake = null,
    Object? steps = null,
    Object? sleepHours = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            hasCheckedIn: null == hasCheckedIn
                ? _value.hasCheckedIn
                : hasCheckedIn // ignore: cast_nullable_to_non_nullable
                      as bool,
            todayPlan: freezed == todayPlan
                ? _value.todayPlan
                : todayPlan // ignore: cast_nullable_to_non_nullable
                      as DailyPlan?,
            moodToday: freezed == moodToday
                ? _value.moodToday
                : moodToday // ignore: cast_nullable_to_non_nullable
                      as String?,
            stressLevel: null == stressLevel
                ? _value.stressLevel
                : stressLevel // ignore: cast_nullable_to_non_nullable
                      as int,
            points: null == points
                ? _value.points
                : points // ignore: cast_nullable_to_non_nullable
                      as int,
            streak: null == streak
                ? _value.streak
                : streak // ignore: cast_nullable_to_non_nullable
                      as int,
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
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DailyPlanCopyWith<$Res>? get todayPlan {
    if (_value.todayPlan == null) {
      return null;
    }

    return $DailyPlanCopyWith<$Res>(_value.todayPlan!, (value) {
      return _then(_value.copyWith(todayPlan: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
    _$HomeStateImpl value,
    $Res Function(_$HomeStateImpl) then,
  ) = __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool hasCheckedIn,
    DailyPlan? todayPlan,
    String? moodToday,
    int stressLevel,
    int points,
    int streak,
    int waterIntake,
    int steps,
    int sleepHours,
    bool isLoading,
    String? errorMessage,
  });

  @override
  $DailyPlanCopyWith<$Res>? get todayPlan;
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
    _$HomeStateImpl _value,
    $Res Function(_$HomeStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasCheckedIn = null,
    Object? todayPlan = freezed,
    Object? moodToday = freezed,
    Object? stressLevel = null,
    Object? points = null,
    Object? streak = null,
    Object? waterIntake = null,
    Object? steps = null,
    Object? sleepHours = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$HomeStateImpl(
        hasCheckedIn: null == hasCheckedIn
            ? _value.hasCheckedIn
            : hasCheckedIn // ignore: cast_nullable_to_non_nullable
                  as bool,
        todayPlan: freezed == todayPlan
            ? _value.todayPlan
            : todayPlan // ignore: cast_nullable_to_non_nullable
                  as DailyPlan?,
        moodToday: freezed == moodToday
            ? _value.moodToday
            : moodToday // ignore: cast_nullable_to_non_nullable
                  as String?,
        stressLevel: null == stressLevel
            ? _value.stressLevel
            : stressLevel // ignore: cast_nullable_to_non_nullable
                  as int,
        points: null == points
            ? _value.points
            : points // ignore: cast_nullable_to_non_nullable
                  as int,
        streak: null == streak
            ? _value.streak
            : streak // ignore: cast_nullable_to_non_nullable
                  as int,
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
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl({
    this.hasCheckedIn = false,
    this.todayPlan,
    this.moodToday,
    this.stressLevel = 0,
    this.points = 0,
    this.streak = 0,
    this.waterIntake = 0,
    this.steps = 0,
    this.sleepHours = 0,
    this.isLoading = false,
    this.errorMessage,
  });

  @override
  @JsonKey()
  final bool hasCheckedIn;
  @override
  final DailyPlan? todayPlan;
  @override
  final String? moodToday;
  // Nullable, as user might not have checked in
  @override
  @JsonKey()
  final int stressLevel;
  @override
  @JsonKey()
  final int points;
  @override
  @JsonKey()
  final int streak;
  @override
  @JsonKey()
  final int waterIntake;
  @override
  @JsonKey()
  final int steps;
  @override
  @JsonKey()
  final int sleepHours;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'HomeState(hasCheckedIn: $hasCheckedIn, todayPlan: $todayPlan, moodToday: $moodToday, stressLevel: $stressLevel, points: $points, streak: $streak, waterIntake: $waterIntake, steps: $steps, sleepHours: $sleepHours, isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.hasCheckedIn, hasCheckedIn) ||
                other.hasCheckedIn == hasCheckedIn) &&
            (identical(other.todayPlan, todayPlan) ||
                other.todayPlan == todayPlan) &&
            (identical(other.moodToday, moodToday) ||
                other.moodToday == moodToday) &&
            (identical(other.stressLevel, stressLevel) ||
                other.stressLevel == stressLevel) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.streak, streak) || other.streak == streak) &&
            (identical(other.waterIntake, waterIntake) ||
                other.waterIntake == waterIntake) &&
            (identical(other.steps, steps) || other.steps == steps) &&
            (identical(other.sleepHours, sleepHours) ||
                other.sleepHours == sleepHours) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    hasCheckedIn,
    todayPlan,
    moodToday,
    stressLevel,
    points,
    streak,
    waterIntake,
    steps,
    sleepHours,
    isLoading,
    errorMessage,
  );

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState({
    final bool hasCheckedIn,
    final DailyPlan? todayPlan,
    final String? moodToday,
    final int stressLevel,
    final int points,
    final int streak,
    final int waterIntake,
    final int steps,
    final int sleepHours,
    final bool isLoading,
    final String? errorMessage,
  }) = _$HomeStateImpl;

  @override
  bool get hasCheckedIn;
  @override
  DailyPlan? get todayPlan;
  @override
  String? get moodToday; // Nullable, as user might not have checked in
  @override
  int get stressLevel;
  @override
  int get points;
  @override
  int get streak;
  @override
  int get waterIntake;
  @override
  int get steps;
  @override
  int get sleepHours;
  @override
  bool get isLoading;
  @override
  String? get errorMessage;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
