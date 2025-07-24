class TaskModel {
  final String id;
  final String title;
  final bool isDone;

  TaskModel({required this.id, required this.title, required this.isDone});

  Map<String, dynamic> toMap() {
    return {'title': title, 'isDone': isDone};
  }

  factory TaskModel.fromMap(String id, Map<String, dynamic> map) {
    return TaskModel(id: id, title: map['title'], isDone: map['isDone']);
  }
}
