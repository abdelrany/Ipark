import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget child;
  final action;
  const DefaultAppBar({
    Key? key,
    required this.title,
    required this.child,
    required this.action,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(56.0);
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: TextStyle(color: Colors.blue)),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 1,
      automaticallyImplyLeading: false,
      iconTheme: IconThemeData(
        color: Colors.blue,
      ),
      leading: child,
      actions: action,
    );
  }
}
