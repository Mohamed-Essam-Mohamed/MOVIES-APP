import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/src/feature/home/view/widget/recomended_section.dart';
import 'package:movies_app/src/utils/app_text_styles.dart';

class HomeDetails extends StatelessWidget {
  static const routeName = 'HomeDetails';
  const HomeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Dora and the lost city of gold',
          style: AppStyles.textStyle20,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/svg_images/background.png',
              width: double.infinity,
              height: 230.h,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Text(
                'Dora and the lost city of gold',
                style: AppStyles.textStyle20,
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Row(
                children: [
                  ClipRRect(
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
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            RecomendedSection(),
          ],
        ),
      ),
    );
  }
}
