class Task {
  int id;
  final String name;
  bool isDone;

  Task({this.name, this.isDone = false, this.id = 0});

  void toggleDone() {
    isDone = !isDone;
  }

  /// integrating database, map function
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isdone': isDone ? 1 : 0,
    };
  }
}
