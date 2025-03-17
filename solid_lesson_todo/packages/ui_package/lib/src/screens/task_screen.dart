// ignore_for_file: library_private_types_in_public_api

import 'package:data_package/data_package.dart';
import 'package:flutter/material.dart';
import 'package:ui_package/ui_package.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TaskProvider>().fetchTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo List")),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, child) {
          final tasks = taskProvider.tasks;
          if (taskProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (taskProvider.errorMessage != null &&
              taskProvider.errorMessage!.isNotEmpty) {
            return Center(child: Text(taskProvider.errorMessage!));
          } else {
            return Column(
              children: [
                Text("All Tasks"),
                Expanded(
                  child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      return ListTile(
                        title: Text(task.title),
                        leading: Checkbox(
                          value: task.completed,
                          onChanged: (value) {},
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed:
                                  () => showUpdateTaskDialog(
                                    context,
                                    taskProvider,
                                    task,
                                  ),
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                taskProvider.deleteTodo(task.id);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAddTaskDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void showUpdateTaskDialog(
    BuildContext context,
    TaskProvider taskProvider,
    TaskModel task,
  ) {
    final TextEditingController titleController = TextEditingController(
      text: task.title,
    );
    bool isCompleted = task.completed;

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("Update Task"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: "Task Title"),
                ),
                CheckboxListTile(
                  title: Text("Completed"),
                  value: isCompleted,
                  onChanged: (value) {
                    if (value != null) {
                      isCompleted = value;
                    }
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  taskProvider.updateTodo(
                    id: task.id,
                    userId: task.userId,
                    title: titleController.text,
                    completed: isCompleted,
                  );
                  Navigator.pop(context);
                },
                child: Text("Update"),
              ),
            ],
          ),
    );
  }
}
