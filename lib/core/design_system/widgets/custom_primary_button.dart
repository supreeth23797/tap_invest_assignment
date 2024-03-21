import 'package:flutter/material.dart';
import 'package:tapinvest/core/design_system/colors.dart';
import 'package:tapinvest/core/design_system/styles.dart';

class CustomPrimaryButton extends StatelessWidget {
  String text;
  Function()? onPressed;
  bool isEnabled;

  CustomPrimaryButton(
      {super.key, required this.text, this.onPressed, this.isEnabled = true});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: isEnabled ? onPressed ?? () {} : null,
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(vertical: 14, horizontal: 22)),
          backgroundColor: MaterialStateProperty.all(
              onPressed != null && isEnabled
                  ? buttonEnabledColor
                  : buttonDisabledColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        child: Text(
          text,
          style: semiBoldTextStyle(color: buttonTextColor),
        ));
  }
}
