import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../data/model/dataclass/genre_model.dart';
import '../../../../utils/app_text_styles.dart';

class BrowseItemWidget extends StatelessWidget {
  GenreDM genre;
  int index;
  BrowseItemWidget({required this.genre, required this.index});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 160.w,
      height: 90.h,
      decoration: BoxDecoration(
        image: const DecorationImage(
          alignment: Alignment.center,
          image: AssetImage("assets/svg_images/category_image.png"),
          filterQuality: FilterQuality.high,
          fit: BoxFit.fill,
          opacity: 0.70,
        ),
        borderRadius: BorderRadius.circular(4.sp),
      ),
      child: Center(
        child: Text(
          genre.genreTitle,
          style: AppStyles.textStyle14.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
