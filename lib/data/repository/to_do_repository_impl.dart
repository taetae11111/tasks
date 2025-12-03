import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tasks/data/dto/to_do_dto.dart';
import 'package:tasks/data/mapper/to_do_mapper.dart';
import 'package:tasks/domain/model/to_do_model.dart';
import 'package:tasks/domain/repository/to_do_repository.dart';

part 'to_do_repository_impl.g.dart';

class ToDoRepositoryImpl implements IToDoRepository {
  final db = FirebaseFirestore.instance;
  DocumentSnapshot? lastDoc;

  @override
  Future<List<ToDoModel>> getInitialToDos() async {
    final snapshot = await db
        .collection('Todos')
        .orderBy('createdAt', descending: true)
        .limit(15)
        .get();

    if (snapshot.docs.isNotEmpty) lastDoc = snapshot.docs.last;

    return snapshot.docs.map((doc) {
      final data = doc.data();
      data['id'] ??= doc.id;
      return ToDoDto.fromJson(data).toDomain();
    }).toList();
  }

  @override
  Future<List<ToDoModel>> getMoreToDos() async {
    if (lastDoc == null) return [];

    final snapshot = await db
        .collection('Todos')
        .orderBy('createdAt', descending: true)
        .startAfterDocument(lastDoc!)
        .limit(15)
        .get();

    if (snapshot.docs.isNotEmpty) lastDoc = snapshot.docs.last;

    return snapshot.docs.map((doc) {
      final data = doc.data();
      data['id'] ??= doc.id;
      return ToDoDto.fromJson(data).toDomain();
    }).toList();
  }

  @override
  Future<List<ToDoModel>> reload() async {
    lastDoc = null;
    return await getInitialToDos();
  }

  @override
  Future<void> addToDo(ToDoModel model) async {
    final dto = model.toDto();
    final docRef = await db.collection('Todos').add(dto.toJson());
    await db.collection('Todos').doc(docRef.id).update({'id': docRef.id});
  }

  @override
  Future<void> updateToDo(String id, Map<String, dynamic> data) async {
    await db.collection('Todos').doc(id).update(data);
  }

  @override
  Future<void> deleteToDo(String id) async {
    await db.collection('Todos').doc(id).delete();
  }
}

@riverpod
IToDoRepository todoRepository(ref) {
  return ToDoRepositoryImpl();
}
