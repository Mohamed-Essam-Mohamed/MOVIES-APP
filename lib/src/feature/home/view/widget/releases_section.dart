import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:movies_app/src/animation_shimmer/list_view_shimmer.dart';
import 'package:movies_app/src/feature/details/view/details_screen.dart';
import 'package:movies_app/src/feature/home/view/widget/popular_section.dart';
import 'package:movies_app/src/feature/watchlist/view_model/watch_list_view_model_cubit.dart';
import 'image_item_widget.dart';
import '../../view_model/releases_view_model/releases_view_model_cubit.dart';
import '../../../../helper/dpi.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text_styles.dart';

class ReleasesSection extends StatelessWidget {
  const ReleasesSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      color: AppColors.darkColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'New Releases',
              style: AppStyles.textStyle18,
            ),
            Gap(10.h),
            const ListViewNewReleasesWidget(),
          ],
        ),
      ),
    );
  }
}

class ListViewNewReleasesWidget extends StatefulWidget {
  const ListViewNewReleasesWidget({
    super.key,
  });

  @override
  State<ListViewNewReleasesWidget> createState() =>
      _ListViewNewReleasesWidgetState();
}

class _ListViewNewReleasesWidgetState extends State<ListViewNewReleasesWidget> {
  final ReleasesViewModelCubit viewModel =
      ReleasesViewModelCubit(releaseRepository: injectReleaseRepository());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReleasesViewModelCubit, ReleasesViewModelState>(
      bloc: viewModel..getReleases(),
      builder: (context, state) {
        if (state is ReleasesViewModelError) {
          return Center(
            child: Text(state.messageErorr ?? "Error"),
          );
        }
        if (state is ReleasesViewModelSuccess) {
          return Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    DetailsScreen.routeName,
                    arguments: IdNavigatorDataClass(
                      id: viewModel.movieReleaseList[index].id,
                      imagePath:
                          viewModel.movieReleaseList[index].posterPath ?? "",
                    ),
                  );
                },
                child: ImageItemWidget(
                  imagePath: viewModel.movieReleaseList[index].posterPath ?? "",
                  moviesWatchListDataBase: MoviesWatchListDataBase(
                    id: viewModel.movieReleaseList[index].id,
                    title: viewModel.movieReleaseList[index].title,
                    posterPath: viewModel.movieReleaseList[index].posterPath,
                    releaseDate: viewModel.movieReleaseList[index].releaseDate,
                    voteAverage: viewModel.movieReleaseList[index].voteAverage,
                  ),
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(width: 15.w),
              itemCount: viewModel.movieReleaseList.length,
            ),
          );
        }
        return const ListViewShimmer();
      },
    );
  }
}
