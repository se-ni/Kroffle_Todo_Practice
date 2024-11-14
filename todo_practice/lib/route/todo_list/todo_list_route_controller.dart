import 'package:get/get.dart';
import 'package:todo_practice/model/task_model.dart';

class TodoListRouteController extends GetxController {
  List<TaskModel> models = [];

  // 할일 만들기 버튼 눌렀을때 상태
  bool isClicked = false;

  // 할일 작성 후 완료 버튼 눌렀을때 상태
  bool? isComplete;

  // plus 버튼 눌렀을때 상태 변화
  void clickedPlus() {
    isClicked = true;
    update();
  }

  void reClickedPlus() {
    isClicked = false;
    update();
  }
}
