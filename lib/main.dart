import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:super_toys/configs/routers.dart';
import 'package:super_toys/configs/themes/dark_theme.dart';
import 'package:super_toys/configs/themes/light_theme.dart';
import 'package:super_toys/modules/app/app_preferences_keys.dart';
import 'package:super_toys/modules/app/app_preferences_provider.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(AppPreferencesKeys.boxKey);
  runApp(const ProviderScope(
    child: SuperToysApp(),
  ));
}

class SuperToysApp extends StatefulHookConsumerWidget {
  const SuperToysApp({Key? key}) : super(key: key);
  @override
  SuperToysAppState createState() => SuperToysAppState();
}

class SuperToysAppState extends ConsumerState<SuperToysApp> {
  final GoRouter _router = Routers.createRouter();

  @override
  Widget build(BuildContext context) {
    final themeMode =
        ref.watch(appPreferencesProvider.select((s) => s.themeMode));

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: 'Super Toys',
      themeMode: themeMode,
      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}
