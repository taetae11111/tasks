import 'package:freezed_annotation/freezed_annotation.dart';

part 'to_do_model.freezed.dart';

@freezed
abstract class ToDoModel with _$ToDoModel {
  const factory ToDoModel({
    required String id,
    required String title,
    String? description,
    required bool isFavorite,
    required bool isDone,
    required DateTime createdAt,
  }) = _ToDoModel;

  const ToDoModel._();

  void validate() {
    assert(title.trim().isNotEmpty, 'title cannot be empty!');
    assert(description == null || description!.trim().length <= 500);
  }
}
