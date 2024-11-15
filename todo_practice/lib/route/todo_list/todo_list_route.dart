import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_practice/model/task_model.dart';
import 'package:todo_practice/route/todo_list/todo_list_route_controller.dart';
import 'package:todo_practice/route/todo_list/widgets/todo_list_widget.dart';
import 'package:todo_practice/route/todo_list/widgets/todo_widget.dart';

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
      init: TodoListRouteController(),
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
                    // 필터 버튼
                    TextButton(
                      onPressed: () {
                        controller.setFilter(Status.notStarted);
                        controller.update();
                      },
                      child: Text('not started'),
                    ),
                    TextButton(
                      onPressed: () {
                        controller.setFilter(Status.progress);
                        controller.update();
                      },
                      child: Text('progress'),
                    ),
                    TextButton(
                      onPressed: () {
                        controller.setFilter(Status.end);
                        controller.update();
                      },
                      child: Text('end'),
                    ),
                  ],
                ),
                Divider(
                  thickness: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('할일 만들기'),
                    IconButton(
                      onPressed: () {
                        Get.dialog(
                          const Dialog(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            child: TodoListWidget(),
                          ),
                        ).then((newTask) => {
                              controller.addTask(newTask),
                              Get.back(),
                            });
                      },
                      icon: const Icon(Icons.add_circle),
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    width: 400,
                    height: 500,
                    child: Builder(
                      builder: (context) {
                        if (controller.filteredTasks.isEmpty) {
                          return const Text('할일이 없습니다.');
                        } else {
                          return const TodoWidget(); // 필터링된 태스크를 표시
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
