import 'package:flutter/material.dart';
import 'package:ipark/navbar/notifications/notificationPage.dart';

class NotificationTiles extends StatelessWidget {
  final String title, subtitle;
  final Function onTap;
  final bool enable;
  const NotificationTiles({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.enable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          height: 50.0,
          width: 50.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/park1.jpg"),
                  fit: BoxFit.cover))),
      title: Text(title, style: TextStyle(color: Colors.black)),
      subtitle: Text(subtitle, style: TextStyle(color: Colors.black)),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NotificationPage()),
        );
      },
      enabled: enable,
    );
  }
}
