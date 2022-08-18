import 'package:flutter/material.dart';
import 'package:super_toys/modules/home/sidebar_items.dart';

class Sidebar extends StatelessWidget {
  final SidebarType? active;
  final Function(SidebarItem)? onTap;
  const Sidebar({Key? key, this.active, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sidebarItems.length,
      itemBuilder: (ctx, idx) {
        SidebarItem item = sidebarItems[idx];
        bool isActive = item.type == active;
        return Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: isActive ? Colors.blue : Colors.transparent,
                borderRadius: const BorderRadius.all(Radius.circular(4)),
              ),
              width: 4,
              height: 28,
              margin: const EdgeInsets.only(right: 4),
            ),
            Expanded(
              child: ListTile(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                dense: true,
                tileColor: isActive ? Colors.grey.shade200 : Colors.transparent,
                horizontalTitleGap: 0,
                leading: item.leading,
                title: Text(
                  item.title,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                onTap: () => onTap?.call(item),
              ),
            )
          ],
        );
      },
    );
  }
}
