import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/src/constants/app_api_const.dart';
import 'package:movies_app/src/utils/app_colors.dart';
import 'package:movies_app/src/utils/app_text_styles.dart';

import '../../../details/view/details_screen.dart';
import '../../../home/view/widget/popular_section.dart';
import '../../view_model/watch_list_view_model_cubit.dart';

class WatchListItemWidget extends StatelessWidget {
  const WatchListItemWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.date,
    required this.rating,
    required this.id,
    required this.language,
  });
  final String imagePath;
  final String language;
  final String title;
  final String date;
  final String rating;

  final int id;

  @override
  Widget build(BuildContext context) {
    var cubit = WatchListViewModelCubit.get(context);
    return InkWell(
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailsScreen.routeName,
          arguments: IdNavigatorDataClass(
            id: id,
            imagePath: imagePath,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8.5),
        color: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _watchListImageWidget(cubit),
            Gap(10.h),
            _watchListDescriptionWidget(),
          ],
        ),
      ),
    );
  }

  Expanded _watchListDescriptionWidget() {
    double updateRating = double.parse(rating);
    String ratingText = updateRating.toStringAsFixed(1);
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(10.h),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w400,
              height: 18.15 / 15, // line-height / font-size
            ),
          ),
          Gap(10.h),
          Row(
            children: [
              Text(
                "Language: ($language)",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.67),
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  height: 15.73 / 13, // line-height / font-size
                ),
              ),
              Gap(7.h),
              Text(
                "Year: ($date)",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.67),
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  height: 15.73 / 13, // line-height / font-size
                ),
              ),
            ],
          ),
          Gap(10.h),
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
              Gap(3.h),
              Text(
                ratingText,
                style: AppStyles.textStyle14,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Stack _watchListImageWidget(WatchListViewModelCubit cubit) {
    return Stack(
      children: [
        SizedBox(
          width: 150,
          height: 95,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: "${imagePrefix}${imagePath}",
              errorWidget: (context, url, error) => const Icon(Icons.error),
              placeholder: (context, url) => Center(
                child: Lottie.asset('assets/lottie/loading.json'),
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: SizedBox(
            width: 27,
            height: 36,
            child: InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                cubit.checkWatchListExist(id)
                    ? 'assets/svg_icons/bookmark-selected.svg'
                    : 'assets/svg_icons/bookmark.svg',
                width: 28.w,
                height: 36.h,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
