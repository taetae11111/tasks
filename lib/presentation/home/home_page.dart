import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasks/core/responsive/responsive_layout.dart';
import 'package:tasks/core/theme/app_theme.dart';// ★ 추가
import 'package:tasks/domain/model/to_do_model.dart';
import 'package:tasks/presentation/home/view_model/home_view_model.dart';
import 'package:tasks/presentation/home/widgets/add_to_do_dialog.dart';
import 'package:tasks/presentation/home/widgets/no_to_do.dart';
import 'package:tasks/presentation/home/widgets/to_do_view.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toDoAsync = ref.watch(homeViewModelProvider);
    final viewModelNotifier = ref.read(homeViewModelProvider.notifier);

    final isFetchingMore = viewModelNotifier.isFetchingMore;
    final hasMoreData = viewModelNotifier.hasMoreData;

    final controller = useScrollController();

    useEffect(() {
      void scrollListener() {
        if (controller.position.pixels >=
            controller.position.maxScrollExtent - 200) {
          viewModelNotifier.loadMore();
        }
      }

      controller.addListener(scrollListener);

      return () => controller.removeListener(scrollListener);
    }, [controller, viewModelNotifier]);

    Future<void> refreshList() async {
      await Future.delayed(const Duration(milliseconds: 300));
      await viewModelNotifier.reload();
    }

    return Scaffold(
      backgroundColor: vrc(context).background300,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: vrc(context).background200,
        scrolledUnderElevation: 0,
        title: Text(
          title,
          style: TextStyle(
            color: vrc(context).textColor200,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ResponsiveView( // ★★★ 추가된 부분 (기존 모든 구조 그대로 유지)
        pc1024: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: _originalBody(
              toDoAsync: toDoAsync,
              refreshList: refreshList,
              controller: controller,
              viewModelNotifier: viewModelNotifier,
              title: title,
              isFetchingMore: isFetchingMore,
              hasMoreData: hasMoreData,
            ),
          ),
        ),
        tablet768: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: _originalBody(
              toDoAsync: toDoAsync,
              refreshList: refreshList,
              controller: controller,
              viewModelNotifier: viewModelNotifier,
              title: title,
              isFetchingMore: isFetchingMore,
              hasMoreData: hasMoreData,
            ),
          ),
        ),
        smallTablet600: _originalBody(
          toDoAsync: toDoAsync,
          refreshList: refreshList,
          controller: controller,
          viewModelNotifier: viewModelNotifier,
          title: title,
          isFetchingMore: isFetchingMore,
          hasMoreData: hasMoreData,
        ),
        mobileLandscape480: _originalBody(
          toDoAsync: toDoAsync,
          refreshList: refreshList,
          controller: controller,
          viewModelNotifier: viewModelNotifier,
          title: title,
          isFetchingMore: isFetchingMore,
          hasMoreData: hasMoreData,
        ),
        mobile: _originalBody(
          toDoAsync: toDoAsync,
          refreshList: refreshList,
          controller: controller,
          viewModelNotifier: viewModelNotifier,
          title: title,
          isFetchingMore: isFetchingMore,
          hasMoreData: hasMoreData,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: fxc(context).brandColor,
        shape: const CircleBorder(),
        onPressed: () async {
          final newTodo = await showModalBottomSheet<ToDoModel>(
            context: context,
            builder: (context) => const AddToDoDialog(),
          );
          if (newTodo != null) {
            viewModelNotifier.addTodo(toDo: newTodo);
          }
        },
        tooltip: 'Add Todo',
        child: const Icon(Icons.add_rounded, size: 24),
      ),
    );
  }

  // ⭐ 기존 body 구조 100% 그대로 분리
  Widget _originalBody({
    required AsyncValue<List<ToDoModel>> toDoAsync,
    required Future<void> Function() refreshList,
    required ScrollController controller,
    required HomeViewModel viewModelNotifier,
    required String title,
    required bool isFetchingMore,
    required bool hasMoreData,
  }) {
    return toDoAsync.when(
      data: (todos) {
        final showLoadingIndicator = isFetchingMore && hasMoreData;
        final itemCount = todos.length + (showLoadingIndicator ? 1 : 0);

        return todos.isEmpty && !showLoadingIndicator
            ? NoToDo(title: title)
            : RefreshIndicator(
                onRefresh: refreshList,
                child: ListView.builder(
                  controller: controller,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  itemCount: itemCount,
                  itemBuilder: (context, index) {
                    if (index == todos.length) {
                      return const Padding(
                        padding: EdgeInsets.all(16.0),
                        child:
                            Center(child: CircularProgressIndicator.adaptive()),
                      );
                    }

                    final todo = todos[index];
                    return ToDoView(
                      toDo: todo,
                      onToggleFavorite: () => viewModelNotifier.toggleFavorite(
                        id: todo.id,
                        isFavorite: todo.isFavorite,
                      ),
                      onToggleDone: () => viewModelNotifier.toggleDone(
                        id: todo.id,
                        isDone: todo.isDone,
                      ),
                      onDelete: () =>
                          viewModelNotifier.deleteToDo(id: todo.id),
                    );
                  },
                ),
              );
      },
      error: (error, stackTrace) =>
          Center(child: Text('Error: $error')),
      loading: () =>
          const Center(child: CircularProgressIndicator.adaptive()),
    );
  }
}
