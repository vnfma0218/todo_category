import 'package:flutter/material.dart';
import 'package:todo_app/data/categoryData.dart';
import 'package:todo_app/models/Category.dart';
import 'package:todo_app/models/Todo.dart';
import 'package:todo_app/widgets/category/category_list.dart';
import 'package:todo_app/widgets/todo/new_todo.dart';

import '../widgets/todo/todo_list.dart';

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
    String totalTodo = '0';
    if (_todoList.isNotEmpty) {
      totalTodo = _todoList.length.toString();
    }
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
                tabs: <Widget>[
                  Tab(
                    child: Row(
                      children: [
                        Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 1)),
                          child: Center(
                              child: Text(
                            totalTodo,
                            style: const TextStyle(color: Colors.white),
                          )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Tasks',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: [
                        Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 1)),
                          child: Center(
                              child: Text(
                            categoryData.length.toString(),
                            style: const TextStyle(color: Colors.white),
                          )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Boards',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    TodoList(
                        todoList: _todoList, onChangeIsDone: _onChangeIsDone),
                    CategoryList(
                      todoList: _todoList,
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
