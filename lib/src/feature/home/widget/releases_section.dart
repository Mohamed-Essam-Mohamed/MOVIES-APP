import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/svg_images/poster.png',
                        fit: BoxFit.fill,
                        width: 125.w,
                        height: 190.h,
                      ),
                      SvgPicture.asset(
                        'assets/svg_icons/bookmark.svg',
                        width: 27.w,
                        height: 36.h,
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(width: 15.w),
                itemCount: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
