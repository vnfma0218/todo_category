import 'package:flutter/material.dart';

class NewTodo extends StatefulWidget {
  const NewTodo({required this.onSubmitTodo, super.key});

  final Function(String text) onSubmitTodo;
  @override
  State<NewTodo> createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  final todoController = TextEditingController();
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
        children: [
          TextField(
            controller: todoController,
            decoration: const InputDecoration(
                labelText: '할일을 등록해주세요',
                labelStyle: TextStyle(
                  fontSize: 13,
                )),
            onSubmitted: (text) => widget.onSubmitTodo(text),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Spacer(),
              ElevatedButton(
                onPressed: () => widget.onSubmitTodo(todoController.text),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                child: const Text('등록'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
