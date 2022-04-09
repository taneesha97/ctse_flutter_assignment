
import 'package:flutter/material.dart';

import '../screens/movie_library_list.dart';
import '../screens/movie_wiki.dart';
import '../screens/profile_ui.dart';


class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  const TabNavigator({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState>? navigatorKey;
  final String? tabItem;

  @override
  Widget build(BuildContext context) {

    late Widget child;
    if(tabItem == "Page1") {
      child = MovieWiki();
    } else if(tabItem == "Page2")
      child = LibraryList();
    else if(tabItem == "Page3")
      child = ProfileUI();

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
            builder: (context) => child
        );
      },
    );
  }
}

