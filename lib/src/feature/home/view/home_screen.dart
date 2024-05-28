import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'widget/carousel_slider_widget.dart';
import 'widget/recomended_section.dart';
import 'widget/releases_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CarouselSliderWidget(),
              Gap(40.h),
              const ReleasesSection(),
              Gap(30.h),
              RecommendedSection(),
            ],
          ),
        ),
      ),
    );
  }
}
