import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_toys/modules/app/app_preferences_provider.dart';
import 'package:super_toys/modules/home/sidebar_items.dart';
import 'package:super_toys/modules/home/sidebar_widget.dart';

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
    final themeMode =
        ref.watch(appPreferencesProvider.select((_) => _.themeMode));
    final setThemeMode = ref.read(appPreferencesProvider).setThemeMode;

    return Scaffold(
      body: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
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
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('$themeMode'),
                    ElevatedButton(
                      onPressed: () {
                        if (themeMode == ThemeMode.dark) {
                          setThemeMode(ThemeMode.light);
                        } else {
                          setThemeMode(ThemeMode.dark);
                        }
                      },
                      child: const Text('Change theme'),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
