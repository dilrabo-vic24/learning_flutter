import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xffF5EDE7),
      elevation: 0,
      title: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: const Color(0xff81C784),
                width: 2,
              ),
            ),
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://randomuser.me/api/portraits/men/45.jpg"),
            ),
          ),
          const SizedBox(width: 10),
          RichText(
            text: TextSpan(
              text: "Xush kelibsiz,\n",
              style: TextStyle(color: Colors.grey[800], fontSize: 14),
              children: [
                TextSpan(
                  text: "Samuel Joe",
                  style: TextStyle(
                      color: Colors.green[800],
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.settings, color: Colors.green[800]),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
