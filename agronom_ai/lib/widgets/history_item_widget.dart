import 'package:agronom_ai/models/history_item.dart';
import 'package:flutter/material.dart';

class HistoryItemWidget extends StatelessWidget {
  final ChatHistoryItem historyItem;
  final VoidCallback onTap;

  HistoryItemWidget({
    required this.historyItem,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(historyItem.imageUrl),
              radius: 20,
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  historyItem.message,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '${historyItem.date} - ${historyItem.time}',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
