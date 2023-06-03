import 'package:flutter/material.dart';
import 'package:todo_app/models/Category.dart';
import 'package:todo_app/models/Todo.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key, required this.category, required this.todoList});

  final List<Todo> todoList;
  final Category category;

  // // todo
// todo list를 가져와서 현재 카테고리랑 매핑되어있는 todo item 갯수를 가져온다
  @override
  Widget build(BuildContext context) {
    String activeTodoNums = '0';
    activeTodoNums = todoList
        .where(
          (element) => element.category == category,
        )
        .toList()
        .length
        .toString();
    return Card(
      color: category.color,
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
            Text(
              '$activeTodoNums active tasks',
              style: const TextStyle(
                fontSize: 11,
              ),
            ),
            Text(
              category.title,
              style: const TextStyle(
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
