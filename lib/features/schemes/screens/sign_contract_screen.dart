import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tapinvest/core/design_system/widgets/custom_appbar.dart';
import 'package:tapinvest/core/design_system/widgets/custom_bottom_bar.dart';
import 'package:tapinvest/core/design_system/widgets/custom_primary_button.dart';
import 'package:tapinvest/features/routing/app_router.dart';
import 'package:tapinvest/gen/assets.gen.dart';

import '../../../core/design_system/strings.dart';

class SignContractScreen extends StatelessWidget {
  SignContractScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Image.asset(TapAssets.illustrations.icContract.path),
            ],
          )),
      bottomNavigationBar: CustomBottomBar(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomPrimaryButton(
              text: signContract,
              onPressed: () {
                context.pushReplacementNamed(AppRoute.successScreen.name);
              },
            )
          ],
        ),
      ),
    );
  }
}
