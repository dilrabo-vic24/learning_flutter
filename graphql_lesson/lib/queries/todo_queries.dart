class TodoQueries {
  static const String getTodosQuery = '''
    query {
      todos {
        id
        title
        completed
      }
  }
  ''';

  static const String addTodo = '''
     mutation AddTodo(\$title: String!){
      addTodo(title: \$title){
        title
      }
    }
  ''';

  static const UpdateTodo = '''
    mutation UpdateTodo(\$id: ID!, \$title: String!){
      updateTodo(id: \$id, title: \$title){
        id
        title
        completed
      }
    }
  ''';

  static String deleteTodoMutation = """
  mutation DeleteTodo(\$id: ID!) {
    deleteTodo(id: \$id)
  }
""";
}
