import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/src/feature/watchlist/view/widget/watch_list_item_widget.dart';
import 'package:movies_app/src/feature/watchlist/view_model/watch_list_view_model_cubit.dart';
import 'package:movies_app/src/utils/app_text_styles.dart';

class WatchListScreen extends StatefulWidget {
  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  @override
  Widget build(BuildContext context) {
    var cubitWatchList = WatchListViewModelCubit.get(context);
    if (cubitWatchList.movieDetailsResponseDto.isEmpty) {
      cubitWatchList.getAllData();
      cubitWatchList.checkListEmpty();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Watch List",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w400,
            height: 26.5 / 22, // line-height / font-size
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gap(10.h),
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
                if (state is WatchListViewModelEmpty) {
                  return Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/svg_images/empty-search.png",
                      height: 150.h,
                      width: 200.w,
                      fit: BoxFit.contain,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  );
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
        // cubitWatchList.movieDetailsResponseDto[index]
        itemBuilder: (context, index) => WatchListItemWidget(
          moviesWatchListDataBase:
              cubitWatchList.movieDetailsResponseDto[index],
        ),
        separatorBuilder: (context, index) =>
            Divider(color: Colors.white.withOpacity(0.2)),
        itemCount: cubitWatchList.movieDetailsResponseDto.length,
      ),
    );
  }
}
