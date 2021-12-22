
import 'package:flutter/material.dart';
import 'package:todo_app/Todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Todo App', home: Todo());
  }
}
