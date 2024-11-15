import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_practice/model/task_model.dart';
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
        return Column(
          children: [
            Row(
              children: [
                // Status 업데이트를 위한 드롭다운 버튼
                // ! 드롭다운버튼 심화 학습 필요 !
                DropdownButton<Status>(
                  value: task.taskStatus,
                  onChanged: (Status? newValue) {
                    setState(() {
                      task.taskStatus = newValue!;
                      // 상태 바뀜
                      print('task.taskStatus' + task.taskStatus.toString());
                    });
                  },
                  items: Status.values
                      .map<DropdownMenuItem<Status>>((Status value) {
                    return DropdownMenuItem<Status>(
                      value: value,
                      child: Text(value
                          .toString()
                          .split('.')
                          .last), // "notStarted", "progress", "end"
                    );
                  }).toList(),
                ),
                Expanded(child: Text('${task.title} : ', softWrap: true)),
                task.detail != null
                    ? Text(task.detail!, softWrap: true)
                    : const Text(''),
                Expanded(
                    child:
                        Text(DateFormat('yyyy-MM-dd').format(task.createdAt))),
                IconButton(
                    onPressed: () {
                      // 리스트에서 task 삭제
                      Get.find<TodoListRouteController>().removeTask(task);
                    },
                    icon: const Icon(Icons.close)),
              ],
            ),
          ],
        );
      },
    );
  }
}
