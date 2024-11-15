import 'package:get/get.dart';
import 'package:todo_practice/model/task_model.dart';

class TodoListRouteController extends GetxController {
  List<TaskModel> tasks = [];

  // 할일 작성 후 완료 버튼 눌렀을때 상태
  bool isComplete = false;

  // TaskModel을 리스트에 추가하는 함수
  void addTask(TaskModel newTask) {
    tasks.add(newTask); // 새로운 할 일 리스트에 추가
    update();
  }

  // void onClickAddButton() {
  //   isClicked = !isClicked;
  //   print(isClicked);
  //   update();
  // }
}
