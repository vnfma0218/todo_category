import 'package:flutter/material.dart';
import 'package:todo_app/models/Category.dart';
import 'package:todo_app/widgets/todo/todo_item_detail.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({
    super.key,
    required this.text,
    required this.category,
    required this.id,
    required this.isDone,
    required this.description,
    required this.onChangeIsDone,
  });
  final String id;
  final String text;
  final String description;
  final bool isDone;
  final Category category;
  final void Function(bool isDone, String id) onChangeIsDone;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  final _selectedMenu = 'test1';
  static const List<String> list = <String>['test1', 'test2'];

  void _showDetailModal() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => TodoItemDetail(
        text: widget.text,
        category: widget.category,
        id: widget.id,
        isDone: widget.isDone,
        onChangeIsDone: widget.onChangeIsDone,
        description: widget.description,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _showDetailModal,
      child: Card(
        color: widget.category.color,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton.outlined(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                    ),
                  ),
                  const Spacer(),
                  if (widget.isDone) const Icon(Icons.check)
                  // PopupMenuButton(
                  //   itemBuilder: (ctx) {
                  //     return [
                  //       const PopupMenuItem(child: Text('text1')),
                  //       const PopupMenuItem(child: Text('text2')),
                  //     ];
                  //   },
                  // )
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              Text(
                widget.category.title.toUpperCase(),
                style: const TextStyle(
                  fontSize: 11,
                ),
              ),
              Text(
                widget.text,
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
