import 'package:flutter/cupertino.dart';

class CustomKeyValueView extends StatelessWidget {
  CustomKeyValueView({
    super.key,
    required this.leftWidget,
    required this.rightWidget,
    this.noPadding = false,
  });

  Widget leftWidget;
  Widget rightWidget;
  bool noPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(noPadding ? 0 : 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: leftWidget),
            Flexible(child: rightWidget),
          ],
        ));
  }
}
