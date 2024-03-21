import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:tapinvest/core/design_system/colors.dart';
import 'package:tapinvest/gen/assets.gen.dart';

class PurchaseConfirmationScreen extends StatefulWidget {
  PurchaseConfirmationScreen({super.key});

  @override
  State<PurchaseConfirmationScreen> createState() =>
      PurchaseConfirmationScreenContents();
}

class PurchaseConfirmationScreenContents
    extends State<PurchaseConfirmationScreen> with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          //animationController.repeat();
        }
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
            SvgPicture.asset(TapAssets.logos.icPaymentDone.path),
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
}
