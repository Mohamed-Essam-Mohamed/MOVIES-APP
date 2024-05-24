import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/src/feature/home/view/widget/popular_section.dart';
import 'package:movies_app/src/feature/home/view_model/home_view_model_cubit.dart';
import 'package:movies_app/src/helper/dpi.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({
    super.key,
  });

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  final HomeViewModelCubit viewModel =
      HomeViewModelCubit(popularRepository: injectPopularRepository());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModelCubit, HomeViewModelState>(
      bloc: viewModel..getAllPopular(),
      builder: (context, state) {
        if (state is HomeViewModelError) {
          return Center(
            child: Text(state.errorMessage ?? "Error"),
          );
        }
        if (state is HomeViewModelSuccess) {
          return CarouselSlider.builder(
            options: CarouselOptions(
              enlargeCenterPage: true,
              pageSnapping: true,
              padEnds: false,
              viewportFraction: 1,
              clipBehavior: Clip.none,
              height: 290.h,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              scrollDirection: Axis.horizontal,
            ),
            itemCount: viewModel.moviePopularList.length,
            itemBuilder: (BuildContext context, int itemIndex,
                    int pageViewIndex) =>
                PopularSection(result: viewModel.moviePopularList[itemIndex]),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
