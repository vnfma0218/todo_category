import 'package:flutter/material.dart';
import 'package:todo_app/data/categoryData.dart';
import 'package:todo_app/models/Category.dart';

class NewTodo extends StatefulWidget {
  const NewTodo({required this.onSubmitTodo, super.key});

  final Function(String text, Category category, String description)
      onSubmitTodo;
  @override
  State<NewTodo> createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  final todoController = TextEditingController();
  final descController = TextEditingController();
  Category _selectedCategory = categoryData.first;
  @override
  void dispose() {
    todoController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).copyWith().highlightColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            TextField(
              controller: todoController,
              decoration: const InputDecoration(
                labelText: '할일을 등록해주세요',
                labelStyle: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 4,
              controller: descController,
              decoration: InputDecoration(
                labelText: '상세내용을 입력해주세요',
                labelStyle: const TextStyle(
                  fontSize: 20,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            DropdownButton(
              value: _selectedCategory,
              items: categoryData
                  .map(
                    (category) => DropdownMenuItem(
                        value: category,
                        child: Text(
                          category.title.toUpperCase(),
                        )),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  if (value == null) {
                    return;
                  }
                  _selectedCategory = value;
                });
              },
            ),
            Row(
              children: [
                const Spacer(),
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('닫기'),
                ),
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                  onPressed: () => widget.onSubmitTodo(todoController.text,
                      _selectedCategory, descController.text),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: const Text('등록'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
