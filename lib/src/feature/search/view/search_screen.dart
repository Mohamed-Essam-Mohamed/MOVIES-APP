import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/src/feature/search/view_model/search_view_model_cubit.dart';
import 'package:movies_app/src/feature/watchlist/view/widget/watch_list_item_widget.dart';
import 'package:movies_app/src/helper/dpi.dart';
import 'package:movies_app/src/utils/app_colors.dart';
import 'package:movies_app/src/utils/app_text_styles.dart';
import 'widget/custom_text_form_widget.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchViewModelCubit viewModel =
      SearchViewModelCubit(searchRepository: injectSearchRepository());
  late ScrollController controller;
  String searchQuery = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = ScrollController();
    controller.addListener(() {
      if (controller.position.atEdge) {
        if (controller.position.pixels != 0) {
          viewModel.nextPage(query: searchQuery);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                      page: viewModel.page,
                    );
                  },
                ),
                Gap(10.h),
                BlocBuilder<SearchViewModelCubit, SearchViewModelState>(
                  bloc: viewModel,
                  builder: (context, state) {
                    if (state is SearchViewModelSuccess) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.76,
                        width: double.infinity,
                        child: _listViewSeparatedSearch(),
                      );
                    } else if (state is SearchViewModelFailure) {
                      return _failureWidget(context, state);
                    } else if (state is SearchViewModelEmpty) {
                      return _noResultsFound(context);
                    } else if (state is SearchViewModelLoading) {
                      return _loadingWidget(context);
                    } else {
                      return _elseState(context);
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

  ListView _listViewSeparatedSearch() {
    return ListView.separated(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      itemCount: viewModel.moviesListClear?.length ?? 0,
      itemBuilder: (context, index) => WatchListItemWidget(
        moviesWatchListDataBase: viewModel.moviesListClear![index],
      ),
      separatorBuilder: (context, index) =>
          Divider(color: Colors.white.withOpacity(0.2)),
    );
  }

  SizedBox _elseState(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/lottie/search.json',
            height: 200.h,
            width: 200.w,
          ),
          Text(
            "Please Enter The Name Of The Movie",
            textAlign: TextAlign.center,
            style: AppStyles.textStyle18.copyWith(
              color: AppColors.yellowColor,
            ),
          )
        ],
      ),
    );
  }

  SizedBox _loadingWidget(BuildContext context) {
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
  }

  SizedBox _noResultsFound(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/lottie/empty.json',
            height: 200.h,
            width: 200.w,
          ),
          Gap(10.h),
          Text(
            "No Results Found",
            textAlign: TextAlign.center,
            style: AppStyles.textStyle18.copyWith(
              color: AppColors.yellowColor,
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _failureWidget(BuildContext context, SearchViewModelFailure state) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.76,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/lottie/error.json',
            height: 200.h,
            width: 200.w,
          ),
          Text(
            state.errorMessage,
            textAlign: TextAlign.center,
            style: AppStyles.textStyle18.copyWith(
              color: AppColors.redColor,
            ),
          )
        ],
      ),
    );
  }
}
