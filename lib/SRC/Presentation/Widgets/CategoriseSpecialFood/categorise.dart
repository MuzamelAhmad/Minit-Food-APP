import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_food_app/SRC/Presentation/Common/CustomButton.dart';
import 'package:mini_food_app/SRC/Presentation/Common/app_images_paths.dart';
import 'package:mini_food_app/SRC/Presentation/Common/favorite_icon_design.dart';
import 'package:mini_food_app/SRC/Presentation/Widgets/Notification%20Page/notification_page.dart';
import 'package:mini_food_app/SRC/Presentation/Widgets/ProductDetailsPage/product_details_page.dart';

import '../../../Data/repositories/data of models/serving_food_model.dart';
import '../../Common/app_titles.dart';
import '../../Common/custom_app_bar.dart';

class CategoriesSpecialFood extends StatefulWidget {
  const CategoriesSpecialFood({super.key});

  @override
  State<CategoriesSpecialFood> createState() => _CategoriesSpecialFood();
}

class _CategoriesSpecialFood extends State<CategoriesSpecialFood> {
  final ValueNotifier<bool> _isSwitched = ValueNotifier(false);
  ColorScheme get colors => Theme.of(context).colorScheme;
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
                leadOnTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationPage()),
                ),
                Size: 28.0.sp,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 5.0.w, right: 5.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60.0.h,
                      width: 220.0.w,
                      child: Text(
                        maxLines: 2,
                        'Healthy Taco Salad with fresh vegetable',
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
            SliverList.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsPage(
                            index: index,
                            foodData: ServingFoodModelData,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 420.h,
                      width: 300.w,
                      decoration: BoxDecoration(
                        color: colors.surface,
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(1, 1),
                            blurRadius: 1,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ],
                      ),

                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'The Chinese Kitchen',
                                  style: Theme.of(context).textTheme.labelMedium
                                      ?.copyWith(color: colors.primary),
                                ),
                                Container(
                                  height: 30.0.h,
                                  width: 41.0.w,
                                  decoration: BoxDecoration(
                                    color: colors.onPrimary,
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(
                                        AssetsImages.kitchenOwnerUserTypeImage,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 250.0.h,
                            width: 400.0.w,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              image: DecorationImage(
                                image: AssetImage(AssetsImages.foodModelImage4),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FavoriteIconDesign(index: 5),
                                  Text(
                                    'Available Now',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.primary,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(2.0),
                                child: SizedBox(
                                  height: 45.0.h,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 250.0.w,
                                        child: Text(
                                          maxLines: 2,
                                          'Healthy Taco Salad with fresh vegetable',
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodyMedium,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            color: colors.surface,
                                          ),
                                          Text(
                                            '${ServingFoodModelData[index].location} km',
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(2.0),
                                child: SizedBox(
                                  height: 30.0.h,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Pickup/Delivery',
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodyMedium,
                                      ),
                                      SizedBox(
                                        height: 30.0.h,
                                        width: 100.0.w,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: List.generate(
                                            5,
                                            (index) => Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(2.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Price: ',
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodyMedium,
                                        ),
                                        Text(
                                          '\$${ServingFoodModelData[index].foodPrice} ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(color: colors.error),
                                        ),
                                      ],
                                    ),
                                    CustomButton(
                                      buttonTitle: 'Add to cart',
                                      width: 110.0.w,
                                      height: 30.0.h,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
