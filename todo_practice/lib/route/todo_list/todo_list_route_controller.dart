import 'package:get/get.dart';
import 'package:todo_practice/model/task_model.dart';

class TodoListRouteController extends GetxController {
  List<TaskModel> tasks = [];

  // TaskModel을 리스트에 추가하는 함수
  void addTask(TaskModel newTask) {
    tasks.add(newTask); // 새로운 할 일을 리스트에 추가
    // ignore: avoid_print
    print("Task added: ${newTask.title}, ${newTask.detail}");

    // 리스트 변경 시 디버그 출력
    // ignore: avoid_print
    print("Current tasks:");
    for (var task in tasks) {
      // ignore: avoid_print
      print("Title: ${task.title}, Detail: ${task.detail ?? 'No details'}");
    }

    update(); // 상태 갱신
  }
}
