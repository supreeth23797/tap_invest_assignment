import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tapinvest/core/models/scheme_details.dart';
import 'package:tapinvest/features/schemes/screens/purchase_confirmation_screen.dart';
import 'package:tapinvest/features/schemes/screens/purchasing_screen.dart';

import '../schemes/screens/scheme_details_screen.dart';

enum AppRoute { schemeDetails, purchasing, purchaseConfirmation }

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
        GoRoute(
            path: '/purchasing',
            name: AppRoute.purchasing.name,
            builder: (context, state) {
              final extra = state.extra as SchemeDetails;
              return PurchasingScreen(
                schemeDetails: extra,
              );
            }),
        GoRoute(
            path: '/purchaseConfirmation',
            name: AppRoute.purchaseConfirmation.name,
            builder: (context, state) {
              return PurchaseConfirmationScreen();
            }),
      ]);
});
