import 'package:get/get.dart';
import 'package:todo_practice/model/task_model.dart';
import 'package:todo_practice/route/todo_list/todo_list_route_controller.dart';

class TodoListWidgetController extends GetxController {
  final todoListRouteController = TodoListRouteController();

  late TaskModel newTask;

  // 할일 작성 후 저장 상태
  bool isSaved = false;

  // 할일 작성 저장 버튼 눌렀을때
  void onClickSaveButton() {
    isSaved = true;
    update();
  }

  // task 생성하기
  void createTask(String title, String detail) {
    if (detail == null) {
      newTask = TaskModel(title: title, createdAt: DateTime.now());
    } else {
      newTask =
          TaskModel(title: title, detail: detail, createdAt: DateTime.now());
    }
    update();
  }

  // task 리스트에 저장하기
  void addTasktoList() {
    todoListRouteController.addTask(newTask);
  }
}
