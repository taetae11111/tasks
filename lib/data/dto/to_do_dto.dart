import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'to_do_dto.freezed.dart';
part 'to_do_dto.g.dart';

class TimestampConverter implements JsonConverter<DateTime, dynamic> {
  const TimestampConverter();

  @override
  DateTime fromJson(dynamic value) {
    if (value is Timestamp) return value.toDate();
    if (value is String) return DateTime.parse(value);
    return DateTime.now();
  }

  @override
  dynamic toJson(DateTime date) => Timestamp.fromDate(date);
}

@freezed
abstract class ToDoDto with _$ToDoDto{
  const factory ToDoDto({
    required String id,
    required String title,
    String? description,
    @Default(false) bool isFavorite,
    @Default(false) bool isDone,
    @TimestampConverter()
    required DateTime createdAt,
  }) = _ToDoDto;
  factory ToDoDto.fromJson(Map<String,dynamic>json) => _$ToDoDtoFromJson(json);
}
