import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:movies_app/src/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class PopularShimmer extends StatelessWidget {
  static const String routeName = 'flutter_code_sample';
  const PopularShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.whiteColor.withAlpha(30),
      highlightColor: AppColors.yellowColor,
      enabled: true,
      child: SizedBox(
        width: 412.w,
        height: 335.h,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            _backGroundImagePopular(),
            _positionedImageItemWidget(),
          ],
        ),
      ),
    );
  }

  Container _backGroundImagePopular() {
    return Container(
      color: AppColors.greyDarkColor.withOpacity(0.5),
      width: 412.w,
      height: 217.h,
    );
  }

  Positioned _positionedImageItemWidget() {
    return Positioned(
      top: 100.h,
      left: 21.w,
      child: const ItemImageShimmerWidget(),
    );
  }
}

class ItemImageShimmerWidget extends StatelessWidget {
  const ItemImageShimmerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: Stack(
        children: [
          Container(
            width: 129.w,
            height: 199.h,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}

class BackGroundImageShimmer extends StatelessWidget {
  static const String routeName = 'BackGroundImageShimmer';
  const BackGroundImageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.whiteColor.withAlpha(30),
      highlightColor: AppColors.yellowColor,
      enabled: true,
      child: SizedBox(
        width: 412.w,
        height: MediaQuery.of(context).size.height * 0.56,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: AppColors.greyDarkColor.withOpacity(0.5),
              width: 412.w,
              height: 217.h,
            ),
            Gap(10.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _constainerLongText(),
                  Gap(15.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ItemImageShimmerWidget(),
                      Column(
                        children: [
                          Row(
                            children: [
                              Gap(10.h),
                              _containerText(),
                              Gap(5.w),
                              _containerText(),
                              Gap(5.w),
                              _containerText(),
                            ],
                          ),
                          Gap(10.h),
                          _constainerLongText(),
                          Gap(10.h),
                          _constainerLongText(),
                          Gap(30.h),
                          _constainerLongText(),
                          Gap(10.h),
                          _constainerLongText(),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _constainerLongText() {
    return Container(
      width: 220.w,
      height: 25.h,
      decoration: BoxDecoration(
        color: AppColors.greyDarkColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(5.r),
      ),
    );
  }

  Container _containerText() {
    return Container(
      width: 80.w,
      height: 30.h,
      decoration: BoxDecoration(
        color: AppColors.greyDarkColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8.r),
      ),
    );
  }
}
