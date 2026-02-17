import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_food_app/SRC/Presentation/Common/app_images_paths.dart';
import 'package:mini_food_app/SRC/Presentation/Common/app_titles.dart';
import 'package:mini_food_app/SRC/Presentation/Widgets/Auth/Login/user_type_selection.dart';

import '../../Common/custom_app_bar.dart';

class OnBoardPage extends StatefulWidget {
  final int inputValue;
  const OnBoardPage({super.key, required this.inputValue});

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  final List<Map<String, String>> desPagesData = [
    {
      'image': 'assets/images/description_logo.png',
      'title': Titles.desTitle1,
      'subTitle': Titles.desSubTitle1,
    },
    {
      'image': 'assets/images/description_logo2.png',
      'title': Titles.desTitle2,
      'subTitle': Titles.desSubTitle2,
    },
    {
      'image': 'assets/images/description_logo_3.png',
      'title': Titles.desTitle3,
      'subTitle': Titles.desSubTitle3,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            AssetsImages.descriptionBackground,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          children: [
            CustomAppBar(
              isNavigationIcon: false,
              leadingText: widget.inputValue == 0 || widget.inputValue == 1
                  ? Titles.appBarTitle
                  : null,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserTypeSelection()),
                );
              },
            ),
            SizedBox(height: widget.inputValue == 0 ? 35.h : 170.h),
            ImageSlider(index: widget.inputValue, desPagesData: desPagesData),
          ],
        ),
      ],
    );
  }
}

class ImageSlider extends StatelessWidget {
  const ImageSlider({
    super.key,
    required this.index,
    required this.desPagesData,
  });

  final int index;
  final List<Map<String, String>> desPagesData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: index == 0 ? 435.0.h : 300.0.h,
            child: Image.asset(
              desPagesData[index]['image']!,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            desPagesData[index]['title']!,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: 10.h),
          SizedBox(
            width: 300.0.w,
            height: 70.0.h,
            child: Center(
              child: Text(
                maxLines: 4,
                textAlign: TextAlign.center,
                desPagesData[index]['subTitle']!,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PositionContainer extends StatelessWidget {
  const PositionContainer({super.key, required this.isCircle});

  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isCircle ? 30.0.w : 10.0.w,
      height: isCircle ? 7.0.h : 10.0.h,
      decoration: BoxDecoration(
        color: isCircle ? Colors.green : Colors.white,
        shape: isCircle ? BoxShape.rectangle : BoxShape.circle,
        borderRadius: isCircle ? BorderRadius.circular(10.0) : null,
        border: isCircle ? null : BoxBorder.all(width: 0.2),
      ),
    );
  }
}
