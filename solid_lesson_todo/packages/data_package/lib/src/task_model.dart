class TaskModel {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  TaskModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }

  factory TaskModel.toJson(Map<String, dynamic> json) {
    return TaskModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}
