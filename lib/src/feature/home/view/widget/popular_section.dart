import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/src/feature/home/view/widget/image_item_widget.dart';
import 'package:movies_app/src/feature/home/view/widget/title_image_widget.dart';

class PopularSection extends StatelessWidget {
  const PopularSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 335.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          _backGroundImagePopular(),
          _positionedImageItemWidget(),
          _positonedTitleImageWidget()
        ],
      ),
    );
  }

  Positioned _positonedTitleImageWidget() {
    return Positioned(
      top: 240.h,
      left: 170.w,
      child: TitleImageWidget(),
    );
  }

  Positioned _positionedImageItemWidget() {
    return Positioned(
      top: 100.h,
      left: 21.w,
      // ignore: prefer_const_constructors
      child: ImageItemWidget(),
    );
  }

  Image _backGroundImagePopular() {
    return Image.asset(
      'assets/svg_images/background.png',
      fit: BoxFit.fill,
      width: 412.w,
      height: 217.h,
    );
  }
}
