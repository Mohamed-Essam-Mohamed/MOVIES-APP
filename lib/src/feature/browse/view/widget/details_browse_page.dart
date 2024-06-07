// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/src/feature/browse/view_model/browse_view_model_cubit.dart';
import 'package:movies_app/src/feature/watchlist/view/widget/watch_list_item_widget.dart';
import 'package:movies_app/src/helper/dpi.dart';
import 'package:movies_app/src/utils/app_text_styles.dart';

class DetailsBrowsePage extends StatelessWidget {
  DetailsBrowsePage({super.key, required this.title, required this.id});
  final String title;
  final int id;
  BrowseViewModelCubit viewModel = BrowseViewModelCubit(
    browseRepository: injectBrowseRepository(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: AppStyles.textStyle20,
        ),
      ),
      body: BlocBuilder<BrowseViewModelCubit, BrowseViewModelState>(
        bloc: viewModel..getBrowsItems(genreId: id),
        builder: (context, state) {
          if (state is BrowseViewModelError) {
            return Center(
              child: Text(state.messageError),
            );
          }
          if (state is BrowseViewModelSuccess) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: ListView.separated(
                itemBuilder: (context, index) => WatchListItemWidget(
                  imagePath: viewModel.moviesListClear?[index].posterPath ?? "",
                  title: viewModel.moviesListClear?[index].title ?? "",
                  date: viewModel.moviesListClear?[index].releaseDate ?? "",
                  rating: viewModel.moviesListClear?[index].voteAverage ?? "",
                  language:
                      viewModel.moviesListClear![index].originalLanguage ?? "",
                  id: viewModel.moviesListClear?[index].id ?? 0,
                ),
                separatorBuilder: (context, index) =>
                    Divider(color: Colors.white.withOpacity(0.2)),
                itemCount: viewModel.moviesListClear?.length ?? 0,
              ),
            );
          }
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.70,
            child: Column(
              children: [
                const Spacer(),
                Center(
                  child: Lottie.asset(
                    'assets/lottie/loading.json',
                    height: 200.h,
                    width: 200.w,
                  ),
                ),
                const Spacer(),
              ],
            ),
          );
          ;
        },
      ),
    );
  }
}
