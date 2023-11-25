// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  String get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool? get isCompleted => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  DateTime? get modifiedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call(
      {String id,
      String? title,
      String? description,
      bool? isCompleted,
      DateTime? completedAt,
      DateTime? modifiedAt});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? description = freezed,
    Object? isCompleted = freezed,
    Object? completedAt = freezed,
    Object? modifiedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: freezed == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedAt: freezed == modifiedAt
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskImplCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$TaskImplCopyWith(
          _$TaskImpl value, $Res Function(_$TaskImpl) then) =
      __$$TaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? title,
      String? description,
      bool? isCompleted,
      DateTime? completedAt,
      DateTime? modifiedAt});
}

/// @nodoc
class __$$TaskImplCopyWithImpl<$Res>
    extends _$TaskCopyWithImpl<$Res, _$TaskImpl>
    implements _$$TaskImplCopyWith<$Res> {
  __$$TaskImplCopyWithImpl(_$TaskImpl _value, $Res Function(_$TaskImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? description = freezed,
    Object? isCompleted = freezed,
    Object? completedAt = freezed,
    Object? modifiedAt = freezed,
  }) {
    return _then(_$TaskImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isCompleted: freezed == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedAt: freezed == modifiedAt
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskImpl extends _Task {
  _$TaskImpl(
      {required this.id,
      this.title,
      this.description,
      this.isCompleted,
      this.completedAt,
      this.modifiedAt})
      : super._();

  factory _$TaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskImplFromJson(json);

  @override
  final String id;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final bool? isCompleted;
  @override
  final DateTime? completedAt;
  @override
  final DateTime? modifiedAt;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      __$$TaskImplCopyWithImpl<_$TaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskImplToJson(
      this,
    );
  }
}

abstract class _Task extends Task {
  factory _Task(
      {required final String id,
      final String? title,
      final String? description,
      final bool? isCompleted,
      final DateTime? completedAt,
      final DateTime? modifiedAt}) = _$TaskImpl;
  _Task._() : super._();

  factory _Task.fromJson(Map<String, dynamic> json) = _$TaskImpl.fromJson;

  @override
  String get id;
  @override
  String? get title;
  @override
  String? get description;
  @override
  bool? get isCompleted;
  @override
  DateTime? get completedAt;
  @override
  DateTime? get modifiedAt;
  @override
  @JsonKey(ignore: true)
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
