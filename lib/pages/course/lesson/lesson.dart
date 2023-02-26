import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/routes/names.dart';
import 'package:ulearning/common/values/colors.dart';
import 'package:ulearning/pages/course/lesson/bloc/lesson_bloc.dart';

class Lesson extends StatefulWidget {
  const Lesson({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => Lesson());
  }

  @override
  State<Lesson> createState() => _LessonPage();
}

class _LessonPage extends State<Lesson> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonBloc, LessonState>(builder: (context, state) {
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
                child: Column(
                  children: [
                    Container(
                      width: 325.w,
                      height: 200.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icons/Video.png'),
                          fit: BoxFit.fitWidth,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20.h)),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top:15.h),
                        child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 24.w,
                          height: 24.h,
                          child: Image.asset("assets/icons/rewind-left.png"),
                        ),
                        Container(
                          width: 24.w,
                          height: 24.h,
                          child: Image.asset("assets/icons/pause.png"),
                        ),
                        Container(
                          width: 24.w,
                          height: 24.h,
                          child: Image.asset("assets/icons/rewind-right.png"),
                        ),
                      ],
                    )),
                    Container(
                      margin: EdgeInsets.only(top:12.h),
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            "1:01",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: AppColors.primarySecondaryElementText,
                              fontWeight: FontWeight.normal,
                              fontSize: 13.sp,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            " | ",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: AppColors.primarySecondaryElementText,
                              fontWeight: FontWeight.normal,
                              fontSize: 13.sp,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            "7:23",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: AppColors.primarySecondaryElementText,
                              fontWeight: FontWeight.normal,
                              fontSize: 13.sp,
                            ),
                          ),
                        ),
                      ],
                    ),)
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
            sliver: SliverToBoxAdapter(child: _menuView(context, state)),
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
                  "All Video",
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
          "Lessons",
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
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Image(
                      image: AssetImage("assets/icons/heart.png"),
                      width: 16.w,
                      height: 16.h,
                    ),
                  ),
                  Container(
                    child: Text(
                      "20 Love",
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
                      image: AssetImage("assets/icons/message.png"),
                      width: 16.w,
                      height: 16.h,
                    ),
                  ),
                  Container(
                    child: Text(
                      "06 Comments",
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
                      "13 Download",
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
        ));
  }

  Widget _buildListItem(BuildContext context) {
    return Container(
      width: 325.w,
      height: 80.h,
      margin: EdgeInsets.only(
        bottom: 20.h,
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
            offset: Offset(0, 1), // changes position of shadow
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
                            "Visual Identity",
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
                            "Is the way that designer create... ",
                            style: TextStyle(
                              color: AppColors.primaryThreeElementText,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    )
                  ]),
              // 右侧
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "6:21",
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
