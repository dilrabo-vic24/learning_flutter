import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_lesson/homework/providers/stream_provider.dart';

class StreamProviderScreen extends ConsumerWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postRiverpod = ref.watch(streamProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Stream Provider Screen"),
      ),
      body: Center(
        child: Column(
          children: [
            postRiverpod.when(
              data: (data) {
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(postRiverpod.value![index].title),
                        subtitle: Text(postRiverpod.value![index].body),
                      );
                    },
                  ),
                );
              },
              error: (error, stackTrace) => Text("Error"),
              loading: () => Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
