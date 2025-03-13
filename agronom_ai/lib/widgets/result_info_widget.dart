import 'package:flutter/material.dart';

class ResultInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        padding: EdgeInsets.all(12),
        color: Colors.white,
        child: Text(
          "Lichinkalar pomidor va tamaki kabi ekinlarning zararkunandalari boʻlganligi sababli, ularning populyatsiyasini nazorat qilish uchun biologik nazorat vositalari va tuzoqlardan foydalanilgan. Lichinkalar pomidor oʻsimliklari orasidan terib olinadi",
          style: TextStyle(color: Colors.grey[600], fontSize: 14),
        ),
      ),
    );
  }
}
