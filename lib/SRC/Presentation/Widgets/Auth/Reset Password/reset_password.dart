import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_food_app/SRC/Presentation/Widgets/Auth/Login/Login.dart';

import '../../../../Data/repositories/validation/vlidation.dart';
import '../../../Common/CustomButton.dart';
import '../../../Common/app_titles.dart';
import '../../../Common/custom_app_bar.dart';
import '../../../Common/otp_bottom_navigation.dart';
import '../../../Common/text_form_field.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void Function()? onTapOtp() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Dialog(
            child: SizedBox(
              height: 400.0.h,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 10.0.w,
                  right: 10.0.w,
                  top: 20.0.h,
                  bottom: 20.0.h,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 90.0.h,
                      width: 90.0.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2.h,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        shape: BoxShape.circle,
                        color: Theme.of(
                          context,
                        ).colorScheme.primary.withAlpha((255 * 0.5).toInt()),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.check,
                          color: Theme.of(context).colorScheme.primary,
                          size: 40.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 250.0.w,
                      child: Text(
                        textAlign: TextAlign.center,
                        Titles.resetPasswordDialogTitle,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: CustomButton(
                        buttonTitle: Titles.resetPasswordDialogBottonTitle,
                        onTap: () => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                          (dynamic route) => false,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: (Text('Invalid Credentials'))));
    }
    // Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()));
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
              SizedBox(
                width: double.infinity,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.0.w,
                          vertical: 20.0.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              Titles.resetPasswordTitle,
                              style: Theme.of(
                                context,
                              ).textTheme.labelMedium?.copyWith(fontSize: 24),
                            ),
                            SizedBox(height: 20.0.h),
                            Text(
                              Titles.resetPasswordSubTitle,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            SizedBox(height: 10.0.h),
                            CustomTextFormField(
                              controller: _passwordController,
                              validator: Validator.password,
                              labelTitle:
                                  Titles.loginScreenTextFieldPasswordLabel,
                              prefixIconData: Icons.lock_outline,
                              hintTitle:
                                  Titles.loginScreenTextFieldPasswordHint,
                              isObscure: true,
                            ),
                            SizedBox(height: 10.0.h),
                            CustomTextFormField(
                              controller: _confirmPasswordController,
                              validator: Validator.confirmPassword(
                                _passwordController.text,
                              ),
                              labelTitle: Titles.signupScreenInputPasswordLabel,
                              hintTitle:
                                  Titles.loginScreenTextFieldPasswordHint,
                              prefixIconData: Icons.lock_outline,
                              isObscure: true,
                            ),
                            SizedBox(height: 20.0.h),
                            CustomButton(
                              onTap: onTapOtp,
                              buttonTitle: Titles.resetPasswordButtonTitle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
