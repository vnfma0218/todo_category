import 'package:flutter/material.dart';
import 'package:todo_app/data/categoryData.dart';
import 'package:todo_app/models/Todo.dart';
import 'package:todo_app/widgets/category/category_item.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key, required this.todoList});

  final List<Todo> todoList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: categoryData.length,
        itemBuilder: (ctx, index) =>
            CategoryItem(category: categoryData[index], todoList: todoList));
  }
}
