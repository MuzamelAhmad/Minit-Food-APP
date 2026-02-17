import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationDesign extends StatelessWidget {
  final int count;

  const NotificationDesign({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [Colors.amberAccent, Colors.green, Colors.red];
    return SliverList.builder(
      itemCount: count,
      itemBuilder: (context, index) => Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(1, 1),
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withAlpha((255 * 0.1).toInt()),
                    blurRadius: 1,
                  ),
                ],
              ),
              padding: EdgeInsets.all(10.0),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 60.0.h,
                    width: 60.0.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colors[index],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.notifications_none,
                        size: 30,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                  Container(
                    // color: Colors.blue,
                    height: 60.0.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Payment Done',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          'Your payment has been done Successfully',
                          style: Theme.of(context).textTheme.bodySmall,
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
    );
  }
}
