import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:search_github/view/repository_detail_page_view.dart';
import 'package:search_github/view/search_page_view.dart';

// final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

final routemaster = RoutemasterDelegate(
  observers: [MyObserver(), routeObserver],
  routesBuilder: (context) => routeMap,
);

class MyObserver extends RoutemasterObserver {
  // Routemaster-specific observer method
  @override
  void didChangeRoute(RouteData routeData, Page page) {
    // print('New route: ${routeData.path}');
  }
}

final routeMap = RouteMap(
  routes: {
    '/': (_) => const MaterialPage(child: SearchPageView()),
    '/detail': (_) => const MaterialPage(child: RepositoryDetailPageView()),
  },
);
