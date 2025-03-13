import 'package:agronom_ai/models/history_item.dart';
import 'package:agronom_ai/screens/result_screen.dart';
import 'package:agronom_ai/widgets/bottom_nav_widget.dart';
import 'package:agronom_ai/widgets/history_item_widget.dart';
import 'package:flutter/material.dart';

class ChatHistoryPage extends StatelessWidget {
  final List<ChatHistoryItem> historyItems = [
    ChatHistoryItem(
      imageUrl: 'assets/imgs/rasm_1.png',
      message: 'Pomidor shox qurt!',
      date: '20 Sen 2023',
      time: '10:40 pm',
    ),
    ChatHistoryItem(
      imageUrl: 'assets/imgs/rasm_2.png',
      message: 'Pomidor shox qurt!',
      date: '20 Sen 2023',
      time: '10:30 pm',
    ),
    ChatHistoryItem(
      imageUrl: 'assets/imgs/rasm_1.png',
      message: 'Pomidor shox qurt!',
      date: '12 Sen 2023',
      time: '09:20 pm',
    ),
    ChatHistoryItem(
      imageUrl: 'assets/imgs/rasm_2.png',
      message: 'Pomidor shox qurt!',
      date: '12 Sen 2023',
      time: '09:20 pm',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 216, 216),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 252, 216, 216),
        elevation: 0,
        title: Text('Tarix', style: TextStyle(color: Colors.red)),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.red),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: historyItems.length,
              itemBuilder: (context, index) {
                return HistoryItemWidget(
                  historyItem: historyItems[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ResultScreen(title: historyItems[index].message),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          BottomNavigation(),
        ],
      ),
    );
  }
}
