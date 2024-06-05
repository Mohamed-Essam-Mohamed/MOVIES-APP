import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/src/feature/details/view/details_screen.dart';

import '../../../../constants/app_api_const.dart';
import '../../../../data/model/response/movie_details_respons_dto.dart';
import '../../../watchlist/view_model/watch_list_view_model_cubit.dart';
import 'image_item_widget.dart';
import 'title_image_widget.dart';

class PopularSection extends StatelessWidget {
  const PopularSection({super.key, required this.result});
  final MovieDetailsResponseDto result;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 335.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          _backGroundImagePopular(),
          _positionedImageItemWidget(context),
          _positionedTitleImageWidget(),
        ],
      ),
    );
  }

  Positioned _positionedTitleImageWidget() {
    return Positioned(
      top: 220.h,
      left: 170.w,
      child: TitleImageWidget(
        data: result.releaseDate ?? '',
        rating: double.parse(result.voteAverage ?? '0.0').toInt(),
        title: result.title ?? '',
      ),
    );
  }

  Positioned _positionedImageItemWidget(BuildContext context) {
    return Positioned(
      top: 100.h,
      left: 21.w,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            DetailsScreen.routeName,
            arguments: IdNavigatorDataClass(
              id: result.id,
              imagePath: result.posterPath ?? '',
            ),
          );
        },
        child: ImageItemWidget(
          imagePath: result.posterPath ?? '',
          moviesWatchListDataBase: MoviesWatchListDataBase(
            id: result.id,
            title: result.title,
            posterPath: result.posterPath,
            releaseDate: result.releaseDate,
            voteAverage: result.voteAverage,
          ),
        ),
      ),
    );
  }

  CachedNetworkImage _backGroundImagePopular() {
    return CachedNetworkImage(
      imageUrl: "$imagePrefix${result.backdropPath}",
      errorWidget: (context, url, error) => const Icon(Icons.error),
      placeholder: (context, url) => Center(
        child: Lottie.asset('assets/lottie/loading.json'),
      ),
      fit: BoxFit.fill,
      width: double.infinity,
      height: 217.h,
    );
  }
}

// data class argument
class IdNavigatorDataClass {
  final int? id;
  final String imagePath;

  IdNavigatorDataClass({required this.id, required this.imagePath});
}
