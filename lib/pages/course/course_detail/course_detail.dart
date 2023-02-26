import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/routes/names.dart';
import 'package:ulearning/common/values/colors.dart';
import 'package:ulearning/pages/course/course_detail/bloc/course_detail_bloc.dart';
import 'package:ulearning/pages/course/course_detail/course_detail_logic.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({super.key});

  @override
  State<CourseDetail> createState() => _CourseDetailPage();
}

class _CourseDetailPage extends State<CourseDetail> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final args = ModalRoute.of(context)!.settings.arguments as Map;
      print(args["id"]);
      CourseDetailLogic(context: context).asyncPostAllData(args["id"]);
    });
  }


  @override
  Widget build(BuildContext context) {

    return BlocBuilder<CourseDetailBloc, CourseDetailState>(
        builder: (context, state) {
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
                height: 200.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("${state.courseItem!=null?state.courseItem!.thumbnail:""}"),
                    fit: BoxFit.fitWidth,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20.h)),
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
            padding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 25.w,
            ),
            sliver: SliverToBoxAdapter(
                child: Container(
              margin: EdgeInsets.only(top: 27.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "Course Description",
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
                      state.courseItem!=null?"${state.courseItem!.description}":"Not Some Description",
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
            padding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 25.w,
            ),
            sliver: SliverToBoxAdapter(
                child: Container(
              margin: EdgeInsets.only(top: 20.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "The Course Includes",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 0.h),
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: 16.w),
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Image(
                                    image: AssetImage(
                                        "assets/icons/video_detail.png"),
                                    width: 30.w,
                                    height: 30.h,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10.w),
                                  child: Text(
                                    state.courseItem!=null?"${state.courseItem!.video_len} Hours Video":"0 Hours Video",
                                    style: TextStyle(
                                      color:
                                          AppColors.primarySecondaryElementText,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11.sp,
                                    ),
                                  ),
                                )
                              ],
                            )),
                        Container(
                            margin: EdgeInsets.only(top: 16.w),
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Image(
                                    image: AssetImage(
                                        "assets/icons/file_detail.png"),
                                    width: 30.w,
                                    height: 30.h,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10.w),
                                  child: Text(
                                    state.courseItem!=null?"Total ${state.courseItem!.lesson_num} Lessons":"Total 0 Lessons",
                                    style: TextStyle(
                                      color:
                                          AppColors.primarySecondaryElementText,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11.sp,
                                    ),
                                  ),
                                )
                              ],
                            )),
                        Container(
                          margin: EdgeInsets.only(top: 16.w),
                          child: Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Image(
                                  image: AssetImage(
                                      "assets/icons/download_detail.png"),
                                  width: 30.w,
                                  height: 30.h,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10.w),
                                child: Text(
                                  state.courseItem!=null?"${state.courseItem!.down_num} Download Resources":"0 Download Resources",
                                  style: TextStyle(
                                    color:
                                        AppColors.primarySecondaryElementText,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11.sp,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              top: 25.h,
              left: 25.w,
              right: 25.w,
            ),
            sliver: SliverToBoxAdapter(
              child: Container(
                child: Text(
                  "Student Study",
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
            padding: EdgeInsets.only(
              top: 15.h,
              bottom: 25.h,
              left: 25.w,
              right: 25.w,
            ),
            sliver: SliverToBoxAdapter(
              child: Container(
                height: 50.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    if (index == 4) {
                      return Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50.w)),
                        ),
                        child: Image.asset("assets/icons/05.png"),
                      );
                    }
                    return Container(
                      width: 50.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50.w)),
                      ),
                      child: Image.asset("assets/icons/01.png"),
                    );
                  },
                ),
              ),
            ),
          ),
        ]),
      );
      ;
    });
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Container(
        child: Text(
          "Courses Detail",
          style: TextStyle(
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }

  Widget _menuView(BuildContext context,CourseDetailState state) {
    return Container(
        width: 325.w,
        margin: EdgeInsets.only(
          top: 0.h,
          bottom: 5.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(right: 30.w),
                padding: EdgeInsets.only(
                    left: 15.w, right: 15.w, top: 5.h, bottom: 5.h),
                decoration: BoxDecoration(
                    color: AppColors.primaryElement,
                    borderRadius: BorderRadius.all(Radius.circular(7.w)),
                    border: Border.all(color: AppColors.primaryElement)),
                child: Text(
                  "BESTSELLER",
                  style: TextStyle(
                    color: AppColors.primaryElementText,
                    fontWeight: FontWeight.normal,
                    fontSize: 10.sp,
                  ),
                ),
              ),
              onTap: () {
                if(state.courseItem!=null){
                  Navigator.of(context).pushNamed(AppRoutes.Contibitor,arguments: {"user_token":state.courseItem!.user_token});
                }
              },
            ),
            Container(
              margin: EdgeInsets.only(right: 30.w),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Image(
                      image: AssetImage("assets/icons/people.png"),
                      width: 20.w,
                      height: 20.h,
                    ),
                  ),
                  Container(
                    child: Text(
                      state.courseItem!=null?"${state.courseItem!.follow}":"0",
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
              margin: EdgeInsets.only(right: 30.w),
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
                      state.courseItem!=null?"${state.courseItem!.score}":"0",
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

  Widget _buildListItem() {
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
                            "20/25 Lesson",
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
                      "\$700",
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
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
