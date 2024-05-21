import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/init_app.dart';
import 'package:movies_app/src/feature/home/home_screen.dart';
import 'package:movies_app/src/feature/home_details/home_details.dart';
import 'package:movies_app/src/utils/app_theme.dart';

void main() {
  runApp(MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 892),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Movies App',
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.dark,
          initialRoute: InitApp.routeName,
          routes: {
            InitApp.routeName: (context) => InitApp(),
            HomeScreen.routeName: (context) => HomeScreen(),
            HomeDetails.routeName: (context) => HomeDetails(),
          },
        );
      },
    );
  }
}
