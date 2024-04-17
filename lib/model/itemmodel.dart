class TodoModel {
  String? id;
  String? todotext;
  bool? isDone;

  TodoModel({required this.id, required this.todotext, this.isDone = false});

  static List<TodoModel> todolist() {
    return [
      TodoModel(id: "01", todotext: "Morning exercise", isDone: true),
      TodoModel(id: "02", todotext: "Yoga", isDone: true),
      TodoModel(id: "03", todotext: "Check email"),
      TodoModel(id: "04", todotext: "Online class"),
      TodoModel(id: "05", todotext: "Ofline class")
    ];
  }
}
