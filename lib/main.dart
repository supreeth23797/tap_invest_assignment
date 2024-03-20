import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapinvest/core/design_system/colors.dart';

import 'features/routing/app_router.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: goRouter,
      theme: ThemeData(
          primaryColor: primaryColor,
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: customBgColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: customBgColor,
            elevation: 0,
          )),
    );
  }
}
