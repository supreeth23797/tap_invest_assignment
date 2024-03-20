import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tapinvest/core/design_system/colors.dart';
import 'package:tapinvest/core/design_system/sizes.dart';
import 'package:tapinvest/core/design_system/widgets/custom_appbar.dart';
import 'package:tapinvest/core/design_system/widgets/custom_bottom_bar.dart';
import 'package:tapinvest/core/design_system/widgets/custom_chip.dart';
import 'package:tapinvest/core/design_system/widgets/custom_details_card.dart';
import 'package:tapinvest/core/design_system/widgets/custom_primary_button.dart';
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

class _SchemeDetailsScreenContents
    extends ConsumerState<SchemeDetailsScreenContents> {
  String selectedChip = financials;

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
            highlights(),
            customDivider(),
            keyMetrics(),
            customDivider(),
            documentsView(),
            gapH64
          ],
        )),
        bottomNavigationBar: CustomBottomBar(
          body: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  text: filled,
                  style: secondaryTextStyle(size: 10),
                  children: [
                    TextSpan(text: '\n30%', style: primaryTextStyle(size: 18)),
                  ],
                ),
              ),
              CustomPrimaryButton(
                text: tapToInvest,
                onPressed: () {},
              )
            ],
          ),
        ));
  }

  Widget schemeDetails() {
    return Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.memory(base64Decode(widget.schemeDetails.logo)),
            gapH16,
            Row(
              children: [
                Text(
                  widget.schemeDetails.name1,
                  style: boldTextStyle(size: headingTextSize),
                ),
                gapW8,
                SvgPicture.asset(TapAssets.icons.icLeftArrow.path),
                gapW8,
                Text(
                  widget.schemeDetails.name2,
                  style: boldTextStyle(
                      size: headingTextSize, color: secondaryTextColor),
                )
              ],
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
      SvgPicture.asset(TapAssets.logos.icGoogle.path),
      SvgPicture.asset(TapAssets.logos.icGoogle.path),
      SvgPicture.asset(TapAssets.logos.icGoogle.path),
    ];
    List<Widget> backedByList = [
      SvgPicture.asset(TapAssets.logos.icGoogle.path),
      SvgPicture.asset(TapAssets.logos.icGoogle.path),
      SvgPicture.asset(TapAssets.logos.icGoogle.path),
    ];
    return Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              clients,
              style: boldTextStyle(),
            ),
            gapH12,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                ...clientsList.map((item) => Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: item,
                    )),
              ]),
            ),
            gapH20,
            Text(
              backedBy,
              style: boldTextStyle(),
            ),
            gapH12,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                ...backedByList.map((item) => Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: item,
                    )),
              ]),
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
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text(
            highlight,
            style: boldTextStyle(),
          ),
          gapH20,
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...highlightsList.map((item) => CustomDetailsCard(
                    maxWidth: 300,
                        message: item,
                        margin: const EdgeInsets.only(right: 16),
                        iconPath: TapAssets.icons.icBulb.path,
                      )),
                ],
              ))
        ]));
  }

  Widget keyMetrics() {
    List<String> keyMetricsList = [
      funding,
      traction,
      financials,
      competitions,
    ];

    List<Widget> keyMetricsDetailsList = [
      fundingView(),
      tractionView(),
      financialsView(),
      competitionsView(),
    ];
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            keyMetric,
            style: boldTextStyle(),
          ),
          gapH20,
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...keyMetricsList.map((item) => CustomChip(
                        text: item,
                        isSelected: selectedChip == item,
                        margin: const EdgeInsets.only(right: 10),
                        onTap: () {
                          setState(() {
                            selectedChip = item;
                          });
                        },
                      )),
                ],
              )),
          gapH24,
          keyMetricsDetailsList[keyMetricsList.indexOf(selectedChip)]
        ],
      ),
    );
  }

  Widget fundingView() {
    return CustomTable(rows: [
      TableRow(children: [
        CustomTableCell(
          title: activeDeals,
          body: RichText(
            text: TextSpan(
              text: widget.schemeDetails.activeDeals.toString(),
              style: primaryTextStyle(),
              children: [
                TextSpan(
                    text: ' of ${widget.schemeDetails.totalDeals}',
                    style: secondaryTextStyle()),
              ],
            ),
          ),
        ),
        CustomTableCell(
          title: raised,
          body: RichText(
            text: TextSpan(
              text: CURRENCY,
              style: secondaryTextStyle(),
              children: [
                TextSpan(
                    text: widget.schemeDetails.capRaised.toString(),
                    style: primaryTextStyle()),
              ],
            ),
          ),
        )
      ]),
      TableRow(children: [
        CustomTableCell(
          title: maturedDeals,
          body: RichText(
            text: TextSpan(
              text: widget.schemeDetails.maturedDeals.toString(),
              style: primaryTextStyle(),
              children: [
                TextSpan(
                    text: ' of ${widget.schemeDetails.totalDeals}',
                    style: secondaryTextStyle()),
              ],
            ),
          ),
        ),
        CustomTableCell(
          title: activeDeals,
          body: RichText(
            text: TextSpan(
              text: widget.schemeDetails.onTimePaymentPercentage.toString(),
              style: primaryTextStyle(),
              children: [
                TextSpan(text: '%', style: secondaryTextStyle()),
              ],
            ),
          ),
        ),
      ])
    ]);
  }

  Widget tractionView() {
    return fundingView();
  }

  Widget financialsView() {
    return fundingView();
  }

  Widget competitionsView() {
    return fundingView();
  }

  Widget documentsView() {
    return Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              documents,
              style: boldTextStyle(),
            ),
            gapH20,
            CustomDetailsCard(
              iconPath: TapAssets.icons.icDocument.path,
              title: invDiscountingContractTitle,
              message: invDiscountingContractInfo,
              actionIconBtn: IconButton(
                icon: SvgPicture.asset(TapAssets.icons.icDownload.path),
                onPressed: () {},
              ),
            ),
            gapH16,
            CustomDetailsCard(
              iconPath: TapAssets.icons.icTab.path,
              title: invDiscountingContractTitle,
              message: invDiscountingContractInfo,
              actionIconBtn: IconButton(
                icon: SvgPicture.asset(TapAssets.icons.icDownload.path),
                onPressed: () {},
              ),
            )
          ],
        ));
  }
}
