import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/src/utils/app_colors.dart';
import 'package:movies_app/src/utils/app_text_styles.dart';

class RecomendedSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270.h,
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
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: AppColors.cardDarkColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  width: 125.w,
                  height: 160.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.r),
                          topRight: Radius.circular(10.r),
                        ),
                        child: Stack(
                          children: [
                            Image.asset(
                              'assets/svg_images/poster.png',
                              width: 125.w,
                              height: 150.h,
                              fit: BoxFit.fill,
                            ),
                            SvgPicture.asset(
                              'assets/svg_icons/bookmark.svg',
                              width: 27.w,
                              height: 36.h,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.h),
                        child: Text(
                          'Deadpool',
                          style: AppStyles.textStyle14,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.h),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg_icons/star.svg',
                              width: 18.w,
                              height: 18.h,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              '7.7',
                              style: AppStyles.textStyle14,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: 15,
              separatorBuilder: (context, index) => SizedBox(
                width: 14.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
