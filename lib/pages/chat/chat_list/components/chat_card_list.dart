import 'package:flutter/material.dart';

class ChatCardList extends StatelessWidget {
  final String name;
  final String message;
  final String date;
  const ChatCardList({
    required this.name,
    required this.message,
    required this.date,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage("assets/picture.jpg"),
                ),
                title: Text(
                  "${name}",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text("${message}"),
                contentPadding: const EdgeInsets.all(0),
              ),
            ),
            Column(
              children: [
                Text(
                  "${date}",
                  style: TextStyle(color: Color(0xFFa5a5a5), fontSize: 12),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
