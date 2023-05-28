import 'package:flutter/material.dart';
import 'package:todo_app/models/Todo.dart';
import 'package:todo_app/widgets/todo_item.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key, required this.todoList});
  final List<Todo> todoList;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 24,
        ),
        child: ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (BuildContext ctx, int index) {
              return TodoItem(
                text: todoList[index].text,
                category: todoList[index].category,
              );
            }));
  }
}
