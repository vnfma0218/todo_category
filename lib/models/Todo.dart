import 'package:todo_app/models/Category.dart';

class Todo {
  Todo({
    required this.category,
    required this.id,
    required this.text,
    required this.isDone,
    required this.description,
  });

  final String id;
  final String text;
  final String description;
  final bool isDone;
  final Category category;
}
