import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_toys/modules/app/app_preferences_provider.dart';
import 'package:super_toys/modules/base64/base64_screen_widget.dart';
import 'package:super_toys/modules/home/sidebar_items.dart';
import 'package:super_toys/modules/home/sidebar_widget.dart';
import 'package:super_toys/widgets/dropdown.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  SidebarType _activeSidebar = SidebarType.base64;

  void _onTap(SidebarItem item) {
    setState(() {
      _activeSidebar = item.type;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeMode themeMode =
        ref.watch(appPreferencesProvider.select((_) => _.themeMode));
    return Scaffold(
      body: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            color: Theme.of(context).backgroundColor,
            width: 280,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  margin: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Super Toys',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  child: Sidebar(
                    active: _activeSidebar,
                    onTap: _onTap,
                  ),
                ),
                Dropdown(
                  value: themeMode,
                  items: [
                    DropdownItem(
                      value: ThemeMode.system,
                      child: const Text('System'),
                    ),
                    DropdownItem(
                      value: ThemeMode.light,
                      child: const Text('Light'),
                    ),
                    DropdownItem(
                      value: ThemeMode.dark,
                      child: const Text('Dark'),
                    ),
                  ],
                  onChanged: (mode) {
                    if (mode != null) {
                      ref.read(appPreferencesProvider).setThemeMode(mode);
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Builder(builder: (ctx) {
                switch (_activeSidebar) {
                  case SidebarType.base64:
                    return const Base64Screen();
                  default:
                    return Text('404',
                        style: Theme.of(context).textTheme.headline3);
                }
              }),
            ),
          )
        ],
      ),
    );
  }
}
