import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DividerContainer extends StatelessWidget {
  const DividerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0.w,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.secondary,
        ),
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class ContainerAuth extends StatelessWidget {
  final String svgPath;

  const ContainerAuth({super.key, required this.svgPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.0.w,
      height: 40.0.h,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.primary,
        ),
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Center(child: SvgPicture.asset(svgPath)),
    );
  }
}

class RichTextContainer extends StatelessWidget {
  final String label;
  final String label2;
  final void Function()? onTapText;

  const RichTextContainer({
    super.key,
    required this.label,
    required this.label2,
    this.onTapText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280.w,
      child: Center(
        child: RichText(
          maxLines: 2,
          textAlign: TextAlign.start,
          text: TextSpan(
            children: [
              TextSpan(
                text: label,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: label2,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
                recognizer: TapGestureRecognizer()..onTap = onTapText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
