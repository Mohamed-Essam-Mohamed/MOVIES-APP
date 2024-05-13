import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/src/feature/browse/widget/custom_container.dart';
import 'package:movies_app/src/model/genre_model.dart';
import 'package:movies_app/src/utils/app_text_styles.dart';

class BrowseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List genreList = GenreDM.getGenres();
    return Container(
        padding: EdgeInsets.all(10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 70.sp),
            Text(
              "Browse Genre",
              style:
                  AppStyles.textStyle22.copyWith(fontWeight: FontWeight.normal),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: genreList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20.sp,
                  crossAxisSpacing: 30.sp,
                  childAspectRatio: 1.5,
                ),
                itemBuilder: (context, index) {
                  return CustomContainer(genre: genreList[index], index: index);
                },
              ),
            )
          ],
        ));
  }
}
