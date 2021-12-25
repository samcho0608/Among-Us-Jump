import 'package:among_us_jump/screens/home/home.dart';
import 'package:among_us_jump/screens/screens.dart';
import 'package:among_us_jump/screens/settings/settings_page.dart';
import 'package:auto_route/auto_route.dart';

@MaterialAutoRouter(
    replaceInRouteName: 'Page,Route',
    routes: <AutoRoute> [
          AutoRoute(page: HomePage, initial: true),
          AutoRoute(page: GamePage, path: '/game'),
          AutoRoute(page: SettingsPage, path: '/settings')
    ]
)
class $AppRouter {}