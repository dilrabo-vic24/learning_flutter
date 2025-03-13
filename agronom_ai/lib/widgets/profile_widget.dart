import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/imgs/user.png"),
              radius: 25,
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Xush kelibsiz,', style: TextStyle(color: Colors.grey)),
                Text('Samuel Joe',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Spacer(),
            SvgPicture.asset("assets/svgs/setting.svg")
          ],
        ),
      ),
    );
  }
}
