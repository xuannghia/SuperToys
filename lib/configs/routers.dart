import 'package:go_router/go_router.dart';
import 'package:super_toys/modules/home/home_screen_widget.dart';

class Routers {
  static String home = '/';

  static GoRouter createRouter() {
    return GoRouter(
      routes: [
        GoRoute(
          path: home,
          builder: (context, state) => const HomeScreen(),
        ),
      ],
    );
  }
}
