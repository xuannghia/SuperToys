import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_toys/modules/app/app_preferences_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeMode =
        ref.watch(appPreferencesProvider.select((_) => _.themeMode));
    final setThemeMode = ref.read(appPreferencesProvider).setThemeMode;

    return Scaffold(
      body: Container(
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
    );
  }
}
