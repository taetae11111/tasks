import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tasks/core/theme/app_theme.dart';
import 'package:tasks/domain/model/to_do_model.dart';

class ToDoView extends StatelessWidget {
  const ToDoView({
    super.key,
    required this.toDo,
    required this.onToggleFavorite,
    required this.onToggleDone,
    required this.onDelete,
  });
  final ToDoModel toDo;
  final VoidCallback onToggleFavorite;
  final VoidCallback onToggleDone;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: vrc(context).background200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: onToggleDone,
            child: SizedBox(
              width: 40,
              height: 40,
              child: Center(
                child: Icon(
                  toDo.isDone
                      ? Icons.check_circle_rounded
                      : Icons.circle_outlined,
                ),
              ),
            ),
          ),
          SizedBox(width: 1),
          Expanded(
            child: InkWell(
              onTap: () {
                context.go('/detail', extra: toDo);
              },
              child: Hero(
                tag: "title-${toDo.id}",
                child: Text(
                  toDo.title,
                  style: TextStyle(
                    color: vrc(context).textColor200,
                    fontSize: 16,
                    decoration: toDo.isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: onToggleFavorite,
            child: SizedBox(
              width: 40,
              height: 40,
              child: Center(
                child: Icon(
                  toDo.isFavorite
                      ? Icons.star_rounded
                      : Icons.star_border_rounded,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: onDelete,
            child: SizedBox(
              width: 40,
              height: 40,
              child: Center(
                child: Icon(
                  Icons.delete_rounded
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
