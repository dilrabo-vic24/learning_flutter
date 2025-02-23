import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_lesson/homework/providers/future_provider.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postRiverpod = ref.watch(futureDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Future Provider Screen"),
      ),
      body: Center(
        child: postRiverpod.when(
          data: (post) => Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text("All Posts"),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(postRiverpod.value![index].title),
                        subtitle: Text(postRiverpod.value![index].body),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          error: (error, stackTrace) {
            return Center(
              child: Text("Error, $error"),
            );
          },
          loading: () {
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
