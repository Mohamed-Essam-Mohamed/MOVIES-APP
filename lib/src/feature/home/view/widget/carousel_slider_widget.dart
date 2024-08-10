import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/src/animation_shimmer/popular_shimmer.dart';
import 'package:movies_app/src/utils/app_text_styles.dart';
import 'popular_section.dart';
import '../../view_model/populer_view_model/populer_view_model_cubit.dart';
import '../../../../helper/dpi.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({
    super.key,
  });

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  final PopularViewModelCubit viewModel =
      PopularViewModelCubit(popularRepository: injectPopularRepository());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularViewModelCubit, PopularViewModelState>(
      bloc: viewModel..getAllPopular(),
      builder: (context, state) {
        if (state is PopularViewModelError) {
          return _textError(state);
        }
        if (state is PopularViewModelSuccess) {
          return _carouselSliderBuilder();
        }
        return const Center(
          child: PopularShimmer(),
        );
      },
    );
  }

  Center _textError(PopularViewModelError state) {
    return Center(
      child: Text(
        state.errorMessage ?? "Error",
        style: AppStyles.textStyle20,
      ),
    );
  }

  CarouselSlider _carouselSliderBuilder() {
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
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          PopularSection(result: viewModel.moviePopularList[itemIndex]),
    );
  }
}
