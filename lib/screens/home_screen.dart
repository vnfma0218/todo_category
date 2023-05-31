import 'package:flutter/material.dart';
import 'package:todo_app/models/Category.dart';
import 'package:todo_app/models/Todo.dart';
import 'package:todo_app/screens/todo_list_screen.dart';
import 'package:todo_app/widgets/new_todo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final List<Todo> _todoList = [];
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _submitTodo(String text, Category category, String description) {
    if (text.isEmpty) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error,
                    color: Color.fromARGB(221, 230, 52, 39),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    '안내',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              content: const Text('내용은 필수 입력사항입니다.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('확인'),
                ),
              ],
            );
          });
    } else {
      final newTodo = Todo(
        id: (_todoList.length + 1).toString(),
        isDone: false,
        text: text,
        category: category,
        description: description,
      );

      setState(() {
        _todoList.add(newTodo);
      });

      Navigator.of(context).pop();
    }
  }

  void _showBottomSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return NewTodo(
            onSubmitTodo: _submitTodo,
          );
        });
  }

  void _onChangeIsDone(
    bool isDone,
    String id,
  ) {
    final todoIdx = _todoList.indexWhere((element) => element.id == id);
    final newTodo = Todo(
      category: _todoList[todoIdx].category,
      text: _todoList[todoIdx].text,
      id: _todoList[todoIdx].id,
      description: _todoList[todoIdx].description,
      isDone: isDone,
    );
    setState(() {
      _todoList[todoIdx] = newTodo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: const Text(
            'My Todo App',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.add_circle,
                color: Colors.white,
                size: 35,
              ),
              tooltip: 'Show Snackbar',
              onPressed: _showBottomSheet,
            ),
          ],
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Good',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              const Text(
                'Morning!',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TabBar(
                controller: _tabController,
                tabs: const <Widget>[
                  Tab(
                    child: Text(
                      'Tasks',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Boards',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    TodoListScreen(
                        todoList: _todoList, onChangeIsDone: _onChangeIsDone),
                    const Card(
                      margin: EdgeInsets.all(16.0),
                      child: Center(child: Text(' Specifications tab')),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
