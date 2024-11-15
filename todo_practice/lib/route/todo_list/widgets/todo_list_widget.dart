import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_practice/model/task_model.dart';
import 'package:todo_practice/route/todo_list/widgets/todo_list_widget_controller.dart';

class TodoListWidget extends StatefulWidget {
  const TodoListWidget({super.key});

  @override
  State<TodoListWidget> createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailController = TextEditingController();

  late TaskModel newTask;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodoListWidgetController>(
      init: TodoListWidgetController(),
      builder: (controller) {
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            color: Colors.white,
          ),
          width: 300,
          height: 330,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Flexible(flex: 2, child: Text('제목')),
                    Flexible(
                      flex: 5,
                      child: TextFormField(
                        controller: titleController,
                        maxLength: 20,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 2,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 2,
                                )),
                            hintText: '제목을 입력하세요.'),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Flexible(flex: 2, child: Text('내용')),
                    Flexible(
                      flex: 5,
                      child: TextFormField(
                        controller: detailController,
                        maxLines: 5,
                        maxLength: 50,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 2,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 2,
                                )),
                            hintText: '내용을 입력하세요.'),
                      ),
                    )
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    // 새로운 task 를 만들어서 list 에 추가하기

                    String title = titleController.text;
                    String detail = detailController.text;

                    if (detail.isEmpty) {
                      newTask = controller.createTask(title);
                    } else {
                      newTask = controller.createDetailTask(title, detail);
                    }

                    Navigator.of(context).pop(newTask);
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 0, // 그림자 제거
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      side: const BorderSide(
                        color: Colors.grey, // 테두리 색상
                        width: 2, // 테두리 굵기
                      )),
                  child: const Text(
                    '저장하기',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
