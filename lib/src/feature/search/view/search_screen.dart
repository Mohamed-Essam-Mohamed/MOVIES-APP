import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/src/feature/search/view_model/search_view_model_cubit.dart';
import 'package:movies_app/src/feature/watchlist/view/watchlist_screen.dart';
import 'package:movies_app/src/feature/watchlist/view/widget/watch_list_item_widget.dart';
import 'package:movies_app/src/helper/dpi.dart';
import 'widget/custom_text_form_widget.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchViewModelCubit viewModel =
      SearchViewModelCubit(searchRepository: injectSearchRepository());

  @override
  Widget build(BuildContext context) {
    String searchQuery = "";

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 40.h,
            left: 16.h,
            right: 16.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextFormWidget(
                  onSubmittedFunction: (searchQueryTextField) {
                    searchQuery = searchQueryTextField;
                    viewModel.getSearchMovies(
                      query: searchQuery,
                    );
                  },
                ),
                BlocBuilder<SearchViewModelCubit, SearchViewModelState>(
                  bloc: viewModel,
                  builder: (context, state) {
                    if (state is SearchViewModelSuccess) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.76,
                        width: double.infinity,
                        child: ListView.separated(
                          itemCount: viewModel.moviesListClear?.length ?? 0,
                          itemBuilder: (context, index) => WatchListItemWidget(
                            imagePath:
                                viewModel.moviesListClear![index].posterPath ??
                                    "",
                            title:
                                viewModel.moviesListClear![index].title ?? "",
                            date:
                                viewModel.moviesListClear![index].releaseDate ??
                                    "",
                            language: viewModel
                                    .moviesListClear![index].originalLanguage ??
                                "en",
                            rating:
                                viewModel.moviesListClear![index].voteAverage ??
                                    "",
                            id: viewModel.moviesListClear![index].id ?? 0,
                          ),
                          separatorBuilder: (context, index) =>
                              Divider(color: Colors.white.withOpacity(0.2)),
                        ),
                      );
                    } else if (state is SearchViewModelFailure) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.76,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/svg_images/empty-search.png",
                            ),
                            Gap(10.h),
                            Text(
                              state.errorMessage,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      );
                    } else if (state is SearchViewModelEmpty) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.76,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/svg_images/empty-search.png",
                            ),
                            Gap(10.h),
                            const Text(
                              "No results found",
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    } else if (state is SearchViewModelLoading) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.76,
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
                    } else {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.76,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/svg_images/empty-search.png",
                            ),
                            Gap(10.h),
                            const Text(
                              "Please enter the name of the movie",
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
