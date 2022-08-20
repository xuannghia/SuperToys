import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:super_toys/modules/app/app_preferences_provider.dart';
import 'package:super_toys/modules/home/sidebar_items.dart';

class Sidebar extends HookConsumerWidget {
  final SidebarType? active;
  final Function(SidebarItem)? onTap;
  const Sidebar({Key? key, this.active, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final ctrl =
        useAnimationController(duration: const Duration(milliseconds: 200));

    ThemeMode themeMode =
        ref.watch(appPreferencesProvider.select((_) => _.themeMode));

    useEffect(() {
      ctrl.reset();
      ctrl.forward();
      return () {};
    }, [themeMode]);

    return AnimatedBuilder(
      animation:
          CurvedAnimation(parent: ctrl, curve: Curves.fastLinearToSlowEaseIn),
      builder: ((context, child) {
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
                    tileColor: isActive
                        ? ThemeMode.dark == themeMode
                            ? Colors.grey.shade800.withOpacity(ctrl.value)
                            : Colors.grey.shade200.withOpacity(ctrl.value)
                        : Colors.transparent,
                    selectedColor: Colors.transparent,
                    selectedTileColor: Colors.transparent,
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
      }),
    );
  }
}
