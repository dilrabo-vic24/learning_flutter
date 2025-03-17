import 'package:data_package/data_package.dart';
import 'package:flutter/material.dart';

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
