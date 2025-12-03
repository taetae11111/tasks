import 'package:tasks/domain/model/to_do_model.dart';

abstract class IToDoRepository {
  Future<List<ToDoModel>> getInitialToDos();
  Future<List<ToDoModel>> getMoreToDos();
  Future<List<ToDoModel>> reload();

  Future<void> addToDo(ToDoModel toDo);
  Future<void> updateToDo(String id, Map<String, dynamic> data);
  Future<void> deleteToDo(String id);
}
