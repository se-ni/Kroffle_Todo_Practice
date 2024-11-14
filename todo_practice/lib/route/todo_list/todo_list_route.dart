import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_practice/route/todo_list/todo_list_route_controller.dart';
import 'package:todo_practice/route/todo_list/widgets/todo_list_widget.dart';

class TodoListRoute extends StatefulWidget {
  const TodoListRoute({super.key});

  @override
  State<TodoListRoute> createState() => _TodoListRouteState();
}

class _TodoListRouteState extends State<TodoListRoute> {
  final TodoListRouteController _todoListRouteController =
      Get.put(TodoListRouteController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodoListRouteController>(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Todo APP'),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('할일 만들기'),
                IconButton(
                    onPressed: () {
                      print(_todoListRouteController.isClicked);
                      // 처음 + 누르면,
                      if (!_todoListRouteController.isClicked) {
                        _todoListRouteController.clickedPlus(); // true 로 바꿔주고
                        print(_todoListRouteController.isClicked);
                        return;
                      }

                      _todoListRouteController.reClickedPlus();
                      print(_todoListRouteController.isClicked);
                    },
                    icon: const Icon(Icons.add_circle)),
              ],
            ),
            Builder(builder: (context) {
              if (_todoListRouteController.isClicked) {
                //TODO : panel 안에 TextField 띄우는거로 바꾸기
                return const TodoListWidget();
              }
              return const SizedBox();
            })
          ],
        ),
      );
    });
  }
}
