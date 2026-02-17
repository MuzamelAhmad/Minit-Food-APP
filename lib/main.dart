import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_food_app/SRC/Data/Resources/ThemesData/light_theme_data.dart';

// import 'package:mini_food_app/SRC/Presentation/Widgets/Bottom%20Navigation/bottom_navigation.dart';

import 'SRC/Presentation/Widgets/Splash Screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      minTextAdapt: true, // this initializes _minTextAdapt correctly
      splitScreenMode: true,
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Mini Food App',
          theme: LightTheme.getTheme(context),
          home: SplashScreen(),
        );
      },
    );
  }
}
