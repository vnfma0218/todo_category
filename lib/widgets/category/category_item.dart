import 'package:flutter/material.dart';
import 'package:todo_app/models/Category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key, required this.category, required this.activeTasks});

  final Category category;
  final int activeTasks;

  @override
  Widget build(BuildContext context) {
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
            const Text(
              '5 active tasks',
              style: TextStyle(
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
