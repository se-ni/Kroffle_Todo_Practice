import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_practice/route/todo_list/todo_list_route_controller.dart';
import 'package:todo_practice/route/todo_list/widgets/todo_list_widget.dart';

class TodoListRoute extends StatefulWidget {
  const TodoListRoute({super.key});

  @override
  State<TodoListRoute> createState() => _TodoListRouteState();
}

class _TodoListRouteState extends State<TodoListRoute> {
  @override
  void initState() {
    super.initState();
    Get.put(TodoListRouteController());
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodoListRouteController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Todo APP'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('할일 만들기'),
                    IconButton(
                        onPressed: () {
                          //controller.onClickAddButton();
                          Get.dialog(
                            const Dialog(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              child: TodoListWidget(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.add_circle)),
                  ],
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                  width: 100,
                  height: 600,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
