import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:movies_app/src/feature/details/view/widget/detials_movies_widget.dart';
import 'package:movies_app/src/feature/details/view/widget/similar_movies_widget.dart';

import 'package:movies_app/src/feature/home/view/widget/popular_section.dart';

import '../../../utils/app_text_styles.dart';

class DetailsScreen extends StatelessWidget {
  static const routeName = 'HomeDetails';
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var arguments =
        ModalRoute.of(context)!.settings.arguments as IdNavigatorDataClass;

    return Scaffold(
      appBar: _appBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DetailsMoviesWidget(
              idMovie: arguments.id!,
              imagePath: arguments.imagePath,
            ),
            Gap(15.h),
            SimilarMoviesWidget(idMovies: arguments.id!),
          ],
        ),
      ),
    );
  }

  AppBar _appBarWidget() {
    return AppBar(
      centerTitle: true,
      title: Text(
        'Details Movies',
        style: AppStyles.textStyle20,
      ),
    );
  }
}
