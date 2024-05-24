import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text_styles.dart';

class CustomTextFormWidget extends StatelessWidget {
  final Function(String) onSubmittedFunction;

  const CustomTextFormWidget({
    super.key,
    required this.onSubmittedFunction,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) {
        onSubmittedFunction(value);
      },
      cursorColor: AppColors.yellowColor,
      style: const TextStyle(color: AppColors.whiteColor),
      decoration: InputDecoration(
        hintText: "Search",
        hintStyle: AppStyles.textStyle14.copyWith(
          color: AppColors.whiteColor.withOpacity(0.5),
        ),
        prefixIcon: const Icon(
          Icons.search,
          color: AppColors.whiteColor,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
        filled: true,
        fillColor: AppColors.greyDarkColor.withOpacity(0.5),
        border: _outLineInputBorder(color: AppColors.whiteColor),
        enabledBorder: _outLineInputBorder(color: AppColors.whiteColor),
        focusedBorder: _outLineInputBorder(color: AppColors.yellowColor),
      ),
    );
  }

  OutlineInputBorder _outLineInputBorder({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.r),
      borderSide: BorderSide(
        color: color,
        width: 1,
      ),
    );
  }
}
