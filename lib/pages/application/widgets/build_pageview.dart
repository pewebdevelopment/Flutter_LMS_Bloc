
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/values/values.dart';
import 'package:ulearning/pages/course/course.dart';
import 'package:ulearning/pages/home/home.dart';
import 'package:ulearning/pages/message/message.dart';
import 'package:ulearning/pages/profile/profile.dart';
import 'package:ulearning/pages/search/search.dart';

Widget buildPageView(PageController pageController) {
  return PageView(
    physics: NeverScrollableScrollPhysics(),
    children: <Widget>[
      Home(),
      Search(),
      Course(),
      Message(),
      Profile(),
    ],
    controller: pageController,
    onPageChanged: (value) {},
  );
}

var bottomTabs = <BottomNavigationBarItem>[
  new BottomNavigationBarItem(
    icon: Container(
        width: 15.w,
        height: 15.w,
        child: Image.asset(
          "assets/icons/home.png",
          color: AppColors.primaryFourElementText,
        )),
    activeIcon: Container(
      width: 15.w,
      height: 15.w,
      child: Image.asset(
        "assets/icons/home.png",
        color: AppColors.primaryElement,
      ),
    ),
    label: "home",
    backgroundColor: AppColors.primaryBackground,
  ),
  new BottomNavigationBarItem(
    icon: Container(
        width: 15.w,
        height: 15.w,
        child: Image.asset(
          "assets/icons/search2.png",
          color: AppColors.primaryFourElementText,
        )),
    activeIcon: Container(
      width: 15.w,
      height: 15.w,
      child: Image.asset(
        "assets/icons/search2.png",
        color: AppColors.primaryElement,
      ),
    ),
    label: "search",
    backgroundColor: AppColors.primaryBackground,
  ),
  new BottomNavigationBarItem(
    icon: Container(
      width: 15.w,
      height: 15.w,
      child: Image.asset(
        "assets/icons/play-circle1.png",
        color: AppColors.primaryFourElementText,
      ),
    ),
    activeIcon: Container(
      width: 15.w,
      height: 15.w,
      child: Image.asset(
        "assets/icons/play-circle1.png",
        color: AppColors.primaryElement,
      ),
    ),
    label: "play",
    backgroundColor: AppColors.primaryBackground,
  ),
  new BottomNavigationBarItem(
    icon: Container(
      width: 15.w,
      height: 15.w,
      child: Image.asset(
        "assets/icons/message-circle.png",
        color: AppColors.primaryFourElementText,
      ),
    ),
    activeIcon: Container(
      width: 15.w,
      height: 15.w,
      child: Image.asset(
        "assets/icons/message-circle.png",
        color: AppColors.primaryElement,
      ),
    ),
    label: "message",
    backgroundColor: AppColors.primaryBackground,
  ),
  new BottomNavigationBarItem(
    icon: Container(
      width: 15.w,
      height: 15.w,
      child: Image.asset(
        "assets/icons/person2.png",
        color: AppColors.primaryFourElementText,
      ),
    ),
    activeIcon: Container(
      width: 15.w,
      height: 15.w,
      child: Image.asset(
        "assets/icons/person2.png",
        color: AppColors.primaryElement,
      ),
    ),
    label: "person",
    backgroundColor: AppColors.primaryBackground,
  ),
];