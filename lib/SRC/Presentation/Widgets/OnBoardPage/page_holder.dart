import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_food_app/SRC/Presentation/Common/app_titles.dart';
import 'package:mini_food_app/SRC/Presentation/Widgets/Auth/Login/user_type_selection.dart';

import '../../Common/CustomButton.dart';
import 'on_board_page.dart';

class PageHolder extends StatefulWidget {
  const PageHolder({super.key});

  @override
  State<PageHolder> createState() => _PageHolderState();
}

class _PageHolderState extends State<PageHolder> {
  final PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      if (pageController.page != null) {
        setState(() {
          currentPage = pageController.page!.round();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          child: PageView(
            controller: pageController,
            children: const [
              OnBoardPage(inputValue: 0),
              OnBoardPage(inputValue: 1),
              OnBoardPage(inputValue: 2),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 110.h,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
                width: 100.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PositionContainer(isCircle: currentPage == 0),
                    PositionContainer(isCircle: currentPage == 1),
                    PositionContainer(isCircle: currentPage == 2),
                  ],
                ),
              ),
              CustomButton(
                buttonTitle: Titles.buttonTitle,
                onTap: () {
                  if (pageController.page!.round() == 0) {
                    pageController.nextPage(
                      duration: Duration(seconds: 2),
                      curve: Curves.ease,
                    );
                  } else if (pageController.page!.round() == 1) {
                    setState(() {
                      pageController.nextPage(
                        duration: Duration(seconds: 2),
                        curve: Curves.ease,
                      );
                    });
                  } else if (pageController.page!.round() == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserTypeSelection(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
