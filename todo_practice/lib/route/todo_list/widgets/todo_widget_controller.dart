import 'package:get/get.dart';
import 'package:todo_practice/route/todo_list/todo_list_route_controller.dart';

enum filterStatus { all, notStarted, progress, end }

class TodoWidgetController extends GetxController {
  final todoListRouteController = TodoWidgetController();

  // 필터링 위한 변수 : 기본 값 all
  filterStatus filteredStatus = filterStatus.all;
}
