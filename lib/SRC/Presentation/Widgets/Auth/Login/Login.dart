import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_food_app/SRC/Presentation/Common/CustomButton.dart';
import 'package:mini_food_app/SRC/Presentation/Common/app_titles.dart';
import 'package:mini_food_app/SRC/Presentation/Common/text_form_field.dart';
import 'package:mini_food_app/SRC/Presentation/Widgets/Auth/Forget%20Password/forget_password.dart';
import 'package:mini_food_app/SRC/Presentation/Widgets/Auth/SignUp/signup.dart';

import '../../../../Data/repositories/validation/vlidation.dart';
import '../../../Common/custom_app_bar.dart';
import '../../../Common/login_signup.dart';
import '../../location Permissions Pages/location_permission_handler.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> checked = ValueNotifier(true);
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void Function()? onTapTextLabel() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ForgetPassword()),
    );
    return null;
  }

  void Function()? onTapTextSignup() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()));
    return null;
  }

  void Function()? onTapSignInBotton() {
    if (checked.value == true) {
      if (_formKey.currentState!.validate()) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: (Text('Accepted the terms and conditions Box'))),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LocationPermissionHandler()),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: (Text('Please Checked the terms and conditions Box!')),
        ),
      );
    }
    // Navigator.restorablePushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> ), (route) => false,)
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
                leadingText: Titles.appBarTitle2,
              ),
              Form(
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
                            Titles.loginScreenTitle,
                            style: Theme.of(
                              context,
                            ).textTheme.labelMedium?.copyWith(fontSize: 24),
                          ),
                          SizedBox(height: 20.0.h),
                          Text(
                            Titles.loginScreenCaption,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          SizedBox(height: 40.0.h),
                          CustomTextFormField(
                            controller: emailController,
                            validator: Validator.email,
                            labelTitle: Titles.loginScreenTextFieldLabel,
                            prefixIconData: Icons.mail_outline_rounded,
                            hintTitle: Titles.loginScreenTextFieldHint,
                            isObscure: false,
                          ),
                          SizedBox(height: 10.0.h),
                          CustomTextFormField(
                            controller: passwordController,
                            validator: Validator.password,
                            labelTitle:
                                Titles.loginScreenTextFieldPasswordLabel,
                            hintTitle: Titles.loginScreenTextFieldPasswordHint,
                            prefixIconData: Icons.lock_outline,
                            isObscure: true,
                          ),
                          SizedBox(height: 5.0.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(),
                              InkWell(
                                onTap: onTapTextLabel,
                                child: Text(
                                  Titles.loginScreenForgetLabel,
                                  style: Theme.of(context).textTheme.bodySmall
                                      ?.copyWith(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.0.h),
                          ValueListenableBuilder(
                            valueListenable: checked,
                            builder: (context, value, child) {
                              return Row(
                                children: [
                                  Checkbox(
                                    value: value,
                                    onChanged: (_) {
                                      checked.value = !checked.value;
                                    },
                                  ),
                                  RichTextContainer(
                                    label: Titles.loginScreenCheckedBoxTitle,
                                    label2: Titles.loginScreenTermsCondition,
                                  ),
                                ],
                              );
                            },
                          ),
                          SizedBox(height: 20.0.h),
                          ValueListenableBuilder(
                            valueListenable: checked,
                            builder: (context, value, child) {
                              return CustomButton(
                                buttonTitle: Titles.loginScreenTitle,
                                colorSetup: checked.value
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.secondary,
                                onTap: onTapSignInBotton,
                              );
                            },
                          ),
                          SizedBox(height: 30.0.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              DividerContainer(),
                              Text(
                                'or',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              DividerContainer(),
                            ],
                          ),
                          SizedBox(height: 30.0.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ContainerAuth(svgPath: 'assets/icons/fblogo.svg'),
                              ContainerAuth(
                                svgPath: 'assets/icons/googlelogo.svg',
                              ),
                              ContainerAuth(
                                svgPath: 'assets/icons/apple_logo.svg',
                              ),
                            ],
                          ),
                          SizedBox(height: 20.0.h),
                          RichTextContainer(
                            label: Titles.loginScreenLabel,
                            label2: Titles.loginScreenLabelSignup,
                            onTapText: onTapTextSignup,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
