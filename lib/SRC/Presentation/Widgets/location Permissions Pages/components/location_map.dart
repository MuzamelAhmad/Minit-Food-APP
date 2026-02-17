import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_food_app/SRC/Presentation/Common/text_form_field.dart';

import '../../../Common/app_images_paths.dart';
import '../../../Common/app_titles.dart';

class LocationMap extends StatefulWidget {
  const LocationMap({super.key});

  @override
  State<LocationMap> createState() => _LocationMapState();
}

class _LocationMapState extends State<LocationMap> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            AssetsImages.locationPageMapImage,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 10.0.h,
          left: 10.w,
          right: 10.0.w,
          child: CustomTextFormField(
            radius: 20.0.r,
            hintTitle: Titles.locationPageSearchHint,
            isObscure: false,
            prefixIconData: Icons.search_outlined,
          ),
        ),
      ],
    );
  }
}
