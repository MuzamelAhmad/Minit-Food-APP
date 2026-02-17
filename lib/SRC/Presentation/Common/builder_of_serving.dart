import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_food_app/SRC/Presentation/Common/app_images_paths.dart';
import 'package:mini_food_app/SRC/Presentation/Widgets/ProductDetailsPage/product_details_page.dart';

import '../../Data/repositories/data of models/serving_food_model.dart';
import 'favorite_icon_design.dart';

class BuilderOfServing extends StatefulWidget {
  final bool isHorizontal;
  const BuilderOfServing({super.key, required this.isHorizontal});

  @override
  State<BuilderOfServing> createState() => _BuilderOfServingState();
}

class _BuilderOfServingState extends State<BuilderOfServing> {
  ColorScheme get colors => Theme.of(context).colorScheme;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ServingFoodModelData.length,
      scrollDirection: widget.isHorizontal ? Axis.horizontal : Axis.vertical,
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
              width: 300.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                image: DecorationImage(
                  image: AssetImage(ServingFoodModelData[index].foodImage),
                  fit: BoxFit.cover,
                ),
                color: Colors.grey,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox.shrink(),
                        FavoriteIconDesign(index: index),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      height: 100.0.h,
                      width: 320.0.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0.r),
                        color: colors.onSurface.withAlpha((255 * 0.2).toInt()),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(2.0),
                            child: SizedBox(
                              width: 250.0.w,
                              child: Text(
                                ServingFoodModelData[index].foodName,
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(color: colors.surface),
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(color: colors.surface),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        color: colors.surface,
                                      ),
                                      Text(
                                        '${ServingFoodModelData[index].location} km',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(color: colors.surface),
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
                                  Row(
                                    children: [
                                      Container(
                                        height: 30.0.h,
                                        width: 30.0.w,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: colors.surface,
                                          border: Border.all(
                                            color: colors.surface,
                                          ),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              AssetsImages
                                                  .kitchenOwnerUserTypeImage,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 2.0.w),
                                      Text(
                                        ServingFoodModelData[index].ownerName,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(color: colors.surface),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30.0.h,
                                    width: 100.0.w,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
