import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import '../../../../constants/app_api_const.dart';

class ImageItemWidget extends StatelessWidget {
  const ImageItemWidget({
    super.key,
    required this.imagePath,
  });
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: "$imagePrefix${imagePath}",
            placeholder: (context, url) => Center(
              child: Lottie.asset('assets/lottie/loading.json'),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
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
    );
  }
}
