import 'package:flutter/material.dart';

class ExamplesScreen extends StatelessWidget {
  const ExamplesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Riverpod Examples"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: ListView(
          children: [
            ListTile(
              title: const Text("Provider Examples"),
              onTap: () => Navigator.pushNamed(context, "/provider"),
            ),
            ListTile(
              title: const Text('StateProvider Example'),
              onTap: () => Navigator.pushNamed(context, '/state_provider'),
            ),
            ListTile(
              title: const Text('StateNotifierProvider Example'),
              onTap: () =>
                  Navigator.pushNamed(context, '/state_notifier_provider'),
            ),
            ListTile(
              title: const Text('ChangeNotifierProvider Example'),
              onTap: () =>
                  Navigator.pushNamed(context, '/change_notifier_provider'),
            ),
            ListTile(
              title: const Text('FutureProvider Example'),
              onTap: () => Navigator.pushNamed(context, '/future_provider'),
            ),
            ListTile(
              title: const Text('StreamProvider Example'),
              onTap: () => Navigator.pushNamed(context, '/stream_provider'),
            ),
            ListTile(
              title: const Text('AutoDisposeProvider Example'),
              onTap: () =>
                  Navigator.pushNamed(context, '/auto_dispose_provider'),
            ),
            ListTile(
              title: const Text('FamilyProvider Example'),
              onTap: () => Navigator.pushNamed(context, '/family_provider'),
            ),
            ListTile(
              title: const Text('ScopedProvider Example'),
              onTap: () => Navigator.pushNamed(context, '/scoped_provider'),
            ),
          ],
        ),
      ),
    );
  }
}
