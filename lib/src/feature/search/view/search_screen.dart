import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:movies_app/src/feature/search/view/widget/custom_text_form_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

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
        child: Column(
          children: [
            CustomTextFormWidget(
              onSubmittedFunction: (searchQueryTextField) {
                searchQuery = searchQueryTextField;
              },
            ),
          ],
        ),
      ),
    ));
  }
}
