import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:go_router/go_router.dart';
import 'package:tapinvest/core/design_system/colors.dart';
import 'package:tapinvest/core/design_system/sizes.dart';
import 'package:tapinvest/core/design_system/styles.dart';
import 'package:tapinvest/core/design_system/widgets/custom_appbar.dart';
import 'package:tapinvest/core/design_system/widgets/custom_bottom_bar.dart';
import 'package:tapinvest/core/design_system/widgets/custom_divider.dart';
import 'package:tapinvest/core/models/scheme_details.dart';
import 'package:tapinvest/utils/constants.dart';
import 'package:tapinvest/utils/formats.dart';

import '../../../core/design_system/strings.dart';
import '../../../core/design_system/widgets/custom_key_value_view.dart';
import '../../../utils/calculations.dart';
import '../../../utils/validators.dart';
import '../../routing/app_router.dart';
import '../purchase_notifier.dart';

final requiredAmountProvider = StateProvider.autoDispose<double>((ref) => 0);
final returnsAmountProvider = StateProvider.autoDispose<double>((ref) => 0);

class PurchasingScreen extends ConsumerWidget {
  PurchasingScreen({super.key, required this.schemeDetails});

  final SchemeDetails schemeDetails;

  TextEditingController controller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double requiredAmount = 0;
  double totalReturnsAmount = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          screenInfo(),
          customDivider(),
          Form(key: formKey, child: enterAmountView(ref)),
          returnsView(ref)
        ],
      )),
      bottomNavigationBar: CustomBottomBar(
          body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomKeyValueView(
            noPadding: true,
            leftWidget: Text(
              '$balance: ${getIndianFormattedAmount(AVAILABLE_BALANCE)}',
              style: secondaryTextStyle(size: 12),
            ),
            rightWidget: Text(
                '$requiredTxt: ${getIndianFormattedAmount(ref.watch(requiredAmountProvider))}',
                style: secondaryTextStyle(size: 12)),
          ),
          gapH12,
          SwipeButton(
            height: 45,
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            activeThumbColor: primaryColor,
            activeTrackColor: swipeButtonBg,
            child:
                Text(swipeToPay.toUpperCase(), style: boldTextStyle(size: 12)),
            onSwipe: () {
              if (formKey.currentState!.validate()) {
                final enteredAmount = getNumberFromString(controller.text);
                if (enteredAmount < schemeDetails.minInvestment) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: primaryColor,
                      content: Text(
                          '$minInvestmentAmountValidator ${getIndianFormattedAmount(schemeDetails.minInvestment)}')));
                } else if (ref.watch(requiredAmountProvider) > 0) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: primaryColor,
                      content: Text(requiredAmountValidator)));
                } else {
                  //POST API call
                  ref
                      .read(purchaseNotifierProvider.notifier)
                      .makePurchase(getNumberFromString(controller.text));
                  context.pushNamed(AppRoute.purchaseConfirmation.name);
                }
              }
            },
          ),
        ],
      )),
    );
  }

  Widget screenInfo() {
    return Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              purchasing,
              style: boldTextStyle(),
            ),
            gapH8,
            Text(
              '${schemeDetails.name1} ← ${schemeDetails.name2}',
              style: secondaryTextStyle(),
            )
          ],
        ));
  }

  Widget enterAmountView(WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            enterAmount.toUpperCase(),
            style: secondaryTitleTextStyle(size: 12),
          ),
          IntrinsicWidth(
              child: TextFormField(
                textAlign: TextAlign.center,
            controller: controller,
            style: boldTextStyle(size: 24),
            keyboardType: TextInputType.number,
            onChanged: (enteredAmount) {
              if (formKey.currentState!.validate()) {
                ref.read(requiredAmountProvider.notifier).update((state) =>
                    calculateRequiredAmount(
                        getNumberFromString(enteredAmount), AVAILABLE_BALANCE));
                ref.read(returnsAmountProvider.notifier).update((state) =>
                    calculateTotalReturns(getNumberFromString(enteredAmount),
                        schemeDetails.netYield, schemeDetails.minInvestment));
              }
            },
            inputFormatters: [
              LengthLimitingTextInputFormatter(MAX_AMOUNT_LENGTH),
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              CurrencyInputFormatter()
            ],
            validator: validateInvestmentAmount,
            decoration: InputDecoration(
              errorMaxLines: 1,
              prefixIcon: Text(
                '$CURRENCY ',
                style: secondaryTextStyle(size: 24),
              ),
              prefixIconConstraints:
                  const BoxConstraints(minWidth: 0, minHeight: 0),
              hintText:
                  'Min ${getIndianFormattedAmount(schemeDetails.minInvestment, hideCurrency: true)}',
              hintStyle: boldTextStyle(size: 24, color: textHintColor),
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          ))
        ],
      ),
    );
  }

  Widget returnsView(WidgetRef ref) {
    final returns = ref.watch(returnsAmountProvider);
    return Column(
      children: [
        CustomKeyValueView(
            leftWidget: const Text(totalReturns),
            rightWidget: RichText(
                text: TextSpan(
              text: CURRENCY,
              style: secondaryTextStyle(),
              children: [
                TextSpan(
                    text: returns == 0
                        ? ' - '
                        : getIndianFormattedAmount(returns, hideCurrency: true),
                    style: primaryTextStyle()),
              ],
            ))),
        customDivider(),
        CustomKeyValueView(
          leftWidget: const Text(netYield),
          rightWidget: RichText(
            text: TextSpan(
              text: schemeDetails.netYield.toString(),
              style: primaryTextStyle(),
              children: [
                TextSpan(text: '%', style: secondaryTextStyle()),
              ],
            ),
          ),
        ),
        customDivider(),
        CustomKeyValueView(
          leftWidget: const Text(tenure),
          rightWidget: RichText(
            text: TextSpan(
              text: schemeDetails.tenure.toString(),
              style: primaryTextStyle(),
              children: [
                TextSpan(
                    text: schemeDetails.tenureUnit,
                    style: secondaryTextStyle()),
              ],
            ),
          ),
        )
      ],
    );
  }
}
