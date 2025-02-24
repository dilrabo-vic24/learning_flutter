import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink = HttpLink("https://countries.trevorblades.com/");

    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: httpLink,
        cache: GraphQLCache(),
      ),
    );

    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CountriesScreen(),
      ),
    );
  }
}

class CountriesScreen extends StatelessWidget {
  final String getCountriesQuery = '''
    query {
      countries {
        code
        name
        emoji
        capital
      }
    }
  ''';

  final String addQuery = '''
    mutation AddBook(\$title: String!, \$author: String!){
      addBook(title: \$title, author: \$author){
        id
        title
        author
      }
    }
  ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("🌍 Davlatlar Ro'yxati")),
      body: Query(
        options: QueryOptions(document: gql(getCountriesQuery)),
        builder: (QueryResult result, {fetchMore, refetch}) {
          if (result.hasException) {
            return Center(
                child: Text("Xatolik: ${result.exception.toString()}"));
          }

          if (result.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          final List countries = result.data?['countries'] ?? [];

          return ListView.builder(
            itemCount: countries.length,
            itemBuilder: (context, index) {
              final country = countries[index];

              return Card(
                child: ListTile(
                  leading:
                      Text(country['emoji'], style: TextStyle(fontSize: 24)),
                  title: Text(country['name']),
                  trailing: Text("Kod: ${country['code']}"),
                  subtitle: Text("Capital: ${country["capital"]}"),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: Mutation(
          options: MutationOptions(
            document: gql(addQuery),
          ),
          builder: builder),
    );
  }
}
