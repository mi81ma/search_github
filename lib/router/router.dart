import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:search_github/view/search_repository_page_view.dart';

// final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

final routemaster = RoutemasterDelegate(
  observers: [MyObserver(), routeObserver],
  routesBuilder: (context) => routeMap,
);

class MyObserver extends RoutemasterObserver {
  void didPop(
    Route route,
    Route? previousRoute,
  ) {
    print('Popped a route');
  }

  // Routemaster-specific observer method
  @override
  void didChangeRoute(RouteData routeData, Page page) {
    print('New route: ${routeData.path}');
  }
}

final routeMap = RouteMap(
  routes: {
    /// root page
    '/': (_) => const MaterialPage(child: SearchRepositoryPageView()),
  },
);
