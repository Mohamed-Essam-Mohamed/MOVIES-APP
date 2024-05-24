import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:movies_app/src/feature/home/view/widget/list_view_recomend_and_like_widget.dart';
import 'package:movies_app/src/utils/app_colors.dart';
import 'package:movies_app/src/utils/app_text_styles.dart';

class RecomendedSection extends StatelessWidget {
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
            'New Releases',
            style: AppStyles.textStyle18,
          ),
          Gap(10.h),
          const ListViewRecomendAndLikeWidget(),
        ],
      ),
    );
  }
}
