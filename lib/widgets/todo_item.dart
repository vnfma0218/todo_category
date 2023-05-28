import 'package:flutter/material.dart';
import 'package:todo_app/models/Todo.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({super.key, required this.text, required this.category});
  final String text;
  final Category category;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  final _selectedMenu = 'test1';
  static const List<String> list = <String>['test1', 'test2'];

  @override
  Widget build(BuildContext context) {
    return Card(
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
                PopupMenuButton(
                  itemBuilder: (ctx) {
                    return [
                      const PopupMenuItem(child: Text('text1')),
                      const PopupMenuItem(child: Text('text2')),
                    ];
                  },
                )
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              widget.category.name.toUpperCase(),
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
    );
  }
}
