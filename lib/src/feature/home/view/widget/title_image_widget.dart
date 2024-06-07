import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text_styles.dart';

class TitleImageWidget extends StatelessWidget {
  const TitleImageWidget({
    super.key,
    required this.data,
    required this.rating,
    required this.title,
    required this.language,
    required this.ratingCount,
  });
  final String? title, data;
  final String rating;
  final String language;
  final int ratingCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title ?? '',
            style: AppStyles.textStyle16,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          Gap(5.h),
          Row(
            children: [
              Text(
                "Language ($language)",
                style: AppStyles.textStyle14,
              ),
              Gap(20.w),
              Text(
                "Year ($data)",
                style: AppStyles.textStyle14,
              ),
            ],
          ),
          Gap(5.h),
          Row(
            children: [
              Text(
                "Rating",
                style: AppStyles.textStyle14,
              ),
              Gap(5.w),
              Icon(
                Icons.star,
                color: AppColors.yellowColor,
                size: 20.h,
              ),
              Gap(5.h),
              Text(
                rating.toString(),
                style: AppStyles.textStyle14,
              ),
              Gap(6.w),
              Text(
                "($ratingCount)",
                style: AppStyles.textStyle14,
              ),
            ],
          )
        ],
      ),
    );
  }
}
