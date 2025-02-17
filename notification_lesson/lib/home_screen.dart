import 'package:flutter/material.dart';
import 'package:notification_lesson/notification_sercice.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await NotificationSercice().onTimeNotification();
              },
              child: const Text("One Time Notification"),
            ),
            ElevatedButton(
              onPressed: () async {
                await NotificationSercice().scheduledNotification(seconds: 5);
              },
              child: const Text("Scheduled Notification (5 seconds)"),
            ),
          ],
        ),
      ),
    );
  }
}
