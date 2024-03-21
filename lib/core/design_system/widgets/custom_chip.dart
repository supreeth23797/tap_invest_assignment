import 'package:flutter/material.dart';
import 'package:tapinvest/core/design_system/colors.dart';

import '../styles.dart';

class CustomChip extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function()? onTap;
  final EdgeInsets? margin;

  const CustomChip(
      {Key? key,
      required this.text,
      required this.isSelected,
      this.onTap,
      this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
          margin: margin,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          color: isSelected ? primaryColor : chipBgColor,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Text(text,
                style: secondaryTitleTextStyle(
                  color: isSelected ? buttonTextColor : secondaryTitleColor,
                )),
          )),
    );
  }
}
