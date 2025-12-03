import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tasks/core/theme/app_theme.dart';
import 'package:tasks/domain/model/to_do_model.dart';

class ToDoDetailPage extends StatefulWidget {
  const ToDoDetailPage({
    super.key,
    required this.toDo,
    required this.onToggleFavorite,
  });
  final ToDoModel toDo;
  final VoidCallback onToggleFavorite;

  @override
  State<ToDoDetailPage> createState() => _ToDoDetailPageState();
}

class _ToDoDetailPageState extends State<ToDoDetailPage> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.toDo.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: vrc(context).background300,
      appBar: AppBar(
        backgroundColor: vrc(context).background200,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_rounded),
        ),
        title: Hero(
          tag: "title-${widget.toDo.id}",
          child: Text(
            widget.toDo.title,
            style: TextStyle(
              color: vrc(context).textColor200,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              setState(() {
                _isFavorite = !_isFavorite;
              });
              widget.onToggleFavorite();
            },
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              width: 48,
              height: 48,
              child: Center(
                child: Icon(
                  _isFavorite ? Icons.star_rounded : Icons.star_border_rounded,
                  size: 24,
                  color: vrc(context).textColor200,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: vrc(context).background300,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12,
              children: [
                Icon(
                  Icons.short_text_rounded,
                  size: 24,
                  color: vrc(context).textColor200,
                ),
                Expanded(
                  child: Text(
                    widget.toDo.description ?? '세부정보 추가',
                    style: TextStyle(
                      color: vrc(context).textColor200,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
