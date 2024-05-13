import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/src/utils/app_colors.dart';
import 'package:movies_app/src/utils/app_text_styles.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = 'search screen';

  TextEditingController? controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(10.h),
        child: TextFormField(
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            filled: true,
            fillColor: AppColors.darkColor,
            hintText: 'Search',
            hintStyle:
                AppStyles.textStyle18.copyWith(fontWeight: FontWeight.w300),
            prefixIcon: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/svg_icons/search-2.svg',
                height: 30.h,
                width: 30.w,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide: BorderSide(color: AppColors.whiteColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide: BorderSide(color: AppColors.whiteColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }
}
