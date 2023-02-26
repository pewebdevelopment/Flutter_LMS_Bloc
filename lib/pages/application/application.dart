import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/values/colors.dart';
import 'package:ulearning/pages/application/bloc/application_bloc.dart';
import 'package:ulearning/pages/application/widgets/build_pageview.dart';

class Application extends StatefulWidget {
  const Application({super.key});
  @override
  State<Application> createState() => _ApplicationPage();
}

class _ApplicationPage extends State<Application> {
  PageController pageController = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
              body: buildPageView(pageController),
              bottomNavigationBar:
                  BlocBuilder<ApplicationBloc, ApplicationState>(
                      builder: (context, state) {
                return Container(
                  width: 375.w,
                  height: 58.h,
                  decoration: BoxDecoration(
                    color: AppColors.primaryElement,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.h),
                        topRight: Radius.circular(20.h)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: BottomNavigationBar(
                    elevation: 0,
                    items: bottomTabs,
                    currentIndex: state.page,
                    type: BottomNavigationBarType.fixed,
                    onTap: (value) {
                      context.read<ApplicationBloc>().add(PageChanged(value));
                      pageController.jumpToPage(value);
                    },
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    unselectedItemColor: AppColors.primaryFourElementText,
                    selectedItemColor: AppColors.primaryElement,
                  ),
                );
              }))),
    );
  }
}
