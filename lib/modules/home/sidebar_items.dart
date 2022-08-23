import 'package:flutter/material.dart';

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
      Icons.code,
      size: 16,
    ),
  ),
  SidebarItem(
    type: SidebarType.jwt,
    title: 'JWT Debugger',
    leading: const Icon(
      Icons.code,
      size: 16,
    ),
  ),
];
