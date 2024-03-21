import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tapinvest/core/design_system/colors.dart';

import 'features/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: true, ignoreSsl: true);
  Map<Permission, PermissionStatus> statuses =
      await [Permission.notification, Permission.storage].request();
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
          textTheme: GoogleFonts.interTextTheme(),
          appBarTheme: const AppBarTheme(
            backgroundColor: customBgColor,
            elevation: 0,
          )),
    );
  }
}
