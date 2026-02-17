import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_food_app/SRC/Data/repositories/data%20of%20models/CategoriesList/categories_list.dart';
import 'package:mini_food_app/SRC/Data/repositories/data%20of%20models/serving_food_model.dart';
import 'package:mini_food_app/SRC/Presentation/Common/custom_app_bar.dart';
import 'package:mini_food_app/SRC/Presentation/Widgets/ProductDetailsPage/components/cart_page.dart';
import 'package:mini_food_app/SRC/Presentation/Widgets/Review%20Page/review_page.dart';

import '../../../Data/repositories/data of models/food_model_data.dart';
import '../../Common/CustomButton.dart';
import '../../Common/app_images_paths.dart';
import '../../Common/favorite_icon_design.dart';

class ProductDetailsPage extends StatefulWidget {
  final int index;
  final List foodData;
  const ProductDetailsPage({
    super.key,
    required this.index,
    required this.foodData,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  ValueNotifier<int> selected = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    height: 250.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          widget.foodData[widget.index].foodImage,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: CustomAppBar(
                        isNavigationIcon: true,
                        title: '',
                        widgetLead: FavoriteIconDesign(index: widget.index),
                        navigationOnTap: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                  Transform(
                    transform: Matrix4.translationValues(0, -20, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          topRight: Radius.circular(20.r),
                        ),
                        color: Theme.of(context).colorScheme.surface,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                        child: Column(
                          children: [
                            Transform(
                              transform: Matrix4.translationValues(0, -55, 0),
                              child: Container(
                                height: 100.h,
                                width: 120.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).colorScheme.surface,
                                  border: Border.all(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    width: 2.w,
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      AssetsImages.kitchenOwnerUserTypeImage,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Transform(
                              transform: Matrix4.translationValues(0, -30, 0),
                              child: Text(
                                widget.foodData[widget.index].resName,
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                            SizedBox(height: 5.0.h),
                            SizedBox(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Pickup/delivery',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyLarge,
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ReviewPage(),
                                          ),
                                        ),
                                        child: Text(
                                          'Review',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                color: Theme.of(
                                                  context,
                                                ).colorScheme.primary,
                                              ),
                                        ),
                                      ),
                                      SizedBox(width: 5.w),
                                      Text(
                                        '${widget.foodData[widget.index].rating}',
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodyMedium,
                                      ),
                                      SizedBox(width: 2.w),
                                      Icon(Icons.star, color: Colors.amber),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.0.h),
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                maxLines: 3,
                                textAlign: TextAlign.center,
                                '''Chinese homemade cuisine is a rich tapestry of flavors and traditions passed down through generations. It emphasizes fresh ingredients.''',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            SizedBox(height: 20.0.h),
                            ValueListenableBuilder(
                              valueListenable: selected,
                              builder: (context, value, child) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: List.generate(
                                    CategoriesList.categories.length,
                                    (index) => Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: InkWell(
                                        onTap: () {
                                          selected.value = index;
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              10.r,
                                            ),
                                            color: selected.value == index
                                                ? Theme.of(
                                                    context,
                                                  ).colorScheme.primary
                                                : Theme.of(
                                                    context,
                                                  ).colorScheme.surface,
                                            boxShadow: [
                                              BoxShadow(
                                                offset: Offset(1, 1),
                                                blurRadius: 1,
                                                color: Theme.of(
                                                  context,
                                                ).colorScheme.secondary,
                                              ),
                                            ],
                                          ),
                                          height: 120.0.h,
                                          width: 75.0.w,
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 70.h,
                                                width: 75.w,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                              10.r,
                                                            ),
                                                        topRight:
                                                            Radius.circular(
                                                              10.r,
                                                            ),
                                                      ),
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                      CategoriesList
                                                          .categories[index]['Image'],
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 50.h,
                                                width: 75.w,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                              10.r,
                                                            ),
                                                        bottomRight:
                                                            Radius.circular(
                                                              10.r,
                                                            ),
                                                      ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    '${CategoriesList.categories[index]['Title']}',
                                                    style: Theme.of(
                                                      context,
                                                    ).textTheme.bodySmall,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          body: CustomScrollView(
            slivers: [
              ValueListenableBuilder(
                valueListenable: selected,
                builder: (context, value, child) {
                  return SliverList.builder(
                    itemCount: selected.value == 0 || selected.value == 2
                        ? foodModelData.length
                        : ServingFoodModelData.length,
                    itemBuilder: (context, index) {
                      final data;
                      if (selected.value == 0 || selected.value == 2) {
                        data = foodModelData[index];
                      } else {
                        data = ServingFoodModelData[index];
                      }
                      return Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Container(
                          height: 130.0.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Theme.of(context).colorScheme.surface,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(1, 1),
                                blurRadius: 1,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ],
                          ),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 120.0.h,
                                width: 100.0.w,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(data.foodImage),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0.r),
                                ),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 40.0.h,
                                        width: 200.0.w,
                                        child: Text(
                                          maxLines: 2,
                                          data.foodDescription,
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodyMedium,
                                        ),
                                      ),
                                      FavoriteIconDesign(index: index),
                                    ],
                                  ),
                                  Row(
                                    children: List.generate(
                                      5,
                                      (index) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 15.0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 250.0.w,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          height: 40.0.h,
                                          child: Row(
                                            children: [
                                              Text(
                                                "Price: ",
                                                style: Theme.of(
                                                  context,
                                                ).textTheme.labelLarge,
                                              ),
                                              Text(
                                                "\$${data.foodPrice}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge
                                                    ?.copyWith(
                                                      color: Theme.of(
                                                        context,
                                                      ).colorScheme.error,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        CustomButton(
                                          buttonTitle: 'Add to cart',
                                          width: 110.0.w,
                                          height: 38.0.h,
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => CartPage(
                                                  index: widget.index,
                                                  foodData: widget.foodData,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
