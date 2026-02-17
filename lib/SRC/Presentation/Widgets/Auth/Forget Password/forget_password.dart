import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_food_app/SRC/Presentation/Common/CustomButton.dart';
import 'package:mini_food_app/SRC/Presentation/Common/text_form_field.dart';
import 'package:mini_food_app/SRC/Presentation/Widgets/Auth/OTP/otp_screen.dart';

import '../../../../Data/repositories/validation/vlidation.dart';
import '../../../Common/app_titles.dart';
import '../../../Common/custom_app_bar.dart';
import '../../../Common/otp_bottom_navigation.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _GlobalKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  void Function()? onTapSendCodeBotton() {
    if (_GlobalKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OtpScreen()),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: (Text('Invalid Credentials'))));
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                isNavigationIcon: true,
                navigationOnTap: () => Navigator.pop(context),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0.w,
                  vertical: 20.0.h,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 40.0.h),
                    Text(
                      Titles.forgetPasswordTitle,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    SizedBox(height: 10.0.h),
                    SizedBox(
                      height: 50.0.h,
                      child: Text(
                        textAlign: TextAlign.center,
                        Titles.forgetPasswordSubTitle,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    SizedBox(height: 50.0.h),
                    Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: _GlobalKey,
                      child: CustomTextFormField(
                        controller: emailController,
                        validator: Validator.email,
                        prefixIconData: Icons.email_outlined,
                        labelTitle: Titles.forgetPasswordInputLabel,
                        hintTitle: Titles.loginScreenTextFieldHint,
                        isObscure: false,
                      ),
                    ),
                    SizedBox(height: 30.0.h),
                    CustomButton(
                      buttonTitle: Titles.forgetPasswordButtonLabel,
                      onTap: onTapSendCodeBotton,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: OtpBottomNavigation(),
    );
  }
}
