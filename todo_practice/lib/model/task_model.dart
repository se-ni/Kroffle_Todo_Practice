class TaskModel {
  // task 고유 id
  String id;
  // task 제목
  String title;
  // task 세부 내용
  String? details;
  // task 생성일
  DateTime createdAt;

  // 생성자
  TaskModel(
      {required this.id,
      required this.title,
      this.details,
      required this.createdAt});
}
