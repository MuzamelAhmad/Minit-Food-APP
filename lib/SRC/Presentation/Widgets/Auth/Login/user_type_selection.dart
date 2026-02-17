import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_food_app/SRC/Presentation/Common/CustomButton.dart';
import 'package:mini_food_app/SRC/Presentation/Common/app_images_paths.dart';
import 'package:mini_food_app/SRC/Presentation/Common/app_titles.dart';
import 'package:mini_food_app/SRC/Presentation/Common/custom_app_bar.dart';
import 'package:mini_food_app/SRC/Presentation/Widgets/Auth/Login/Login.dart';

class UserTypeSelection extends StatefulWidget {
  const UserTypeSelection({super.key});

  @override
  State<UserTypeSelection> createState() => _UserTypeSelectionState();
}

class _UserTypeSelectionState extends State<UserTypeSelection> {
  bool customer = false;
  bool kitchenOwner = false;

  void Function()? checkedCustomer() {
    setState(() {
      customer = !customer;
      if (kitchenOwner) {
        kitchenOwner = false;
      }
      print(customer);
    });
    return null;
  }

  void Function()? checkedKitchenOwner() {
    setState(() {
      kitchenOwner = !kitchenOwner;
      if (customer) {
        customer = false;
      }
      print(kitchenOwner);
    });

    return null;
  }

  void Function()? tapToLoginPage() {
    if (kitchenOwner || customer) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Please select a user type')));
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(isNavigationIcon: false),
            SizedBox(height: 30.0.h),
            Text(
              Titles.userTypeTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 10.0.h),
            Text(
              Titles.userTypeTagTitle,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 30.0.h),

            Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: Stack(
                children: [
                  customer ? CheckedContainer() : const SizedBox.shrink(),
                  UserContainer(
                    onTap: checkedCustomer,
                    label: Titles.userTypeLabel,
                    userTypeImage: AssetsImages.customerUserTypeImage,
                  ),
                ],
              ),
            ),

            SizedBox(height: 10.0.h),

            Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: Stack(
                children: [
                  kitchenOwner ? CheckedContainer() : const SizedBox.shrink(),
                  UserContainer(
                    onTap: checkedKitchenOwner,
                    label: Titles.userTypeLabel2,
                    userTypeImage: AssetsImages.kitchenOwnerUserTypeImage,
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.0.h),
            Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: CustomButton(
                buttonTitle: Titles.buttonTitle2,
                colorSetup: kitchenOwner || customer
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.secondary,
                onTap: tapToLoginPage,
              ),
            ),
            SizedBox(height: 10.0.h),
            Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: kitchenOwner || customer
                  ? CustomButton(
                      colorSetup: Theme.of(context).colorScheme.surface,
                      textColor: Theme.of(context).colorScheme.primary,
                      buttonTitle: Titles.buttonTitle3,
                      borderColor: Theme.of(context).colorScheme.primary,
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}

class UserContainer extends StatelessWidget {
  const UserContainer({
    super.key,
    required this.label,
    required this.userTypeImage,
    this.onTap,
  });

  final String label;
  final String userTypeImage;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 150.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0.r)),
          border: BoxBorder.all(
            color: Theme.of(context).colorScheme.primary,
            width: 1.w,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                height: 119.h,
                width: 129.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0.r)),
                  image: DecorationImage(
                    image: AssetImage(userTypeImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontFamily: 'Poppins-Bold',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CheckedContainer extends StatelessWidget {
  const CheckedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Container(
          height: 50.0.h,
          width: 50.0.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(
              context,
            ).colorScheme.primary.withAlpha((255 * 0.5).toInt()),
          ),
          child: Center(
            child: Container(
              height: 40.0.h,
              width: 40.0.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Center(child: Icon(Icons.check)),
            ),
          ),
        ),
      ),
    );
  }
}
