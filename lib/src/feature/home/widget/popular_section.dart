import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/src/utils/app_text_styles.dart';

class PopularSection extends StatelessWidget {
  const PopularSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 335.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            'assets/svg_images/background.png',
            fit: BoxFit.fill,
            width: 412.w,
            height: 217.h,
          ),
          Positioned(
            top: 118.h,
            left: 21.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/svg_images/poster.png',
                    fit: BoxFit.fill,
                    width: 129.w,
                    height: 199.h,
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
          ),
          Positioned(
            top: 250.h,
            left: 170.w,
            child: Container(
              width: 350.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Dora and the lost city of gold",
                    style: AppStyles.textStyle14,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "2019  PG-13  2h 7m",
                    style: AppStyles.textStyle10,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
