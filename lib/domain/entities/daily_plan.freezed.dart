// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DailyPlan _$DailyPlanFromJson(Map<String, dynamic> json) {
  return _DailyPlan.fromJson(json);
}

/// @nodoc
mixin _$DailyPlan {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  List<PlanActivity> get activities => throw _privateConstructorUsedError;
  String? get summary => throw _privateConstructorUsedError;
  bool get isFallback => throw _privateConstructorUsedError;

  /// Serializes this DailyPlan to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyPlanCopyWith<DailyPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyPlanCopyWith<$Res> {
  factory $DailyPlanCopyWith(DailyPlan value, $Res Function(DailyPlan) then) =
      _$DailyPlanCopyWithImpl<$Res, DailyPlan>;
  @useResult
  $Res call({
    String id,
    DateTime date,
    List<PlanActivity> activities,
    String? summary,
    bool isFallback,
  });
}

/// @nodoc
class _$DailyPlanCopyWithImpl<$Res, $Val extends DailyPlan>
    implements $DailyPlanCopyWith<$Res> {
  _$DailyPlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? activities = null,
    Object? summary = freezed,
    Object? isFallback = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            activities: null == activities
                ? _value.activities
                : activities // ignore: cast_nullable_to_non_nullable
                      as List<PlanActivity>,
            summary: freezed == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as String?,
            isFallback: null == isFallback
                ? _value.isFallback
                : isFallback // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DailyPlanImplCopyWith<$Res>
    implements $DailyPlanCopyWith<$Res> {
  factory _$$DailyPlanImplCopyWith(
    _$DailyPlanImpl value,
    $Res Function(_$DailyPlanImpl) then,
  ) = __$$DailyPlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    DateTime date,
    List<PlanActivity> activities,
    String? summary,
    bool isFallback,
  });
}

/// @nodoc
class __$$DailyPlanImplCopyWithImpl<$Res>
    extends _$DailyPlanCopyWithImpl<$Res, _$DailyPlanImpl>
    implements _$$DailyPlanImplCopyWith<$Res> {
  __$$DailyPlanImplCopyWithImpl(
    _$DailyPlanImpl _value,
    $Res Function(_$DailyPlanImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DailyPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? activities = null,
    Object? summary = freezed,
    Object? isFallback = null,
  }) {
    return _then(
      _$DailyPlanImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        activities: null == activities
            ? _value._activities
            : activities // ignore: cast_nullable_to_non_nullable
                  as List<PlanActivity>,
        summary: freezed == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as String?,
        isFallback: null == isFallback
            ? _value.isFallback
            : isFallback // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyPlanImpl implements _DailyPlan {
  const _$DailyPlanImpl({
    required this.id,
    required this.date,
    final List<PlanActivity> activities = const [],
    this.summary,
    this.isFallback = false,
  }) : _activities = activities;

  factory _$DailyPlanImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyPlanImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime date;
  final List<PlanActivity> _activities;
  @override
  @JsonKey()
  List<PlanActivity> get activities {
    if (_activities is EqualUnmodifiableListView) return _activities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activities);
  }

  @override
  final String? summary;
  @override
  @JsonKey()
  final bool isFallback;

  @override
  String toString() {
    return 'DailyPlan(id: $id, date: $date, activities: $activities, summary: $summary, isFallback: $isFallback)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyPlanImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(
              other._activities,
              _activities,
            ) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.isFallback, isFallback) ||
                other.isFallback == isFallback));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    date,
    const DeepCollectionEquality().hash(_activities),
    summary,
    isFallback,
  );

  /// Create a copy of DailyPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyPlanImplCopyWith<_$DailyPlanImpl> get copyWith =>
      __$$DailyPlanImplCopyWithImpl<_$DailyPlanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyPlanImplToJson(this);
  }
}

abstract class _DailyPlan implements DailyPlan {
  const factory _DailyPlan({
    required final String id,
    required final DateTime date,
    final List<PlanActivity> activities,
    final String? summary,
    final bool isFallback,
  }) = _$DailyPlanImpl;

  factory _DailyPlan.fromJson(Map<String, dynamic> json) =
      _$DailyPlanImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get date;
  @override
  List<PlanActivity> get activities;
  @override
  String? get summary;
  @override
  bool get isFallback;

  /// Create a copy of DailyPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyPlanImplCopyWith<_$DailyPlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlanActivity _$PlanActivityFromJson(Map<String, dynamic> json) {
  return _PlanActivity.fromJson(json);
}

/// @nodoc
mixin _$PlanActivity {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;

  /// Serializes this PlanActivity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlanActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlanActivityCopyWith<PlanActivity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanActivityCopyWith<$Res> {
  factory $PlanActivityCopyWith(
    PlanActivity value,
    $Res Function(PlanActivity) then,
  ) = _$PlanActivityCopyWithImpl<$Res, PlanActivity>;
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    String type,
    bool isCompleted,
  });
}

/// @nodoc
class _$PlanActivityCopyWithImpl<$Res, $Val extends PlanActivity>
    implements $PlanActivityCopyWith<$Res> {
  _$PlanActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlanActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? isCompleted = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            isCompleted: null == isCompleted
                ? _value.isCompleted
                : isCompleted // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PlanActivityImplCopyWith<$Res>
    implements $PlanActivityCopyWith<$Res> {
  factory _$$PlanActivityImplCopyWith(
    _$PlanActivityImpl value,
    $Res Function(_$PlanActivityImpl) then,
  ) = __$$PlanActivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    String type,
    bool isCompleted,
  });
}

/// @nodoc
class __$$PlanActivityImplCopyWithImpl<$Res>
    extends _$PlanActivityCopyWithImpl<$Res, _$PlanActivityImpl>
    implements _$$PlanActivityImplCopyWith<$Res> {
  __$$PlanActivityImplCopyWithImpl(
    _$PlanActivityImpl _value,
    $Res Function(_$PlanActivityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PlanActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? isCompleted = null,
  }) {
    return _then(
      _$PlanActivityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        isCompleted: null == isCompleted
            ? _value.isCompleted
            : isCompleted // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PlanActivityImpl implements _PlanActivity {
  const _$PlanActivityImpl({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    this.isCompleted = false,
  });

  factory _$PlanActivityImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlanActivityImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String type;
  @override
  @JsonKey()
  final bool isCompleted;

  @override
  String toString() {
    return 'PlanActivity(id: $id, title: $title, description: $description, type: $type, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlanActivityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, description, type, isCompleted);

  /// Create a copy of PlanActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlanActivityImplCopyWith<_$PlanActivityImpl> get copyWith =>
      __$$PlanActivityImplCopyWithImpl<_$PlanActivityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlanActivityImplToJson(this);
  }
}

abstract class _PlanActivity implements PlanActivity {
  const factory _PlanActivity({
    required final String id,
    required final String title,
    required final String description,
    required final String type,
    final bool isCompleted,
  }) = _$PlanActivityImpl;

  factory _PlanActivity.fromJson(Map<String, dynamic> json) =
      _$PlanActivityImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get type;
  @override
  bool get isCompleted;

  /// Create a copy of PlanActivity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlanActivityImplCopyWith<_$PlanActivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
