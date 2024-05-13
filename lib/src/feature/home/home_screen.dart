// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/src/feature/home/home_view_model.dart';
import 'package:movies_app/src/feature/home/widget/popular_section.dart';
import 'package:movies_app/src/feature/home/widget/recomended_section.dart';
import 'package:movies_app/src/feature/home/widget/releases_section.dart';
import 'package:movies_app/src/utils/app_colors.dart';

import 'package:movies_app/src/utils/app_text_styles.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "HomeScreen";
  HomeViewModel viewModel = HomeViewModel();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CarouselSlider.builder(
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    pageSnapping: true,
                    padEnds: false,
                    viewportFraction: 1,
                    // scrollPhysics: const NeverScrollableScrollPhysics(),
                    // enlargeFactor: 0.5,
                    clipBehavior: Clip.none,
                    height: 290.h,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 5),
                    scrollDirection: Axis.horizontal,
                  ),
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      PopularSection(),
                ),
                SizedBox(
                  height: 40.h,
                ),
                ReleasesSection(),
                SizedBox(height: 30.h),
                RecomendedSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
