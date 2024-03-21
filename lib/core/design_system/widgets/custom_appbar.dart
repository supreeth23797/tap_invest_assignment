import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      title: Text(
        title ?? '',
        style: semiBoldTextStyle(color: primaryColor),
      ),
      leading: IconButton(
        icon: SvgPicture.asset(TapAssets.icons.icAppbarBack.path),
        onPressed: () => {
          context.pop(),
        },
      ),
      leadingWidth: 80,
      actions: actions ?? [],
      elevation: 0,
      backgroundColor: customBgColor,
      titleSpacing: 0,
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
