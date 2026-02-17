import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_food_app/SRC/Presentation/Common/CustomButton.dart';
import 'package:mini_food_app/SRC/Presentation/Common/app_titles.dart';
import 'package:mini_food_app/SRC/Presentation/Widgets/Bottom%20Navigation/bottom_navigation.dart';

import '../../../../Common/text_form_field.dart';

class AddToCartSheet extends StatefulWidget {
  const AddToCartSheet({super.key});

  @override
  State<AddToCartSheet> createState() => _AddToCartSheetState();
}

class _AddToCartSheetState extends State<AddToCartSheet> {
  List TagList = ["Home", "Work", "Office", "Other"];
  void onTapSaveAddress() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BottomNavigationScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.75.h,
      maxChildSize: 0.80.h,
      minChildSize: 0.45.h,
      builder: (context, scrollController) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.r),
              topRight: Radius.circular(25.r),
            ),
          ),

          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// DRAG HANDLE
                Center(
                  child: Container(
                    height: 5.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                Text(
                  'Healthy Taco Salad',
                  style: Theme.of(context).textTheme.titleMedium,
                ),

                Container(
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
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Checkbox(value: true, onChanged: (_) {}),
                            SizedBox(width: 5.w),
                            Expanded(
                              child: Text(
                                'Special',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            Text(
                              '\$0.60',
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(value: false, onChanged: (_) {}),
                            SizedBox(width: 5.w),
                            Expanded(
                              child: Text(
                                'Mayonnaise',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            Text(
                              '\$0.80',
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
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
                  child: Column(
                    children: [
                      Text(
                        'Instruction',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Container(
                        height: 100.0.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Theme.of(context).colorScheme.surface,
                        ),
                        child: CustomTextFormField(
                          hintTitle: 'Add instruction',
                          isObscure: false,
                          radius: 10.0.r,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
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
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Checkbox(value: true, onChanged: (_) {}),
                            SizedBox(width: 5.w),
                            Expanded(
                              child: Text(
                                'Coke',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            Text(
                              '\$0.60',
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(value: false, onChanged: (_) {}),
                            SizedBox(width: 5.w),
                            Expanded(
                              child: Text(
                                'Marinda',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            Text(
                              '\$0.80',
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 25.h),

                /// Save Address Button
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                    bottom: 10.0,
                    top: 10.0,
                  ),
                  child: CustomButton(
                    buttonTitle: Titles.locationAddressDetailPageButton,
                    height: 40.0.h,
                    onTap: onTapSaveAddress,
                  ),
                ),

                SizedBox(height: 20.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
