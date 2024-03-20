import 'package:flutter/material.dart';
import 'package:tapinvest/core/design_system/colors.dart';

class CustomPrimaryButton extends StatelessWidget {
  String text;
  Function()? onPressed;
  bool? isLoading;
  bool isEnabled;

  CustomPrimaryButton(
      {super.key,
      required this.text,
      this.onPressed,
      this.isLoading = false,
      this.isEnabled = true});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: isLoading == false && isEnabled ? onPressed ?? () {} : null,
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(vertical: 12)),
          backgroundColor: MaterialStateProperty.all(
              onPressed != null && isLoading == false && isEnabled
                  ? buttonEnabledColor
                  : buttonDisabledColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isLoading == true) ...[
                  const SizedBox(
                    height: 16,
                    width: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                  const SizedBox(width: 4),
                ],
                Text(
                  text,
                  style: TextStyle(
                    color: buttonTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
