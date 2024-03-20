import 'package:flutter/material.dart';
import 'package:tapinvest/core/design_system/colors.dart';
import 'package:tapinvest/core/design_system/sizes.dart';
import 'package:tapinvest/core/design_system/styles.dart';

class CustomDetailsCard extends StatelessWidget {
  Widget icon;
  String? title;
  String message;
  EdgeInsets? margin;
  double? maxWidth;
  IconButton? actionIconBtn;

  CustomDetailsCard({
    super.key,
    required this.icon,
    this.title,
    this.margin,
    this.maxWidth,
    required this.message,
    this.actionIconBtn,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        width: maxWidth,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: borderColor,
            )),
        child: Column(
          children: [
            icon,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    child: Column(
                  children: [
                    if (title != null) ...[
                      Text(title!, style: boldTextStyle(size: 16)),
                      gapH8,
                    ],
                    Text(
                      message,
                      style: secondaryTextStyle(),
                    )
                  ],
                )),
                if (actionIconBtn != null) ...[Flexible(child: actionIconBtn!)]
              ],
            )
          ],
        ));
  }
}
