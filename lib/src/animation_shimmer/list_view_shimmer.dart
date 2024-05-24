import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:movies_app/src/animation_shimmer/popular_shimmer.dart';
import 'package:movies_app/src/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ListViewShimmer extends StatelessWidget {
  const ListViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.whiteColor.withAlpha(30),
      highlightColor: AppColors.yellowColor,
      child: SizedBox(
        width: 129.w,
        height: 180.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => const ItemImageShimmerWidget(),
          separatorBuilder: (context, index) => Gap(15.w),
          itemCount: 15,
        ),
      ),
    );
  }
}














/**
 ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ImageItemWidget(
                imagePath: viewModel.movieReleaseList[index].posterPath ?? "",
              ),
              separatorBuilder: (context, index) => SizedBox(width: 15.w),
              itemCount: viewModel.movieReleaseList.length,
            ),
 */

