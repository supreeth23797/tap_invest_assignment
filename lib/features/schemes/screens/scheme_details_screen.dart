import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapinvest/core/design_system/colors.dart';
import 'package:tapinvest/core/design_system/sizes.dart';
import 'package:tapinvest/core/design_system/widgets/custom_appbar.dart';
import 'package:tapinvest/core/design_system/widgets/custom_details_card.dart';
import 'package:tapinvest/core/design_system/widgets/custom_table_cell.dart';
import 'package:tapinvest/core/models/scheme_details.dart';
import 'package:tapinvest/gen/assets.gen.dart';
import 'package:tapinvest/utils/constants.dart';

import '../../../core/design_system/strings.dart';
import '../../../core/design_system/styles.dart';
import '../../../core/design_system/widgets/custom_divider.dart';
import '../../../core/design_system/widgets/custom_table.dart';
import '../../common/async_value_widget.dart';
import '../schemes_service.dart';

class SchemeDetailsScreen extends StatelessWidget {
  SchemeDetailsScreen({super.key, required this.scheme});

  final String scheme;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final schemeDetails = ref.watch(getSchemeDetailsProvider(scheme));
        return AsyncValueWidget<SchemeDetails>(
          value: schemeDetails,
          data: (data) => SchemeDetailsScreenContents(
            schemeDetails: data,
          ),
        );
      },
    );
  }
}

class SchemeDetailsScreenContents extends ConsumerStatefulWidget {
  const SchemeDetailsScreenContents({super.key, required this.schemeDetails});

  final SchemeDetails schemeDetails;

  @override
  ConsumerState<SchemeDetailsScreenContents> createState() =>
      _SchemeDetailsScreenContents();
}

class _SchemeDetailsScreenContents extends ConsumerState<SchemeDetailsScreenContents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: backToDeals,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          schemeDetails(),
          customDivider(),
          clientsAndBackedBy(),
          customDivider(),
          highlights()
        ],
      )),
    );
  }

  Widget schemeDetails() {
    return Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.memory(base64Decode(widget.schemeDetails.logo)),
            gapH16,
            RichText(
              text: TextSpan(
                text: widget.schemeDetails.name,
                style: boldTextStyle(),
                children: [
                  TextSpan(
                      text: widget.schemeDetails.name,
                      style: boldTextStyle(color: secondaryTextColor)),
                ],
              ),
            ),
            gapH12,
            Text(
              widget.schemeDetails.details,
              overflow: TextOverflow.ellipsis,
              style: secondaryTextStyle(),
              maxLines: 2,
            ),
            gapH16,
            CustomTable(rows: [
              TableRow(children: [
                CustomTableCell(
                  title: minInv,
                  body: RichText(
                    text: TextSpan(
                      text: CURRENCY,
                      style: primaryTextStyle(color: secondaryTextColor),
                      children: [
                        TextSpan(
                            text: widget.schemeDetails.minInvestment.toString(),
                            style: primaryTextStyle()),
                      ],
                    ),
                  ),
                ),
                CustomTableCell(
                  title: tenure,
                  body: RichText(
                    text: TextSpan(
                      text: widget.schemeDetails.tenure.toString(),
                      style: primaryTextStyle(),
                      children: [
                        TextSpan(
                            text: widget.schemeDetails.tenureUnit,
                            style: secondaryTextStyle()),
                      ],
                    ),
                  ),
                )
              ]),
              TableRow(children: [
                CustomTableCell(
                  title: netYield,
                  body: RichText(
                    text: TextSpan(
                      text: widget.schemeDetails.netYield.toString(),
                      style: primaryTextStyle(),
                      children: [
                        TextSpan(text: '%', style: secondaryTextStyle()),
                      ],
                    ),
                  ),
                ),
                CustomTableCell(
                  title: raised,
                  body: RichText(
                    text: TextSpan(
                      text: widget.schemeDetails.capRaisedPercentage.toString(),
                      style: primaryTextStyle(),
                      children: [
                        TextSpan(text: '%', style: secondaryTextStyle()),
                      ],
                    ),
                  ),
                )
              ])
            ])
          ],
        ));
  }

  Widget clientsAndBackedBy() {
    List<Widget> clientsList = [
      TapAssets.logos.google.image(),
      TapAssets.logos.google.image(),
      TapAssets.logos.google.image(),
    ];
    List<Widget> backedByList = [
      TapAssets.logos.google.image(),
      TapAssets.logos.google.image(),
      TapAssets.logos.google.image(),
    ];
    return Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              clients,
              style: boldTextStyle(),
            ),
            gapH12,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: clientsList,
              ),
            ),
            gapH20,
            Text(
              backedBy,
              style: boldTextStyle(),
            ),
            gapH12,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: backedByList,
              ),
            )
          ],
        ));
  }

  Widget highlights() {
    List<String> highlightsList = [
      widget.schemeDetails.highlights,
      widget.schemeDetails.highlights,
      widget.schemeDetails.highlights,
    ];
    return Padding(
        padding: const EdgeInsets.all(24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            highlight,
            style: boldTextStyle(),
          ),
          gapH12,
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...highlightsList.map((item) => CustomDetailsCard(
                        maxWidth: 300,
                        message: item,
                        margin: const EdgeInsets.only(right: 16),
                        icon: TapAssets.icons.icBulb.svg(),
                      )),
                ],
              ))
        ]));
  }
}
