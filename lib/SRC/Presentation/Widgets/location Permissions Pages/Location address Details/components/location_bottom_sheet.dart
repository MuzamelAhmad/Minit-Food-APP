import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_food_app/SRC/Presentation/Common/CustomButton.dart';
import 'package:mini_food_app/SRC/Presentation/Common/app_titles.dart';
import 'package:mini_food_app/SRC/Presentation/Common/text_form_field.dart';
import 'package:mini_food_app/SRC/Presentation/Widgets/Bottom%20Navigation/bottom_navigation.dart';

import 'Tiles/tag_button.dart';

class LocationBottomSheet extends StatefulWidget {
  const LocationBottomSheet({super.key});

  @override
  State<LocationBottomSheet> createState() => _LocationBottomSheetState();
}

class _LocationBottomSheetState extends State<LocationBottomSheet> {
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
              crossAxisAlignment: CrossAxisAlignment.start,
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

                /// Your Location Title Row
                Text(
                  Titles.locationAddressDetailPageTitle,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 20.h),
                Text(
                  Titles.locationPageSubTitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),

                SizedBox(height: 10.h),

                /// Location row
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.green),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Text(
                        Titles.locationAddressDetailPageAddress,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    Text(
                      Titles.locationPageTextButtonTitle,
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20.h),

                /// Complete Address Field
                Text(
                  Titles.locationAddressDetailPageFieldTitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 8.h),
                CustomTextFormField(
                  prefixIconData: Icons.house_outlined,
                  hintTitle: Titles.locationAddressDetailPageFieldHint,
                  isObscure: false,
                ),

                SizedBox(height: 15.h),

                /// How to Reach Field
                Text(
                  Titles.locationAddressDetailPageField2Title,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 8.h),
                CustomTextFormField(
                  prefixIconData: Icons.drive_eta_outlined,
                  hintTitle: Titles.locationAddressDetailPageField2Hint,
                  isObscure: false,
                ),
                SizedBox(height: 20.h),

                /// Tags
                Text(
                  Titles.locationAddressDetailPageTagTitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 10.h),

                Wrap(
                  spacing: 10.w,
                  children: List.generate(
                    TagList.length,
                    (index) => TagButton(label: TagList[index].toString()),
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
