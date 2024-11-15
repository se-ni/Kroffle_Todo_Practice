import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_practice/model/task_model.dart';
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
        List<TaskModel> tasks = controller.tasks; // tasks 리스트 가져오기
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
                      icon: const Icon(Icons.add_circle),
                    ),
                  ],
                ),
                if (tasks.isEmpty) const Text('할일이 없습니다.'),
                if (tasks.isNotEmpty)
                  ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        final task = tasks[index];
                        return ListTile(
                            title: Text(task.title),
                            subtitle: task.detail != null
                                ? Text(task.detail!)
                                : const Text('s'));
                      })
              ],
            ),
          ),
        );
      },
    );
  }
}
