import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
