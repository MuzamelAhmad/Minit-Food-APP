import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_food_app/SRC/Presentation/Common/CustomButton.dart';
import 'package:mini_food_app/SRC/Presentation/Common/app_titles.dart';
import 'package:mini_food_app/SRC/Presentation/Common/custom_app_bar.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../Common/app_images_paths.dart';
import 'Location Page/location_screen.dart';

class LocationPermissionHandler extends StatefulWidget {
  const LocationPermissionHandler({super.key});

  @override
  State<LocationPermissionHandler> createState() =>
      _LocationPermissionHandlerState();
}

class _LocationPermissionHandlerState extends State<LocationPermissionHandler> {
  void ontTapBotton() {
    onTapEnableLocation(Permission.location);
  }

  Future<void> onTapEnableLocation(Permission permission) async {
    final status = await permission.request();
    if (status.isGranted) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LocationScreen()),
      );
      print('Permission Granted');
    } else if (status.isDenied) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Permission Denied')));

      print('Permission Denied');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(isNavigationIcon: false),
            SizedBox(height: 50.0.h),
            SizedBox(
              height: 350.0.h,
              width: 350.0.w,
              child: Image.asset(AssetsImages.locationPageImage),
            ),
            SizedBox(height: 80.0.h),
            SizedBox(
              width: 300.0.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Titles.locationPermission,
                    style: Theme.of(
                      context,
                    ).textTheme.labelMedium?.copyWith(fontSize: 20),
                  ),
                  SizedBox(height: 10.0.h),
                  Text(
                    textAlign: TextAlign.center,
                    Titles.locationPermissionSubTitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 100.0.h,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomButton(
            buttonTitle: Titles.locationPermissionBotton,
            iconData: Icons.location_on_outlined,
            onTap: ontTapBotton,
          ),
        ),
      ),
    );
  }
}
