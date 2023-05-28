enum Category { mySelf, home, work, relationShip }

class Todo {
  Todo({
    required this.category,
    required this.id,
    required this.text,
    required this.isDone,
  });

  final String id;
  final String text;
  final bool isDone;
  final Category category;
}
