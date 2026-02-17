import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_food_app/SRC/Presentation/Common/CustomButton.dart';
import 'package:mini_food_app/SRC/Presentation/Common/otp_bottom_navigation.dart';
import 'package:mini_food_app/SRC/Presentation/Widgets/Auth/Reset%20Password/reset_password.dart';

import '../../../Common/app_titles.dart';
import '../../../Common/custom_app_bar.dart';
import 'otp_form_field.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  ValueNotifier<int> count = ValueNotifier(59);

  // Add controllers for OTP fields
  final List<TextEditingController> _otpControllers = List.generate(
    4,
    (index) => TextEditingController(),
  );

  final List<FocusNode> _otpFocusNodes = List.generate(
    4,
    (index) => FocusNode(),
  );

  @override
  void initState() {
    super.initState();
    startTimer();

    // Add listeners to OTP controllers for auto-focus
    for (int i = 0; i < _otpControllers.length; i++) {
      _otpControllers[i].addListener(() {
        if (_otpControllers[i].text.length == 1 &&
            i < _otpControllers.length - 1) {
          FocusScope.of(context).requestFocus(_otpFocusNodes[i + 1]);
        }
      });
    }
  }

  @override
  void dispose() {
    // Dispose all controllers and focus nodes
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var focusNode in _otpFocusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void Function()? onTapOtp() {
    // Get the complete OTP
    String otp = _otpControllers.map((controller) => controller.text).join();

    // Validate OTP (basic validation - check if all fields are filled)
    bool isValidOtp = otp.length == 4 && otp.contains(RegExp(r'^[0-9]+$'));

    if (isValidOtp) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResetPassword()),
      );
    } else {
      // Show error if OTP is not complete
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a valid 4-digit OTP'),
          backgroundColor: Colors.red,
        ),
      );
    }
    return null;
  }

  void startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (count.value == 0) {
        timer.cancel();
      } else {
        count.value--;
      }
    });
  }

  // Function to handle backspace and focus movement
  void _handleBackspace(int index, String value) {
    if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(_otpFocusNodes[index - 1]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(isNavigationIcon: true),
              SizedBox(height: 40.0.h),
              Text(
                Titles.otpScreenTitle,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(height: 20.0.h),
              SizedBox(
                height: 50.0.h,
                child: Text(
                  textAlign: TextAlign.center,
                  Titles.otpScreenSubTitle,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              SizedBox(height: 40.0.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  4,
                  (index) => SizedBox(
                    height: 60.0.h,
                    width: 60.0.w,
                    child: Padding(
                      padding: EdgeInsets.all(2.0),
                      child: OTPTextField(
                        controller:
                            _otpControllers[index], // Use individual controllers
                        focusNode: _otpFocusNodes[index], // Add focus node
                        onChanged: (value) =>
                            _handleBackspace(index, value), // Handle backspace
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0.h),
              SizedBox(
                height: 20.0.h,
                child: Text(
                  textAlign: TextAlign.center,
                  Titles.otpScreenResendOtp,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              SizedBox(height: 20.0.h),
              ValueListenableBuilder(
                valueListenable: count,
                builder: (context, value, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        count.value.toString(),
                        style: Theme.of(context).textTheme.labelMedium
                            ?.copyWith(
                              color: count.value == 0
                                  ? Theme.of(context).colorScheme.onSurface
                                  : Theme.of(context).colorScheme.primary,
                            ),
                      ),
                      SizedBox(width: 5.0.w),
                      InkWell(
                        onTap: () {
                          if (count.value == 0) {
                            count.value = 59;
                            startTimer();
                          }
                        },
                        child: Text(
                          textAlign: TextAlign.center,
                          Titles.otpScreenResend,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: count.value != 0
                                    ? Theme.of(context).colorScheme.onSurface
                                    : Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 30.0.h),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  onTap: onTapOtp,
                  buttonTitle: Titles.otpScreenButtonLabel,
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
