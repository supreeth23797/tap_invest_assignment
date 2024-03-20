import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tapinvest/core/design_system/colors.dart';
import 'package:tapinvest/core/design_system/sizes.dart';
import 'package:tapinvest/core/design_system/styles.dart';

class CustomDetailsCard extends StatelessWidget {
  String iconPath;
  String? title;
  String message;
  EdgeInsets? margin;
  double? maxWidth;
  IconButton? actionIconBtn;

  CustomDetailsCard({
    super.key,
    required this.iconPath,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(iconPath),
            gapH12,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
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
                if (actionIconBtn != null) ...[
                  Flexible(flex: 1, child: actionIconBtn!)
                ]
              ],
            )
          ],
        ));
  }
}
