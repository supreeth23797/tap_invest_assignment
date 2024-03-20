import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapinvest/core/design_system/widgets/custom_appbar.dart';
import 'package:tapinvest/core/models/scheme_details.dart';

import '../../../core/design_system/strings.dart';
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
          data: (data) => SchemeDetailsScreenContents(),
        );
      },
    );
  }
}

class SchemeDetailsScreenContents extends ConsumerStatefulWidget {
  const SchemeDetailsScreenContents({
    super.key,
  });

  @override
  ConsumerState<SchemeDetailsScreenContents> createState() =>
      _SchemeDetailsScreenContents();
}

class _SchemeDetailsScreenContents
    extends ConsumerState<SchemeDetailsScreenContents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: backToDeals,),
        body: Column(
          children: [],
        ),
        bottomNavigationBar: Column(
          children: [],
        ));
  }
}
