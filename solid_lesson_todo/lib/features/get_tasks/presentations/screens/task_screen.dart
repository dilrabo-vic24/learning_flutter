// ignore_for_file: library_private_types_in_public_api

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:solid_lesson_todo/features/get_tasks/presentations/controllers/tasks_provider.dart';
import 'package:solid_lesson_todo/features/get_tasks/presentations/widgets/task_tile_widget.dart';

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
      // body: Center(child: Text("Men")),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, child) {
          final tasks = taskProvider.tasks;
          log("tasks at screen: $tasks");
          if (taskProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (taskProvider.errorMessage != null ||
              taskProvider.errorMessage!.isEmpty) {
            return Center(child: Text(taskProvider.errorMessage!));
          } else {
            return Column(
              children: [
                Text("All Tasks"),
                Expanded(
                  child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      log("len: ${tasks.length}");
                      return TaskTile(task: tasks[index]);
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => showAddTaskDialog(context),
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
