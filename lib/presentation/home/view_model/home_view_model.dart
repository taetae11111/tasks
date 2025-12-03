import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tasks/data/repository/to_do_repository_impl.dart';
import 'package:tasks/domain/model/to_do_model.dart';
import 'package:tasks/domain/repository/to_do_repository.dart';

part 'home_view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  IToDoRepository get _repository => ref.read(todoRepositoryProvider);

  bool _isFetchingMore = false;
  bool get isFetchingMore => _isFetchingMore;

  bool _hasMoreData = true;
  bool get hasMoreData => _hasMoreData;

  @override
  Future<List<ToDoModel>> build() async {
    final initialList = await _repository.getInitialToDos();

    _hasMoreData = initialList.length >= 15;

    return initialList;
  }

  Future<void> reload() async {
    state = const AsyncLoading();

    final fresh = await _repository.reload();
    _hasMoreData = fresh.length >= 15;

    state = AsyncData(fresh);
  }

  Future<void> loadMore() async {
    if (state.isLoading || _isFetchingMore || !_hasMoreData) return;

    _isFetchingMore = true;
    ref.notifyListeners();

    final current = state.value ?? [];

    try {
      final more = await _repository.getMoreToDos();

      if (more.isEmpty) {
        _hasMoreData = false;
        return;
      }

      if (more.length < 15) _hasMoreData = false;

      state = AsyncData([...current, ...more]);
    } finally {
      _isFetchingMore = false;
      ref.notifyListeners();
    }
  }

  Future<void> addTodo({required ToDoModel toDo}) async {
    await _repository.addToDo(toDo);
    await reload();
  }

  Future<void> toggleFavorite({
    required String id,
    required bool isFavorite,
  }) async {
    await _repository.updateToDo(id, {'isFavorite': !isFavorite});
    await reload();
  }

  Future<void> toggleDone({
    required String id,
    required bool isDone,
  }) async {
    await _repository.updateToDo(id, {'isDone': !isDone});
    await reload();
  }

  Future<void> deleteToDo({required String id}) async {
    await _repository.deleteToDo(id);
    await reload();
  }
}
