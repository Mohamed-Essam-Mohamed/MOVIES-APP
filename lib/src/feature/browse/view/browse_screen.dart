import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:movies_app/src/feature/browse/view/widget/details_browse_page.dart';
import 'widget/browes_item_widget.dart';
import '../../../data/model/dataclass/genre_model.dart';
import '../../../utils/app_text_styles.dart';

class BrowseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List genreList = GenreDM.getGenres();
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(top: 40.h, left: 16.w, right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Browse Genre",
              style:
                  AppStyles.textStyle22.copyWith(fontWeight: FontWeight.normal),
            ),
            Gap(20.h),
            Expanded(
              child: GridView.builder(
                itemCount: genreList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20.h,
                  crossAxisSpacing: 30.w,
                  childAspectRatio: 1.4,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailsBrowsePage(
                            title: genreList[index].genreTitle,
                            id: genreList[index].id,
                          ),
                        ),
                      );
                    },
                    child:
                        BrowseItemWidget(genre: genreList[index], index: index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
