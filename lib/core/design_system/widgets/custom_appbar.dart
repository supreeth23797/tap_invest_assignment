import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tapinvest/core/design_system/colors.dart';
import 'package:tapinvest/core/design_system/styles.dart';
import 'package:tapinvest/gen/assets.gen.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  CustomAppBar({super.key, this.title, this.actions});

  final String? title;
  List<Widget>? actions = [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      toolbarHeight: 90,
      title: Text(title ?? '', style: primaryTextStyle(color: primaryColor),),
      leading: IconButton(
        icon: TapAssets.icons.icAppbarBack.svg(),
        onPressed: () => {
          context.pop(),
        },
      ),
      actions: actions ?? [],
      elevation: 0,
      backgroundColor: customBgColor,
      titleSpacing: 4,
    );
  }

  @override
  Size get preferredSize => _PreferredAppBarSize(90, 0);
}

class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight(
            (toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? bottomHeight;
}
