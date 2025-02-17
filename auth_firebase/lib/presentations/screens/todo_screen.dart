import 'dart:developer';

import 'package:auth_firebase/presentations/widgets/custom_text_style.dart';
import 'package:auth_firebase/providers/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  String todoTitle = '';
  // List<Map<String, dynamic>> allTodos = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final todoProvider = Provider.of<TodoProvider>(context, listen: false);
      todoProvider.getAllTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<TodoProvider>(
          builder: (context, todoProvider, child) {
            if (todoProvider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            // if (allTodos.isEmpty && todoProvider.allTodosList.isNotEmpty) {
            //   allTodos =
            //       List<Map<String, dynamic>>.from(todoProvider.allTodosList);
            // }

            // if (allTodos.isEmpty) {
            //   return const Center(child: Text('No Todos yet!'));
            // }

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: todoProvider.allTodosList.length,
                    itemBuilder: (context, index) {
                      final todo = todoProvider.allTodosList[index];

                      return Card(
                        child: ListTile(
                          title: Text(todo['title']),
                          trailing: Checkbox(
                            value: todo['isComplited'],
                            onChanged: (newValue) {
                              setState(() {
                                todoProvider.allTodosList[index]
                                    ['isComplited'] = newValue ?? false;
                              });
                              log("Checkbox changed on UI. value: $newValue");
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Add New Todo'),
                          content: TextField(
                            decoration:
                                const InputDecoration(labelText: 'Todo title'),
                            onChanged: (value) {
                              todoTitle = value;
                            },
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancel'),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                if (todoTitle.isNotEmpty) {
                                  bool isAdded = await todoProvider.addNewTodo(
                                    title: todoTitle,
                                    isComplited: false,
                                  );
                                  log("check ${isAdded.toString()}");
                                  if (isAdded) {
                                    setState(() {
                                      // allTodos.add({
                                      //   'title': todoTitle,
                                      //   'isComplited': false
                                      // });
                                    });
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Todo added!')),
                                    );
                                  } else {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(todoProvider.message)),
                                    );
                                  }
                                }
                              },
                              child: const Text('Add'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                  ),
                  child: CustomTextStyle(text: "Add", fontSize: 18),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
