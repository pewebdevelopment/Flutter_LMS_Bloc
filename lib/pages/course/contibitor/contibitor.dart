import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/values/colors.dart';
import 'package:ulearning/pages/course/contibitor/bloc/contibitor_bloc.dart';

class Contibitor extends StatefulWidget {
  const Contibitor({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => Contibitor());
  }

  @override
  State<Contibitor> createState() => _ContibitorPage();
}

class _ContibitorPage extends State<Contibitor> {
  PageController pageController = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContibitorBloc, ContibitorState>(builder: (context, state) {
      return Scaffold(
        appBar: _buildAppBar(),
        backgroundColor: Colors.white,
        body: CustomScrollView(slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 20.h,
              horizontal: 25.w,
            ),
            sliver: SliverToBoxAdapter(
              child: Container(
                width: 325.w,
                height: 220.h,
                child: Stack(
                  children: [
                    Container(
                      width: 325.w,
                      height: 140.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icons/background.png'),
                          fit: BoxFit.fitWidth,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20.h)),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        child: _menuView(context, state)
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 25.w,
            ),
            sliver: SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(top: 0.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "About Me",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 11.h),
                        child: Text(
                          "I'm professional web design & mobile app designer. I have been working through the past 4 years experience. We offer expert services UI/UX Design, Web Design, App Design, Dashboard Design, Landing Page, Branding, Identity, and other top-notch graphic designs. Believe in my work I will always make you happy with my best. I am happy to be able to keep you happy.",
                          textAlign: TextAlign.start,
                          strutStyle: StrutStyle(height: 1),
                          style: TextStyle(
                            color: AppColors.primaryThreeElementText,
                            fontWeight: FontWeight.normal,
                            fontSize: 11.sp,
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              top: 28.h,
              left: 25.w,
              right: 25.w,
            ),
            sliver: SliverToBoxAdapter(
              child: Container(
                child: Text(
                  "My Courese List",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 18.h,
              horizontal: 25.w,
            ),
            sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                      (content, index) {
                    return _buildListItem(content);
                  },
                  childCount: 6,
                )),
          ),
          SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 0.w),
              sliver: SliverToBoxAdapter(
                child: Align(
                  alignment: Alignment.center,
                  child: new Text('loading...'),
                ),
              )),
        ]),
      );
      ;
    });
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Container(
        child: Text(
          "Contibitor",
          style: TextStyle(
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }

  Widget _menuView(BuildContext context, state) {
    return Container(
        width: 325.w,
        margin: EdgeInsets.only(
          top: 0.h,
          bottom: 0.h,
          left: 20.w,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Container(
            width: 80.w,
            height: 80.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/headpic.png')
              ),
              borderRadius: BorderRadius.all(Radius.circular(20.w)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 0.h),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 50.h),
              Container(
                margin: EdgeInsets.only(left: 6.w),
                child: Text(
                  "Robert Nicklas",
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 6.w,bottom: 10.h,top: 5.h),
                child: Text(
                  "UI/UX Designer",
                  style: TextStyle(
                    color: AppColors.primarySecondaryElementText,
                    fontSize: 9.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 20.w),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Image(
                            image: AssetImage("assets/icons/people.png"),
                            width: 16.w,
                            height: 16.h,
                          ),
                        ),
                        Container(
                          child: Text(
                            "5.7k",
                            style: TextStyle(
                              color: AppColors.primaryThreeElementText,
                              fontWeight: FontWeight.normal,
                              fontSize: 11.sp,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20.w),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Image(
                            image: AssetImage("assets/icons/star.png"),
                            width: 16.w,
                            height: 16.h,
                          ),
                        ),
                        Container(
                          child: Text(
                            "4.9",
                            style: TextStyle(
                              color: AppColors.primaryThreeElementText,
                              fontWeight: FontWeight.normal,
                              fontSize: 11.sp,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Image(
                            image: AssetImage("assets/icons/download.png"),
                            width: 16.w,
                            height: 16.h,
                          ),
                        ),
                        Container(
                          child: Text(
                            "213",
                            style: TextStyle(
                              color: AppColors.primaryThreeElementText,
                              fontWeight: FontWeight.normal,
                              fontSize: 11.sp,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          )
            ,)
        ],));
  }

  Widget _buildListItem(BuildContext context) {
    return Container(
      width: 325.w,
      height: 80.h,
      margin: EdgeInsets.only(
        bottom: 15.h,
      ),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.all(Radius.circular(10.w)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: InkWell(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 60.h,
                      child: Image(
                        image: AssetImage("assets/icons/image(5).png"),
                        width: 60.w,
                        height: 60.h,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 6.w),
                          child: Text(
                            "What is User Interface Design?",
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 6.w),
                          child: Text(
                            "27 min",
                            style: TextStyle(
                              color: AppColors.primaryThreeElementText,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 6.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Image(
                                  image: AssetImage("assets/icons/star(1).png"),
                                  width: 10.w,
                                  height: 10.h,
                                ),
                              ),
                              Container(
                                child: Text(
                                  "4.9",
                                  style: TextStyle(
                                    color: AppColors.primaryThreeElementText,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 9.sp,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ]),
            ],
          )),
    );
  }
}