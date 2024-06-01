import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../../../constants/app_api_const.dart';

class WatchlistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(77.49.h),
            const Text(
              "Watch List",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w400,
                height: 26.5 / 22, // line-height / font-size
              ),
            ),
            Gap(42.5.h),
            // WatchListItemWidget(),
            Divider(color: Colors.white.withOpacity(0.2)),
          ],
        ),
      ),
    );
  }
}

class WatchListItemWidget extends StatelessWidget {
  const WatchListItemWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.date,
    required this.description,
  });
  final String imagePath;
  final String title;
  final String date;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.5),
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _watchListImageWidget(),
          Gap(10.h),
          _watchListDescriptionWidget(),
        ],
      ),
    );
  }

  Expanded _watchListDescriptionWidget() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w400,
              height: 18.15 / 15, // line-height / font-size
            ),
          ),
          Gap(5.h),
          Text(
            date,
            style: TextStyle(
              color: Colors.white.withOpacity(0.67),
              fontSize: 13,
              fontWeight: FontWeight.w400,
              height: 15.73 / 13, // line-height / font-size
            ),
          ),
          Gap(5.h),
          Text(
            description,
            style: TextStyle(
              color: Colors.white.withOpacity(0.67),
              fontSize: 13,
              fontWeight: FontWeight.w400,
              height: 15.73 / 13, // line-height / font-size
            ),
          ),
        ],
      ),
    );
  }

  Stack _watchListImageWidget() {
    return Stack(
      children: [
        SizedBox(
          width: 140,
          height: 89,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: "${imagePrefix}${imagePath ?? ""}",
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
            child: SvgPicture.asset(
              "assets/svg_icons/bookmark.svg",
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
