import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_practice/route/todo_list/todo_list_route_controller.dart';

class TodoWidget extends StatefulWidget {
  const TodoWidget({super.key});

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Get.find<TodoListRouteController>().tasks.length,
      itemBuilder: (context, index) {
        final task = Get.find<TodoListRouteController>().tasks[index];
        return Row(
          children: [
            Text(task.title),
            task.detail != null ? Text(task.detail!) : const Text(''),
          ],
        );
      },
    );
  }
}
