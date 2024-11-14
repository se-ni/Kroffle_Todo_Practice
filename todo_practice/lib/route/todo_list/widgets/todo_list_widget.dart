import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_practice/route/todo_list/todo_list_route_controller.dart';

class TodoListWidget extends StatefulWidget {
  const TodoListWidget({super.key});

  @override
  State<TodoListWidget> createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  @override
  Widget build(BuildContext context) {
    return const Text('todo widget');
  }
}
