import 'package:flutter/material.dart';
import 'package:todo_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(104, 82, 76, 186)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
