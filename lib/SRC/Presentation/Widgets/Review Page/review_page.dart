import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_food_app/SRC/Presentation/Common/app_images_paths.dart';
import 'package:mini_food_app/SRC/Presentation/Widgets/Notification%20Page/notification_page.dart';

import '../../Common/CustomButton.dart';
import '../../Common/custom_app_bar.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CustomAppBar(
                isNavigationIcon: true,
                title: '',
                leadIcon: Icons.notifications_none,
                Size: 30.0.sp,
                navigationOnTap: () => Navigator.pop(context),
                leadOnTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationPage()),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rating and Reviews',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Row(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          Icons.star,
                          size: 19,
                          color: Colors.amberAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  height: 150.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Theme.of(context).colorScheme.surface,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(1, 1),
                        blurRadius: 1,
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withAlpha((255 * 0.4).toInt()),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 120.0.h,
                        width: 200.0.w,
                        // color: Colors.green,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '5 ⭐',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.labelMedium,
                                ),
                                Container(
                                  height: 10.0.h,
                                  width: 150.0.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 0.2.w,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurface,
                                    ),
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: Colors.amberAccent,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '4 ⭐',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.labelMedium,
                                ),
                                Container(
                                  height: 10.0.h,
                                  width: 150.0.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 0.2.w,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurface,
                                    ),
                                    borderRadius: BorderRadius.circular(10.r),
                                    gradient: LinearGradient(
                                      begin: AlignmentGeometry.directional(
                                        0,
                                        1,
                                      ),
                                      colors: [
                                        Colors.amberAccent,
                                        Colors.white,
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '3 ⭐',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.labelMedium,
                                ),
                                Container(
                                  height: 10.0.h,
                                  width: 150.0.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 0.2.w,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurface,
                                    ),
                                    borderRadius: BorderRadius.circular(10.r),
                                    gradient: LinearGradient(
                                      begin: AlignmentGeometry.directional(
                                        -1.1,
                                        1,
                                      ),
                                      colors: [
                                        Colors.amberAccent,
                                        Colors.white,
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '2 ⭐',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.labelMedium,
                                ),
                                Container(
                                  height: 10.0.h,
                                  width: 150.0.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 0.2.w,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurface,
                                    ),
                                    borderRadius: BorderRadius.circular(10.r),
                                    gradient: LinearGradient(
                                      begin: AlignmentGeometry.directional(
                                        -1.9,
                                        1,
                                      ),
                                      colors: [
                                        Colors.amberAccent,
                                        Colors.white,
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '1  ⭐',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.labelMedium,
                                ),
                                Container(
                                  height: 10.0.h,
                                  width: 150.0.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 0.2.w,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurface,
                                    ),
                                    borderRadius: BorderRadius.circular(10.r),
                                    gradient: LinearGradient(
                                      end: AlignmentGeometry.directional(
                                        0,
                                        3.9,
                                      ),
                                      colors: [
                                        Colors.amberAccent,
                                        Colors.white,
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 120.0.h,
                        width: 120.0.w,
                        // color: Colors.amberAccent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '4.5',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: List.generate(
                                5,
                                (index) => Icon(
                                  Icons.star,
                                  size: 19,
                                  color: Colors.amberAccent,
                                ),
                              ),
                            ),
                            Text(
                              '58 Reviews',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Theme.of(context).colorScheme.surface,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(1, 1),
                        blurRadius: 1,
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withAlpha((255 * 0.4).toInt()),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 50.h,
                        // color: Colors.amberAccent,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 50.0.h,
                              width: 80.0.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(
                                    AssetsImages.customerUserTypeImage,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'John Doe',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.labelMedium,
                                ),
                                Text(
                                  '⭐⭐⭐⭐⭐ (5.0)',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                            SizedBox(width: 70.0.w),
                            Text(
                              '2 mint ago',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          textAlign: TextAlign.start,
                          maxLines: 5,
                          'Consequat velit qui adipisicing sunt do rependerit ad laborum tempor ullamco exercitation. Ullamco tempor adipisicing et voluptate duis sit esse aliqua',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20.0),
        child: CustomButton(buttonTitle: 'Write a review'),
      ),
    );
  }
}
