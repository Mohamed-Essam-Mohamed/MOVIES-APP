import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'src/feature/browse/view/browse_screen.dart';
import 'src/feature/home/view/home_screen.dart';
import 'src/feature/search/view/search_screen.dart';
import 'src/feature/watchlist/view/watchlist_screen.dart';
import 'src/utils/app_colors.dart';

class InitApp extends StatefulWidget {
  static const String routeName = 'InitApp';

  @override
  State<InitApp> createState() => _InitAppState();
}

class _InitAppState extends State<InitApp> {
  List<Widget> widgetList = [
    const HomeScreen(),
    SearchScreen(),
    BrowseScreen(),
    WatchListScreen()
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        unselectedFontSize: 13.sp,
        selectedFontSize: 13.sp,
        selectedItemColor: AppColors.yellowColor,
        enableFeedback: true,
        showSelectedLabels: true,
        useLegacyColorScheme: true,
        elevation: 0,
        currentIndex: index,
        onTap: (selectedIndex) {
          index = selectedIndex;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg_icons/Home-icon.svg',
              height: 23.h,
              width: 23.w,
              color: index == 0 ? AppColors.yellowColor : Colors.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg_icons/search-2.svg',
              height: 23.h,
              width: 23.w,
              color: index == 1 ? AppColors.yellowColor : Colors.grey,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg_icons/Icon-material-movie.svg',
              height: 23.h,
              width: 23.w,
              color: index == 2 ? AppColors.yellowColor : Colors.grey,
            ),
            label: 'Browse',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg_icons/Icon-ionic-md-bookmarks.svg',
              height: 23.h,
              width: 23.w,
              color: index == 3 ? AppColors.yellowColor : Colors.grey,
            ),
            label: 'WatchList',
          ),
        ],
      ),
      body: widgetList[index],
    );
  }
}
