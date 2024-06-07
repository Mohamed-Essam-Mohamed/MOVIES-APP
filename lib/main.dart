import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movies_app/src/animation_shimmer/popular_shimmer.dart';
import 'package:movies_app/src/constants/hive_const.dart';
import 'package:movies_app/src/data/model/response/movie_details_respons_dto.dart';
import 'package:movies_app/src/feature/watchlist/view_model/watch_list_view_model_cubit.dart';
import 'init_app.dart';

import 'src/feature/home/view/home_screen.dart';
import 'src/feature/details/view/details_screen.dart';
import 'src/utils/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MovieDetailsResponseDtoAdapter());
  await Hive.openBox<MovieDetailsResponseDto>(HiveConst.moviesWatchList);
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 892),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocProvider<WatchListViewModelCubit>(
          create: (context) => WatchListViewModelCubit(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Movies App',
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.dark,
            initialRoute: InitApp.routeName,
            routes: {
              InitApp.routeName: (context) => InitApp(),
              HomeScreen.routeName: (context) => HomeScreen(),
              DetailsScreen.routeName: (context) => DetailsScreen(),
              PopularShimmer.routeName: (context) => const PopularShimmer(),
            },
          ),
        );
      },
    );
  }
}
