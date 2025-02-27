import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_lesson/queries/todo_queries.dart';

class TodoScreen extends StatefulWidget {
  TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final titleController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todos"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Query(
                options: QueryOptions(document: gql(TodoQueries.getTodosQuery)),
                builder: (QueryResult result, {fetchMore, refetch}) {
                  if (result.hasException) {
                    log("error: \${result.exception}");
                    return Center(
                      child: Text("Error: \${result.exception}"),
                    );
                  }

                  if (result.isLoading) {
                    log("result loading: \${result.toString()}");
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  final List todosList = result.data?["todos"] ?? [];
                  log("todos list: \${todosList[0].toString()}");

                  return Column(
                    children: [
                      SizedBox(
                        height: 610,
                        child: ListView.builder(
                          itemCount: todosList.length,
                          itemBuilder: (context, index) {
                            final todo = todosList[index];
                            log("todo: \${todo.toString()}");
                            return SizedBox(
                              height: 80,
                              width: 280,
                              child: ListTile(
                                title: SizedBox(
                                  height: 70,
                                  width: 280,
                                  child: Row(
                                    children: [
                                      Text(todo['title'].toString()),
                                      Spacer(),
                                      Mutation(
                                        options: MutationOptions(
                                          document: gql(TodoQueries.UpdateTodo),
                                        ),
                                        builder:
                                            (RunMutation runMutation, result) {
                                          return IconButton(
                                            onPressed: () {
                                              editDialog(context, todo['id'],
                                                  todo['title'], refetch!);
                                            },
                                            icon: Icon(Icons.edit),
                                          );
                                        },
                                      ),
                                      Mutation(
                                        options: MutationOptions(
                                          document: gql(
                                              TodoQueries.deleteTodoMutation),
                                          onCompleted: (_) => refetch!(),
                                        ),
                                        builder: (RunMutation runMutation,
                                            QueryResult? result) {
                                          return IconButton(
                                            onPressed: () {
                                              runMutation({"id": todo['id']});
                                            },
                                            icon: Icon(Icons.delete),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: Row(
                          children: [
                            SizedBox(
                              height: 50,
                              width: 280,
                              child: TextField(
                                controller: titleController,
                                decoration: InputDecoration(
                                  hintText: "Add Todo",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Mutation(
                              options: MutationOptions(
                                document: gql(TodoQueries.addTodo),
                                onCompleted: (_) {
                                  refetch!();
                                },
                              ),
                              builder: (RunMutation runMutation, result) {
                                return IconButton(
                                  onPressed: () {
                                    runMutation(
                                      {"title": titleController.text.trim()},
                                    );
                                  },
                                  icon: Icon(Icons.send),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void editDialog(
      BuildContext context, String id, String oldTitle, VoidCallback refetch) {
    final TextEditingController editController =
        TextEditingController(text: oldTitle);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Todo"),
          content: TextField(
            controller: editController,
            decoration: InputDecoration(labelText: "New Title"),
          ),
          actions: [
            Mutation(
              options: MutationOptions(
                document: gql(TodoQueries.UpdateTodo),
                onCompleted: (_) {
                  Navigator.pop(context);
                  refetch();
                },
              ),
              builder: (RunMutation runMutation, QueryResult? result) {
                return TextButton(
                  onPressed: () {
                    runMutation({
                      "id": id,
                      "title": editController.text,
                      "completed": false
                    });
                  },
                  child: Text("Save"),
                );
              },
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }
}
