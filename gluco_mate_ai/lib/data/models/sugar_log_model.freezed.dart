// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sugar_log_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SugarLogModel _$SugarLogModelFromJson(Map<String, dynamic> json) {
  return _SugarLogModel.fromJson(json);
}

/// @nodoc
mixin _$SugarLogModel {
  double get sugarLevel => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  /// Serializes this SugarLogModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SugarLogModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SugarLogModelCopyWith<SugarLogModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SugarLogModelCopyWith<$Res> {
  factory $SugarLogModelCopyWith(
          SugarLogModel value, $Res Function(SugarLogModel) then) =
      _$SugarLogModelCopyWithImpl<$Res, SugarLogModel>;
  @useResult
  $Res call({double sugarLevel, DateTime timestamp, String type});
}

/// @nodoc
class _$SugarLogModelCopyWithImpl<$Res, $Val extends SugarLogModel>
    implements $SugarLogModelCopyWith<$Res> {
  _$SugarLogModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SugarLogModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sugarLevel = null,
    Object? timestamp = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      sugarLevel: null == sugarLevel
          ? _value.sugarLevel
          : sugarLevel // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SugarLogModelImplCopyWith<$Res>
    implements $SugarLogModelCopyWith<$Res> {
  factory _$$SugarLogModelImplCopyWith(
          _$SugarLogModelImpl value, $Res Function(_$SugarLogModelImpl) then) =
      __$$SugarLogModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double sugarLevel, DateTime timestamp, String type});
}

/// @nodoc
class __$$SugarLogModelImplCopyWithImpl<$Res>
    extends _$SugarLogModelCopyWithImpl<$Res, _$SugarLogModelImpl>
    implements _$$SugarLogModelImplCopyWith<$Res> {
  __$$SugarLogModelImplCopyWithImpl(
      _$SugarLogModelImpl _value, $Res Function(_$SugarLogModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SugarLogModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sugarLevel = null,
    Object? timestamp = null,
    Object? type = null,
  }) {
    return _then(_$SugarLogModelImpl(
      sugarLevel: null == sugarLevel
          ? _value.sugarLevel
          : sugarLevel // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SugarLogModelImpl implements _SugarLogModel {
  const _$SugarLogModelImpl(
      {required this.sugarLevel, required this.timestamp, required this.type});

  factory _$SugarLogModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SugarLogModelImplFromJson(json);

  @override
  final double sugarLevel;
  @override
  final DateTime timestamp;
  @override
  final String type;

  @override
  String toString() {
    return 'SugarLogModel(sugarLevel: $sugarLevel, timestamp: $timestamp, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SugarLogModelImpl &&
            (identical(other.sugarLevel, sugarLevel) ||
                other.sugarLevel == sugarLevel) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, sugarLevel, timestamp, type);

  /// Create a copy of SugarLogModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SugarLogModelImplCopyWith<_$SugarLogModelImpl> get copyWith =>
      __$$SugarLogModelImplCopyWithImpl<_$SugarLogModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SugarLogModelImplToJson(
      this,
    );
  }
}

abstract class _SugarLogModel implements SugarLogModel {
  const factory _SugarLogModel(
      {required final double sugarLevel,
      required final DateTime timestamp,
      required final String type}) = _$SugarLogModelImpl;

  factory _SugarLogModel.fromJson(Map<String, dynamic> json) =
      _$SugarLogModelImpl.fromJson;

  @override
  double get sugarLevel;
  @override
  DateTime get timestamp;
  @override
  String get type;

  /// Create a copy of SugarLogModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SugarLogModelImplCopyWith<_$SugarLogModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
