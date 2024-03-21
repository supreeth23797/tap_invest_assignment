import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:tapinvest/gen/assets.gen.dart';

import '../../../core/design_system/colors.dart';
import '../../routing/app_router.dart';

class SuccessScreen extends ConsumerStatefulWidget {
  SuccessScreen({super.key});

  @override
  ConsumerState<SuccessScreen> createState() => SuccessScreenContents();
}

class SuccessScreenContents extends ConsumerState<SuccessScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this);
    redirectDelay();
  }

  redirectDelay() async {
    Future.delayed(const Duration(seconds: 2), () {
      context.goNamed(AppRoute.schemeDetails.name);
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
            SvgPicture.asset(TapAssets.illustrations.icSuccess.path),
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
