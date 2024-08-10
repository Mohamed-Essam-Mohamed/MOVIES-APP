import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/src/data/model/response/movie_details_respons_dto.dart';
import 'package:movies_app/src/feature/watchlist/view_model/watch_list_view_model_cubit.dart';
import '../../../../constants/app_api_const.dart';

class ImageItemWidget extends StatefulWidget {
  ImageItemWidget({
    super.key,
    required this.imagePath,
    required this.moviesWatchListDataBase,
  });
  final String imagePath;
  MovieDetailsResponseDto moviesWatchListDataBase;

  @override
  State<ImageItemWidget> createState() => _ImageItemWidgetState();
}

class _ImageItemWidgetState extends State<ImageItemWidget> {
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<WatchListViewModelCubit>(context, listen: true);

    bool isWatchList =
        cubit.moviesDataBase.keys.contains(widget.moviesWatchListDataBase.id!);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: "$imagePrefix${widget.imagePath}",
            placeholder: (context, url) => Center(
              child: Lottie.asset('assets/lottie/loading.json'),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fit: BoxFit.fill,
            width: 129.w,
            height: 199.h,
          ),
          InkWell(
            onTap: () {
              cubit.deleteOrAddWatchList(widget.moviesWatchListDataBase.id!,
                  widget.moviesWatchListDataBase);
            },
            child: SvgPicture.asset(
              //? update this
              isWatchList
                  ? 'assets/svg_icons/bookmark-selected.svg'
                  : 'assets/svg_icons/bookmark.svg',
              width: 26.w,
              height: 36.h,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
