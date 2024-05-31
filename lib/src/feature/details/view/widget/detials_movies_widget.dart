import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/src/data/model/response/movie_details_respons_dto.dart';
import 'package:movies_app/src/feature/details/view_modle/details_view_model/details_view_model_cubit.dart';
import 'package:movies_app/src/feature/home/view/widget/image_item_widget.dart';
import 'package:movies_app/src/helper/dpi.dart';
import 'package:movies_app/src/utils/app_colors.dart';
import 'package:movies_app/src/utils/app_text_styles.dart';
import 'package:readmore/readmore.dart';

import '../../../../constants/app_api_const.dart';

class DetailsMoviesWidget extends StatefulWidget {
  const DetailsMoviesWidget(
      {required this.idMovie, required this.imagePath, super.key});
  final int idMovie;
  final String imagePath;

  @override
  State<DetailsMoviesWidget> createState() => _DetailsMoviesWidgetState();
}

class _DetailsMoviesWidgetState extends State<DetailsMoviesWidget> {
  DetailsViewModelCubit viewModel =
      DetailsViewModelCubit(detailsRepository: injectDetailsRepository());
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsViewModelCubit, DetailsViewModelState>(
      bloc: viewModel..getDetailsMovies(movieId: widget.idMovie),
      builder: (context, state) {
        if (state is DetailsViewModelError) {
          return Center(
            child: Icon(
              Icons.error,
              size: 100.sp,
            ),
          );
        }
        if (state is DetailsViewModelSuccess) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _backGroundImageWidget(
                  state.movieDetailsResponseDto.backdropPath ?? "",
                ),
                _titleWidget(
                  state.movieDetailsResponseDto.belongsToCollection?.name ?? "",
                ),
                _detailsMoviesWidget(state, widget.imagePath),
              ],
            ),
          );
        }
        return Center(
          child: Lottie.asset('assets/lottie/loading.json',
              width: 100, height: 100),
        );
      },
    );
  }

  Padding _detailsMoviesWidget(
      DetailsViewModelSuccess state, String imagePath) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
      child: Row(
        children: [
          ImageItemWidget(
            imagePath:
                state.movieDetailsResponseDto.belongsToCollection?.posterPath ??
                    imagePath,
          ),
          Gap(10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Wrap(
                  spacing: 10.w,
                  runSpacing: 10.h,
                  alignment: WrapAlignment.start,
                  runAlignment: WrapAlignment.start,
                  direction: Axis.horizontal,
                  children: state.movieDetailsResponseDto.genres
                          ?.map((e) => _typeMovieWidget(e))
                          .toList() ??
                      [],
                ),
                Gap(5.h),
                ReadMoreText(
                  state.movieDetailsResponseDto.overview ?? "",
                  trimMode: TrimMode.Line,
                  trimLines: 4,
                  colorClickableText: Colors.pink,
                  style: AppStyles.textStyle16,
                  textAlign: TextAlign.start,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  moreStyle: AppStyles.textStyle18.copyWith(
                    color: AppColors.yellowColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _typeMovieWidget(Genres e) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 6.sp,
        vertical: 3.sp,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.sp),
        border: Border.all(
          color: AppColors.whiteColor,
          width: 1,
        ),
      ),
      child: Text(
        e.name ?? "",
        style: AppStyles.textStyle16,
      ),
    );
  }

  Padding _titleWidget(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: Text(
        title,
        style: AppStyles.textStyle20,
        textAlign: TextAlign.start,
      ),
    );
  }

  CachedNetworkImage _backGroundImageWidget(String backGroundImagePopular) {
    return CachedNetworkImage(
      imageUrl: "$imagePrefix${backGroundImagePopular}",
      errorWidget: (context, url, error) =>
          Image.asset('assets/svg_images/background.png'),
      placeholder: (context, url) =>
          Center(child: Lottie.asset('assets/lottie/loading.json')),
      width: double.infinity,
      height: 230.h,
      fit: BoxFit.fill,
    );
  }
}
