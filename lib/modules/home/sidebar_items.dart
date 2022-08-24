import 'package:flutter/cupertino.dart';

enum SidebarType {
  base64,
  jwt,
}

class SidebarItem {
  SidebarType type;
  String title;
  Widget leading;

  SidebarItem({
    required this.type,
    required this.title,
    required this.leading,
  });
}

List<SidebarItem> sidebarItems = [
  SidebarItem(
    type: SidebarType.base64,
    title: 'Base64 String Encode/Decode',
    leading: const Icon(
      CupertinoIcons.arrow_2_squarepath,
      size: 16,
    ),
  ),
  SidebarItem(
    type: SidebarType.jwt,
    title: 'JWT Debugger',
    leading: const SizedBox(
      width: 16,
      height: 16,
      child: Text(
        '*',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 28, height: 1),
      ),
    ),
  ),
];
