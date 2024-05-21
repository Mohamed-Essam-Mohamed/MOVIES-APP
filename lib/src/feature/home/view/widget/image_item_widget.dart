import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ImageItemWidget extends StatelessWidget {
  const ImageItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
    );
  }
}
