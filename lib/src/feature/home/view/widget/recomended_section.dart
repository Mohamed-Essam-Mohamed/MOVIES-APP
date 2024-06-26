import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'list_view_recomend_and_like_widget.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text_styles.dart';

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({
    Key? key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 295.h,
      width: double.infinity,
      color: AppColors.darkColor,
      padding: EdgeInsets.all(10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Recommended for you',
            style: AppStyles.textStyle18,
          ),
          Gap(10.h),
          const ListViewRecommendAndLikeWidget(),
        ],
      ),
    );
  }
}
