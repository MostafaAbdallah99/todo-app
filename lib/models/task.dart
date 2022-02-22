class Task {
  String task;
  final String id;

  Task({required this.task, required this.id});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'task': task,
    };
  }
}
