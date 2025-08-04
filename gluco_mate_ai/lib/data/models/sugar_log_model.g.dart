// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sugar_log_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SugarLogModelImpl _$$SugarLogModelImplFromJson(Map<String, dynamic> json) =>
    _$SugarLogModelImpl(
      sugarLevel: (json['sugarLevel'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      type: json['type'] as String,
    );

Map<String, dynamic> _$$SugarLogModelImplToJson(_$SugarLogModelImpl instance) =>
    <String, dynamic>{
      'sugarLevel': instance.sugarLevel,
      'timestamp': instance.timestamp.toIso8601String(),
      'type': instance.type,
    };
