import 'package:flutter/material.dart';

import 'package:solid_lesson_todo/features/get_tasks/domain/model/task_model.dart';

class TaskTile extends StatelessWidget {
  final TaskModel task;

  const TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title),
      subtitle: Text("User ID: ${task.userId}"),
      // trailing: Icon(
      //   task.completed ? Icons.check_circle : Icons.circle,
      //   color: task.completed ? Colors.green : Colors.grey,
      // ),
    );
  }
}
