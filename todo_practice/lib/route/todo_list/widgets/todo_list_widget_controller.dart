import 'package:get/get.dart';
import 'package:todo_practice/model/task_model.dart';
import 'package:todo_practice/route/todo_list/todo_list_route_controller.dart';

class TodoListWidgetController extends GetxController {
  final todoListRouteController = TodoListRouteController();

  late TaskModel newTask;

  // task 생성하기
  TaskModel createTask(String title) {
    newTask = TaskModel(title: title, createdAt: DateTime.now());
    update();
    return newTask;
  }

  // detail 있는 task 생성하기
  TaskModel createDetailTask(String title, String detail) {
    newTask =
        TaskModel(title: title, detail: detail, createdAt: DateTime.now());
    update();
    return newTask;
  }
}
