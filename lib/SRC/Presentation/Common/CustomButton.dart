// Custom Button
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String buttonTitle;
  final void Function()? onTap;
  final Color? colorSetup;
  final Color? borderColor;
  final Color? textColor;
  final IconData? iconData;
  final double? height;
  final double? width;

  const CustomButton({
    super.key,
    required this.buttonTitle,
    this.onTap,
    this.colorSetup,
    this.borderColor,
    this.textColor,
    this.iconData,
    this.height,
    this.width,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: widget.height ?? 45,
        width: widget.width ?? double.infinity,
        decoration: BoxDecoration(
          color: widget.colorSetup ?? Theme.of(context).colorScheme.primary,
          border: Border.all(
            color: widget.borderColor ?? Colors.transparent,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.iconData == null
                  ? SizedBox()
                  : Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Icon(
                        widget.iconData,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
              Text(
                widget.buttonTitle,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color:
                      widget.textColor ??
                      Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
