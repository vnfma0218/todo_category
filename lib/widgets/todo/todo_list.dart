import 'package:flutter/material.dart';
import 'package:todo_app/models/Todo.dart';
import 'package:todo_app/widgets/todo/todo_item.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
    required this.todoList,
    required this.onChangeIsDone,
    required this.currentFilter,
  });
  final List<Todo> todoList;
  final FilterStatus currentFilter;
  final void Function(bool isDone, String id) onChangeIsDone;

  @override
  Widget build(BuildContext context) {
    List<Todo> filteredTodoList = [];
    if (currentFilter == FilterStatus.active) {
      filteredTodoList = todoList.where((element) {
        return !element.isDone;
      }).toList();
    } else {
      filteredTodoList = todoList.where((element) {
        return element.isDone;
      }).toList();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: ListView.builder(
          itemCount: filteredTodoList.length,
          itemBuilder: (BuildContext ctx, int index) {
            return TodoItem(
              text: filteredTodoList[index].text,
              category: filteredTodoList[index].category,
              id: filteredTodoList[index].id,
              isDone: filteredTodoList[index].isDone,
              onChangeIsDone: onChangeIsDone,
              description: filteredTodoList[index].description,
            );
          }),
    );
  }
}
