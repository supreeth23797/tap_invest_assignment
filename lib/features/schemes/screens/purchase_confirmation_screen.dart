import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:tapinvest/core/design_system/colors.dart';
import 'package:tapinvest/features/routing/app_router.dart';
import 'package:tapinvest/gen/assets.gen.dart';

final svgProvider = StateProvider.autoDispose<String>(
    (ref) => TapAssets.illustrations.icPaymentDone.path);

class PurchaseConfirmationScreen extends ConsumerStatefulWidget {
  PurchaseConfirmationScreen({super.key});

  @override
  ConsumerState<PurchaseConfirmationScreen> createState() =>
      PurchaseConfirmationScreenContents();
}

class PurchaseConfirmationScreenContents
    extends ConsumerState<PurchaseConfirmationScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this);
    initDelay(); //Assuming Payment delay
  }

  initDelay() async {
    Future.delayed(const Duration(seconds: 2), () {
      startDocGen();
      ref
          .read(svgProvider.notifier)
          .update((state) => TapAssets.illustrations.icGeneratingContract.path);
      animationController.repeat();
    });
  }

  //Assuming Doc generation delay
  startDocGen() async {
    Future.delayed(const Duration(seconds: 3), () {
      context.replaceNamed(AppRoute.signContract.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: Stack(
          fit: StackFit.expand,
          alignment: AlignmentDirectional.center,
          children: [
            SvgPicture.asset(ref.watch(svgProvider)),
            Lottie.asset(
              'assets/animations/Flow 1.json',
              controller: animationController,
              onLoaded: (composition) {
                animationController
                  ..duration = composition.duration
                  ..forward();
              },
            )
          ],
        ));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
