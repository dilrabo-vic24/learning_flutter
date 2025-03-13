import 'package:flutter/material.dart';

class ResultTitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Pomidor shox qurt!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Sphingidae oilasiga mansub jigarrang va kulrang kalxat kuyasi. Koʻpincha pomidor shox qurti deb atalib, tomorqalardagi asosiy zararkunanda boʻlishi mumkin;',
              style: TextStyle(color: Colors.grey[700], fontSize: 14),
            ),
            SizedBox(height: 8),
            Text(
              'Qo\'shimcha rasm',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/imgs/rasm_1.png',
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/imgs/rasm_2.png',
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Center(
              child: Text(
                'Qarshi dori',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SizedBox(height: 8),
            Text(
              """Umumiy tavsifi: \nBir yillik va ko'p yillik boshoqli hamda ikki pallali begona o'tlarga qarshi kurashda qo'llaniladigan gerbitsid!\nTa'sir etuvchi moddasi: Glifosat kaliyli tuzi 441gr/l.\nPreparat shakli: Suvli eritma\nXAvflilik darajasi: 3-sinfga oid(o'rtacha xavfli birikma)\nSarf me'yori, l/ga: 3.0-4.0\nQadog'i: 5l
            """,
              style: TextStyle(color: Colors.grey[700], fontSize: 14),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/imgs/rasm_dori.png',
                  width: 150,
                  height: 150,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
