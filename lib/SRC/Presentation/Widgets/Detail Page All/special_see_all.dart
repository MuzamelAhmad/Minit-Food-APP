import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Common/app_titles.dart';
import '../../Common/custom_app_bar.dart';
import '../Home Page/components/GridView/gridview_builder.dart';

class SpecialSeeAll extends StatefulWidget {
  const SpecialSeeAll({super.key});

  @override
  State<SpecialSeeAll> createState() => _SpecialSeeAllState();
}

class _SpecialSeeAllState extends State<SpecialSeeAll> {
  final ValueNotifier<bool> _isSwitched = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CustomAppBar(
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
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 5.0.w, right: 5.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 30.0.h,
                      child: Text(
                        Titles.homePageBuilder2Label,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                    SizedBox(
                      height: 30.0.h,
                      child: Row(
                        children: [
                          Text(
                            'Delivery Only',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          ValueListenableBuilder(
                            valueListenable: _isSwitched,
                            builder: (context, value, child) {
                              return Switch(
                                value: _isSwitched
                                    .value, // Current state of the switch
                                onChanged: (bool newValue) {
                                  // Callback when the user toggles
                                  setState(() {
                                    _isSwitched.value =
                                        newValue; // Update the state
                                  });
                                },
                                activeColor:
                                    Colors.blue, // Color when the switch is ON
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GridviewBuilder(),
          ],
        ),
      ),
    );
  }
}
