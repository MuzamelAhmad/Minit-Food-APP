import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_food_app/SRC/Presentation/Common/app_images_paths.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.isNavigationIcon,
    this.title,
    this.leadingText,
    this.leadIcon,
    this.onTap,
    this.leadOnTap,
    this.naviColor,
    this.leadColor,
    this.Size,
    this.navigationOnTap,
    this.iconNavigation,
    this.widgetTitle,
    this.widgetLead,
  });

  final bool isNavigationIcon;
  final String? title;
  final Color? naviColor;
  final Color? leadColor;
  final double? Size;
  final String? leadingText;
  final IconData? leadIcon;
  final IconData? iconNavigation;
  final Widget? widgetTitle;
  final Widget? widgetLead;
  final void Function()? onTap;
  final void Function()? leadOnTap;
  final void Function()? navigationOnTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SizedBox(
        height: 60.0.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isNavigationIcon
                ? InkWell(
                    onTap: navigationOnTap,
                    child: Container(
                      height: 40.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.surface,
                        border: BoxBorder.all(
                          width: 2.w,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          iconNavigation ?? Icons.arrow_back_ios_new_rounded,
                          color:
                              naviColor ??
                              Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),
                  )
                : SizedBox(width: 24.h, height: 24.w),
            title == null && widgetTitle == null
                ? SizedBox(
                    width: 120.w,
                    child: Image.asset(AssetsImages.appLBarLogoImage),
                  )
                : widgetTitle != null
                ? widgetTitle!
                : Text(title!, style: Theme.of(context).textTheme.bodyMedium),

            leadIcon != null
                ? InkWell(
                    onTap: leadOnTap,
                    child: Icon(
                      leadIcon,
                      size: Size ?? 24,
                      color:
                          leadColor ?? Theme.of(context).colorScheme.onSurface,
                    ),
                  )
                : leadingText != null
                ? InkWell(
                    onTap: onTap,
                    child: SizedBox(
                      child: Text(
                        leadingText!,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  )
                : widgetLead != null
                ? widgetLead!
                : SizedBox(width: 24.h, height: 24.w),
          ],
        ),
      ),
    );
  }
}
