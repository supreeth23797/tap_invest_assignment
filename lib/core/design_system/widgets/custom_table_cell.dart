import 'package:flutter/cupertino.dart';
import 'package:tapinvest/core/design_system/sizes.dart';
import 'package:tapinvest/core/design_system/styles.dart';

class CustomTableCell extends StatelessWidget {
  CustomTableCell({super.key, required this.title, required this.body});

  String title;
  Widget body;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: secondaryTitleTextStyle(),
          ),
          gapH8,
          body
        ],
      ),
    );
  }
}
