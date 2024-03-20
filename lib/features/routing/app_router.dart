import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../schemes/screens/scheme_details_screen.dart';

enum AppRoute { schemeDetails, purchasing }

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
      navigatorKey: NavigationService.navigatorKey,
      initialLocation: '/',
      debugLogDiagnostics: false,
      redirect: (context, state) {
        return null;
      },
      routes: <RouteBase>[
        GoRoute(
            path: '/',
            name: AppRoute.schemeDetails.name,
            builder: (context, state) => SchemeDetailsScreen(
                  scheme: 'Abc',
                )),
      ]);
});
