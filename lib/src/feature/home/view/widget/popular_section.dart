import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/src/constants/app_api_const.dart';
import 'package:movies_app/src/data/model/response/movie_details_respons_dto.dart';
import 'package:movies_app/src/feature/home/view/widget/image_item_widget.dart';
import 'package:movies_app/src/feature/home/view/widget/title_image_widget.dart';

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
          _positionedImageItemWidget(),
          _positionedTitleImageWidget()
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

  Positioned _positionedImageItemWidget() {
    return Positioned(
      top: 100.h,
      left: 21.w,
      child: ImageItemWidget(imagePath: result.posterPath ?? ''),
    );
  }

  CachedNetworkImage _backGroundImagePopular() {
    return CachedNetworkImage(
      imageUrl: "$imagePrefix${result.backdropPath}",
      errorWidget: (context, url, error) => const Icon(Icons.error),
      fit: BoxFit.fill,
      width: 412.w,
      height: 217.h,
    );
  }
}
