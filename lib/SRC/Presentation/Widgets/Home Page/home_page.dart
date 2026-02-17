import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_food_app/SRC/Presentation/Common/app_titles.dart';
import 'package:mini_food_app/SRC/Presentation/Common/custom_app_bar.dart';
import 'package:mini_food_app/SRC/Presentation/Widgets/Detail%20Page%20All/serving_see_all.dart';
import 'package:mini_food_app/SRC/Presentation/Widgets/Notification%20Page/notification_page.dart';

import '../../Common/builder_of_serving.dart';
import '../../Common/text_form_field.dart';
import '../Detail Page All/special_see_all.dart';
import 'components/GridView/gridview_builder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CustomAppBar(
            isNavigationIcon: true,
            iconNavigation: Icons.location_on_outlined,
            naviColor: Theme.of(context).colorScheme.primary,
            widgetTitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      Titles.homePageTitle,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Icon(Icons.arrow_drop_down_outlined, size: 30),
                  ],
                ),
                Text(
                  Titles.locationAddressDetailPageAddress,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            leadIcon: Icons.notifications_none_outlined,
            leadOnTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationPage()),
              );
            },
            Size: 28.0.sp,
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 80.h,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child:
                SizedBox(
                  width: 300.w,
                  height: 65.0.h,
                  child: CustomTextFormField(
                    hintTitle: Titles.locationPageSearchHint,
                    isObscure: false,
                    prefixIconData: Icons.search,
                    radius: 12.0.r,
                  ),
                ),
                // ),
                Container(
                  height: 50.h,
                  width: 45.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Theme.of(context).colorScheme.surface,
                    boxShadow: [
                      BoxShadow(offset: Offset(1, 0.1), blurRadius: 1),
                    ],
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/Filter_icon.svg',
                      height: 30.0.h,
                      width: 30.0.w,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Titles.homePageBuilderLabel,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ServingSeeAll()),
                    );
                  },
                  child: Text(
                    Titles.homePageAllLabel,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 180.0.h,
            child: BuilderOfServing(isHorizontal: true),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Titles.homePageBuilder2Label,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SpecialSeeAll()),
                    );
                  },
                  child: Text(
                    Titles.homePageAllLabel,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        GridviewBuilder(),
      ],
    );
  }
}
