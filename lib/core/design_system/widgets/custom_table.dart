import 'package:flutter/cupertino.dart';
import 'package:tapinvest/core/design_system/colors.dart';

class CustomTable extends StatelessWidget {
  CustomTable({super.key, required this.rows});

  List<TableRow> rows;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: tableBgColor,
        child: Table(
          border: TableBorder.all(
              width: 1.5,
              color: borderColor,
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          children: rows,
        ));
  }
}
