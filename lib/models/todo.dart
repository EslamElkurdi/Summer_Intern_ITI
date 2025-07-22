class TodoModel {
  final int id;
  final String title;
  final bool isDone;

  TodoModel({required this.id, required this.title, required this.isDone});

  TodoModel coptWith({String? title, bool? isDone}) {
    return TodoModel(
      id: id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
    );
  }
}
