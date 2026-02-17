import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_food_app/SRC/Presentation/Widgets/Auth/Login/Login.dart';

import 'app_titles.dart';

class OtpBottomNavigation extends StatelessWidget {
  const OtpBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0.h,
      child: Center(
        child: InkWell(
          onTap: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
              (route) => false,
            );
          },
          child: Text(
            textAlign: TextAlign.center,
            Titles.forgetPasswordBottomLabel,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
