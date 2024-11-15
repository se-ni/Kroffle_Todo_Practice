import 'package:get/get.dart';
import 'package:todo_practice/model/task_model.dart';

class TodoListRouteController extends GetxController {
  List<TaskModel> tasks = [];
  Status? selectedStatus;

  // TaskModel을 리스트에 추가하는 함수
  void addTask(TaskModel newTask) {
    tasks.add(newTask); // 새로운 할 일을 리스트에 추가
    update(); // 상태 갱신
  }

  void removeTask(TaskModel task) {
    tasks.remove(task);
    update(); // 상태 갱신
  }

  // 필터링된 태스크 목록을 반환하는 함수
  List<TaskModel> get filteredTasks {
    if (selectedStatus == null) {
      return tasks; // 필터가 없으면 모든 태스크 반환
    } else {
      return tasks.where((task) => task.taskStatus == selectedStatus).toList();
    }
  }

  // 필터 상태를 변경하는 함수
  void setFilter(Status? status) {
    selectedStatus = status;
    update(); // 필터 상태 변경 후 UI 갱신
  }

  // 태스크 상태 업데이트 함수
  void updateTaskStatus(TaskModel task, Status status) {
    task.taskStatus = status;
    update(); // 상태 변경 후 UI 갱신
  }
}
