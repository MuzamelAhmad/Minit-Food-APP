import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_food_app/SRC/Presentation/Widgets/Auth/Login/Login.dart';

import '../../../../Data/repositories/validation/vlidation.dart';
import '../../../Common/CustomButton.dart';
import '../../../Common/app_titles.dart';
import '../../../Common/custom_app_bar.dart';
import '../../../Common/login_signup.dart';
import '../../../Common/text_form_field.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  void Function()? onTapTextSignIn() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
    return null;
  }

  void Function()? onTapSignUpBotton() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: (Text('valid Credentials'))));
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
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomAppBar(
                    isNavigationIcon: true,
                    navigationOnTap: () => Navigator.pop(context),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.0.w,
                      vertical: 20.0.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          Titles.signupScreenTitle,
                          style: Theme.of(
                            context,
                          ).textTheme.labelMedium?.copyWith(fontSize: 24),
                        ),

                        SizedBox(height: 40.0.h),
                        CustomTextFormField(
                          controller: _nameController,
                          validator: Validator.name,
                          labelTitle: Titles.signupScreenInputNameLabel,
                          prefixIconData: Icons.person_2_outlined,
                          hintTitle: Titles.signupScreenInputNameHint,
                          isObscure: false,
                        ),
                        SizedBox(height: 10.0.h),
                        CustomTextFormField(
                          controller: _emailController,
                          validator: Validator.email,
                          labelTitle: Titles.loginScreenTextFieldLabel,
                          prefixIconData: Icons.mail_outline_rounded,
                          hintTitle: Titles.loginScreenTextFieldHint,
                          isObscure: false,
                        ),
                        SizedBox(height: 10.0.h),
                        CustomTextFormField(
                          controller: _passwordController,
                          validator: Validator.password,
                          labelTitle: Titles.loginScreenTextFieldPasswordLabel,
                          prefixIconData: Icons.lock_outline,
                          hintTitle: Titles.loginScreenTextFieldPasswordHint,
                          isObscure: true,
                        ),
                        SizedBox(height: 10.0.h),
                        CustomTextFormField(
                          controller: _confirmPasswordController,
                          validator: Validator.confirmPassword(
                            _passwordController.text,
                          ),
                          labelTitle: Titles.signupScreenInputPasswordLabel,
                          hintTitle: Titles.loginScreenTextFieldPasswordHint,
                          prefixIconData: Icons.lock_outline,
                          isObscure: true,
                        ),
                        SizedBox(height: 20.0.h),
                        CustomButton(
                          onTap: onTapSignUpBotton,
                          buttonTitle: Titles.loginScreenLabelSignup,
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
                          label2: Titles.loginScreenTitle,
                          onTapText: onTapTextSignIn,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
