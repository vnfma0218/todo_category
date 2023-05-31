import 'package:flutter/material.dart';
import 'package:todo_app/models/Todo.dart';
import 'package:todo_app/widgets/todo_item.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen(
      {super.key, required this.todoList, required this.onChangeIsDone});
  final List<Todo> todoList;
  final void Function(bool isDone, String id) onChangeIsDone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext ctx, int index) {
            return TodoItem(
              text: todoList[index].text,
              category: todoList[index].category,
              id: todoList[index].id,
              isDone: todoList[index].isDone,
              onChangeIsDone: onChangeIsDone,
              description: todoList[index].description,
            );
          }),
    );
  }
}
