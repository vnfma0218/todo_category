import 'package:flutter/material.dart';
import 'package:todo_app/models/Todo.dart';

class NewTodo extends StatefulWidget {
  const NewTodo({required this.onSubmitTodo, super.key});

  final Function(String text, Category category) onSubmitTodo;
  @override
  State<NewTodo> createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  final todoController = TextEditingController();
  var _selectedCategory = Category.mySelf;
  @override
  void dispose() {
    todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: todoController,
            decoration: const InputDecoration(
                labelText: '할일을 등록해주세요',
                labelStyle: TextStyle(
                  fontSize: 13,
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          DropdownButton(
            value: _selectedCategory,
            items: Category.values
                .map(
                  (category) => DropdownMenuItem(
                      value: category,
                      child: Text(
                        category.name.toUpperCase(),
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
                onPressed: () =>
                    widget.onSubmitTodo(todoController.text, _selectedCategory),
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
    );
  }
}
