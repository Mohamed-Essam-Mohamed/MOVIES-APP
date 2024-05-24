import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(
        0xff1D1E1D,
      ),
      foregroundColor: AppColors.whiteColor,
    ),
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: "Poppins",
  );
}
