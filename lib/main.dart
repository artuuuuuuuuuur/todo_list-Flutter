import 'package:flutter/material.dart';
import 'package:todo_list/todo_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-do List',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const TodoListPage(),
    );
  }
}
