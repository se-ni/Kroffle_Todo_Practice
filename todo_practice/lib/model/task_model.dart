enum Status { notStarted, progress, end }

extension StatusExtension on Status {
  String get displayText {
    switch (this) {
      case Status.notStarted:
        return "시작 전";
      case Status.progress:
        return "진행 중";
      case Status.end:
        return "완료";
      default:
        return '';
    }
  }
}

class TaskModel {
  // task 고유 id
  String? id;
  // task 제목
  String title;
  // task 세부 내용
  String? detail;
  // task 생성일
  DateTime createdAt;

  Status taskStatus = Status.notStarted; // 기본값 설정

  // 생성자
  TaskModel(
      {this.id,
      required this.title,
      this.detail,
      required this.createdAt,
      required this.taskStatus});
}
