import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:movies_app/src/feature/home/view/widget/carousel_slider_widget.dart';
import 'package:movies_app/src/feature/home/view/widget/recomended_section.dart';
import 'package:movies_app/src/feature/home/view/widget/releases_section.dart';
import 'package:movies_app/src/feature/home/view_model/home_view_model_cubit.dart';
import 'package:movies_app/src/helper/dpi.dart';

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
              RecomendedSection(),
            ],
          ),
        ),
      ),
    );
  }
}
