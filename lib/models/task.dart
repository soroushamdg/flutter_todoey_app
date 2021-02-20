class Task {
  int id;
  final String name;
  bool isDone;

  Task({this.name, this.isDone = false, this.id = 0});

  void toggleDone() {
    isDone = !isDone;
  }

  /// integrating database, map function
  Map<String, dynamic> toMap({bool withid = true}) {
    if (withid) {
      return {
        'id': id,
        'name': name,
        'isdone': isDone ? 1 : 0,
      };
    } else {
      return {
        'name': name,
        'isdone': isDone ? 1 : 0,
      };
    }
  }
}
