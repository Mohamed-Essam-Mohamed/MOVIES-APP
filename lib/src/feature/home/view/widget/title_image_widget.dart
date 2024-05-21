import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:movies_app/src/utils/app_text_styles.dart';

class TitleImageWidget extends StatelessWidget {
  const TitleImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Dora and the lost city of gold",
            style: AppStyles.textStyle16,
          ),
          Gap(5.h),
          Text(
            "2019  PG-13  2h 7m",
            style: AppStyles.textStyle14,
          ),
        ],
      ),
    );
  }
}
