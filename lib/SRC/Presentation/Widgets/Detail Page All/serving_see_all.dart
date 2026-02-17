import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show SizeExtension;

import '../../Common/app_titles.dart';
import '../../Common/builder_of_serving.dart';
import '../../Common/custom_app_bar.dart';

class ServingSeeAll extends StatefulWidget {
  const ServingSeeAll({super.key});

  @override
  State<ServingSeeAll> createState() => _ServingSeeAllState();
}

class _ServingSeeAllState extends State<ServingSeeAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              navigationOnTap: () => Navigator.pop(context),
              isNavigationIcon: true,
              widgetTitle: Row(
                children: [
                  Icon(Icons.location_on_outlined),
                  Text(
                    Titles.locationAddressDetailPageAddress,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Icon(Icons.arrow_drop_down_outlined, size: 30),
                ],
              ),
              leadIcon: Icons.notifications_none_outlined,
              Size: 28.0.sp,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Container(
                height: 30.0.h,
                // color: Colors.red,
                child: Text(
                  Titles.homePageBuilderLabel,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: BuilderOfServing(isHorizontal: false),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
