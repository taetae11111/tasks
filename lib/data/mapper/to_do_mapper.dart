import 'package:tasks/data/dto/to_do_dto.dart';
import 'package:tasks/domain/model/to_do_model.dart';

extension ToDoDtoMapper on ToDoDto {
  /// DTO → Domain 변환
  ToDoModel toDomain() {
    return ToDoModel(
      id: id,
      title: title,
      description: description,
      isFavorite: isFavorite,
      isDone: isDone,
      createdAt: createdAt,
    );
  }
}

extension ToDoModelMapper on ToDoModel {
  /// Domain → DTO 변환
  ToDoDto toDto() {
    return ToDoDto(
      id: id,
      title: title,
      description: description,
      isFavorite: isFavorite,
      isDone: isDone,
      createdAt: createdAt,
    );
  }
}
