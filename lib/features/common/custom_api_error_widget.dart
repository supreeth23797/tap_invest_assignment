import 'package:flutter/material.dart';

class CustomApiErrorWidget extends StatelessWidget {
  const CustomApiErrorWidget({super.key, required this.errorMsg});

  final String errorMsg;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Failed'),
        const SizedBox(height: 8),
        Text(
          errorMsg,
        ),
      ],
    );
  }
}
