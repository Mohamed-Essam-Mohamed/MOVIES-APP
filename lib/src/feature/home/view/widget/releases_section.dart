import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:movies_app/src/feature/home/view/widget/image_item_widget.dart';
import 'package:movies_app/src/utils/app_colors.dart';
import 'package:movies_app/src/utils/app_text_styles.dart';

class ReleasesSection extends StatelessWidget {
  const ReleasesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      color: AppColors.darkColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'New Releases',
              style: AppStyles.textStyle18,
            ),
            Gap(10.h),
            ListViewNewRelaeasesWidget(),
          ],
        ),
      ),
    );
  }
}

class ListViewNewRelaeasesWidget extends StatelessWidget {
  const ListViewNewRelaeasesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => ImageItemWidget(),
        separatorBuilder: (context, index) => SizedBox(width: 15.w),
        itemCount: 11,
      ),
    );
  }
}
