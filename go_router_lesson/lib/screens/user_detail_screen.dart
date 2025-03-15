import 'package:flutter/material.dart';

class UserDetailScreen extends StatelessWidget {
  final String userId;
  const UserDetailScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'User Detail',
          style: TextStyle(color: Colors.purple),
        ),
      ),
      body: Center(
        child: Text(
          'User ID: $userId',
          style: const TextStyle(fontSize: 24, color: Colors.purple),
        ),
      ),
    );
  }
}
