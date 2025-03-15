import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:solid_lesson_todo/features/get_tasks/presentations/controllers/tasks_provider.dart';

void showAddTaskDialog(BuildContext context) {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController userIdController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Add Todo"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: userIdController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "User ID"),
            ),
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Title"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              final userId = (userIdController.text);
              final title = titleController.text;
              if (userId.isNotEmpty && title.isNotEmpty) {
                context.read<TaskProvider>().addTodo(
                  userId: int.parse(userId),
                  title: title,
                );
                Navigator.pop(context);
              }
            },
            child: Text("Add"),
          ),
        ],
      );
    },
  );
}
