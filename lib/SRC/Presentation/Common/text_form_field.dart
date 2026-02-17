import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintTitle;
  final String? Function(String?)? validator;
  final String? labelTitle;
  final bool isObscure;
  final IconData? prefixIconData;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final double? radius;

  const CustomTextFormField({
    super.key,
    required this.hintTitle,
    required this.isObscure,
    this.validator,
    this.labelTitle,
    this.prefixIconData,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: labelTitle == null
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      mainAxisAlignment: labelTitle == null
          ? MainAxisAlignment.center
          : MainAxisAlignment.start,
      children: [
        labelTitle == null
            ? const SizedBox.shrink()
            : Text(labelTitle!, style: Theme.of(context).textTheme.bodyMedium),
        SizedBox(height: 5.h),
        SizedBox(
          height: 60.h,
          child: TextFormField(
            focusNode: focusNode,
            onChanged: onChanged,
            controller: controller,
            validator: validator,
            obscureText: isObscure,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius ?? 15.0.r),
                borderSide: BorderSide(),
              ),
              prefixIcon: Icon(prefixIconData),
              hint: Text(hintTitle),
              hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
