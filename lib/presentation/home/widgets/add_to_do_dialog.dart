import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasks/core/theme/app_theme.dart';
import 'package:tasks/core/utils/use_debounce.dart';
import 'package:tasks/domain/model/to_do_model.dart';

class AddToDoDialog extends HookConsumerWidget {
  const AddToDoDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController();
    final descController = useTextEditingController();
    final focusNode = useFocusNode();
    final isFavorite = useState(false);
    final isDescriptionActivated = useState(false);

    final debounce = useDebounce(
      duration: Duration(milliseconds: 400), 
      onDebounce: (){
        print('${titleController.text}');
      }
    );

    void saveToDo() {
      final title = titleController.text.trim();
      final description = descController.text.trim().isEmpty
          ? null
          : descController.text.trim();
      if (title.isNotEmpty) {
        final result = ToDoModel(
          id: '',
          title: title,
          description: description,
          isFavorite: isFavorite.value,
          isDone: false,
          createdAt: DateTime.now(), 
        );
        Navigator.of(context).pop(result);
      } else {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
              '할 일을 입력해주세요.',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red.withValues(alpha: 0.8),
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: vrc(context).background100,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        ),
        padding: EdgeInsets.fromLTRB(
          20,
          12,
          20,
          MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 기존 첫 번째 TextField
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '새 할 일',
                hintStyle: TextStyle(
                  color: vrc(context).textColor100,
                  fontSize: 16,
                ),
              ),
              style: TextStyle(color: vrc(context).textColor200, fontSize: 16),
              maxLines: 1,
              autofocus: true,
              focusNode: focusNode,
              keyboardType: TextInputType.text,
              onSubmitted: (_) => saveToDo(),
              onChanged: (_) => debounce(), // Hook에서는 setState 불필요
            ),

            // 두 번째 TextField (세부정보)
            if (isDescriptionActivated.value)
              TextField(
                controller: descController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: '세부정보 추가',
                ),
                maxLines: null,
                keyboardType: TextInputType.multiline,
              ),

            // 하단 버튼 영역
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                spacing: 12,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 12,
                    children: [
                      if (!isDescriptionActivated.value)
                        InkWell(
                          onTap: () => isDescriptionActivated.value = true,
                          child: const SizedBox(
                            width: 40,
                            height: 40,
                            child: Center(
                              child: Icon(Icons.short_text_rounded, size: 24),
                            ),
                          ),
                        ),
                      InkWell(
                        onTap: () => isFavorite.value = !isFavorite.value,
                        child: SizedBox(
                          width: 40,
                          height: 40,
                          child: Center(
                            child: Icon(
                              isFavorite.value
                                  ? Icons.star_rounded
                                  : Icons.star_border_rounded,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: saveToDo,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      child: Text(
                        '저장',
                        style: TextStyle(
                          color: titleController.text.trim().isNotEmpty
                              ? vrc(context).textColor200
                              : vrc(context).textColor100,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


