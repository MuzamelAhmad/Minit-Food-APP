import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Data/repositories/data of models/food_model_data.dart';

class FavoriteIconDesign extends StatelessWidget {
  final int index;
  const FavoriteIconDesign({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      width: 35.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: foodModelData[index].isFavorite.value
            ? Theme.of(
                context,
              ).colorScheme.primary.withAlpha((255 * 0.5).toInt())
            : Theme.of(context).colorScheme.surface,
      ),
      child: Center(
        child: ValueListenableBuilder(
          valueListenable: foodModelData[index].isFavorite,
          builder: (context, value, child) {
            return InkWell(
              onTap: () {
                foodModelData[index].isFavorite.value =
                    !foodModelData[index].isFavorite.value;
              },
              child: Icon(
                Icons.favorite,
                color: foodModelData[index].isFavorite.value
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.secondary,
              ),
            );
          },
        ),
      ),
    );
  }
}
