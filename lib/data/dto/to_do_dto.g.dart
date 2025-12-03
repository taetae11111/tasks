// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'to_do_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ToDoDto _$ToDoDtoFromJson(Map<String, dynamic> json) => _ToDoDto(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String?,
  isFavorite: json['isFavorite'] as bool? ?? false,
  isDone: json['isDone'] as bool? ?? false,
  createdAt: const TimestampConverter().fromJson(json['createdAt']),
);

Map<String, dynamic> _$ToDoDtoToJson(_ToDoDto instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'isFavorite': instance.isFavorite,
  'isDone': instance.isDone,
  'createdAt': const TimestampConverter().toJson(instance.createdAt),
};
