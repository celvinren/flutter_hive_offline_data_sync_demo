// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      id: json['id'] as String,
      title: json['title'] as String?,
      description: json['description'] as String?,
      isCompleted: json['isCompleted'] as bool?,
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      modifiedAt: json['modifiedAt'] == null
          ? null
          : DateTime.parse(json['modifiedAt'] as String),
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'isCompleted': instance.isCompleted,
      'completedAt': instance.completedAt?.toIso8601String(),
      'modifiedAt': instance.modifiedAt?.toIso8601String(),
    };
