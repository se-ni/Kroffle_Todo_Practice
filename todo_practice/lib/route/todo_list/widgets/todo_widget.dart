import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_practice/model/task_model.dart';
import 'package:todo_practice/route/todo_list/todo_list_route_controller.dart';
import 'package:get/get.dart';

class TodoWidget extends StatefulWidget {
  const TodoWidget({super.key});

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  @override
  Widget build(BuildContext context) {
    final controller =
        Get.find<TodoListRouteController>(); // GetX controller 접근

    return Column(
      children: [
        // 필터링 버튼

        // 필터링된 태스크 목록 표시
        Expanded(
          child: ListView.builder(
            itemCount: controller.filteredTasks.length,
            itemBuilder: (context, index) {
              final task = controller.filteredTasks[index];
              return Column(
                children: [
                  Row(
                    children: [
                      // 태스크 상태 변경을 위한 드롭다운 버튼
                      DropdownButton<Status>(
                        value: task.taskStatus,
                        onChanged: (Status? newValue) {
                          setState(() {
                            controller.updateTaskStatus(
                                task, newValue!); // 상태 변경 후 UI 업데이트
                          });
                        },
                        items: Status.values
                            .map<DropdownMenuItem<Status>>((Status value) {
                          return DropdownMenuItem<Status>(
                            value: value,
                            child: Text(value.toString().split('.').last),
                          );
                        }).toList(),
                      ),
                      Expanded(child: Text('${task.title} : ', softWrap: true)),
                      task.detail != null
                          ? Text(task.detail!, softWrap: true)
                          : const Text(''),
                      Expanded(
                          child: Text(
                              DateFormat('yyyy-MM-dd').format(task.createdAt))),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            controller.removeTask(task); // task 삭제 후 UI 갱신
                          });
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
