import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/src/feature/watchlist/view/widget/watch_list_item_widget.dart';
import 'package:movies_app/src/feature/watchlist/view_model/watch_list_view_model_cubit.dart';
import 'package:movies_app/src/utils/app_text_styles.dart';

import '../../../constants/app_api_const.dart';

class WatchListScreen extends StatefulWidget {
  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    var cubitWatchList = WatchListViewModelCubit.get(context);
    if (cubitWatchList.movieDetailsResponseDto.isEmpty) {
      cubitWatchList.getAllData();
    }
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(77.49.h),
            _textWatchList(),
            BlocBuilder<WatchListViewModelCubit, WatchListViewModelState>(
              bloc: cubitWatchList,
              builder: (context, state) {
                if (state is WatchListViewModelError) {
                  return Center(
                    child: Text(
                      "Error",
                      style: AppStyles.textStyle20,
                    ),
                  );
                }
                if (state is WatchListViewModelSuccess) {
                  return _listViewSeparatedWidget(cubitWatchList);
                }
                return _loadingWidget();
              },
            )
          ],
        ),
      ),
    );
  }

  Column _loadingWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Lottie.asset(
            "assets/lottie/loading.json",
            reverse: true,
            height: 100.h,
            width: 100.w,
          ),
        ),
      ],
    );
  }

  Expanded _listViewSeparatedWidget(WatchListViewModelCubit cubitWatchList) {
    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => WatchListItemWidget(
          imagePath:
              cubitWatchList.movieDetailsResponseDto[index].posterPath ?? "",
          title: cubitWatchList.movieDetailsResponseDto[index].title ?? "",
          date: cubitWatchList.movieDetailsResponseDto[index].releaseDate ?? "",
          language:
              cubitWatchList.movieDetailsResponseDto[index].originalLanguage ??
                  "en",
          rating:
              cubitWatchList.movieDetailsResponseDto[index].voteAverage ?? "",
          id: cubitWatchList.movieDetailsResponseDto[index].id ?? 0,
        ),
        separatorBuilder: (context, index) =>
            Divider(color: Colors.white.withOpacity(0.2)),
        itemCount: cubitWatchList.movieDetailsResponseDto.length,
      ),
    );
  }

  Text _textWatchList() {
    return const Text(
      "Watch List",
      style: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.w400,
        height: 26.5 / 22, // line-height / font-size
      ),
    );
  }
}
