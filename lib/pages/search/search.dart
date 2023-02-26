import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/routes/names.dart';
import 'package:ulearning/common/values/colors.dart';
import 'package:ulearning/pages/search/bloc/search_bloc.dart';
import 'package:ulearning/pages/search/search_logic.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchPage();
}

class _SearchPage extends State<Search> {
  @override
  void initState() {
    super.initState();
    SearchLogic(context: context).init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      return Scaffold(
        appBar: _buildAppBar(),
        backgroundColor: Colors.white,
        body: CustomScrollView(slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 20.h,
              horizontal: 25.w,
            ),
            sliver: SliverToBoxAdapter(child: _searchView(context, state)),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 0.h,
              horizontal: 25.w,
            ),
            sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
              (content, index) {
                return Container(
                  width: 325.w,
                  height: 80.h,
                  margin: EdgeInsets.only(
                    bottom: 20.h,
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
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
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRoutes.CourseDetail,arguments:{"id":state.courseItem.elementAt(index).id});
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    height: 60.h,
                                    width: 60.h,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "${state.courseItem.elementAt(index).thumbnail}"),
                                          fit: BoxFit.fill),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.h)),
                                    )),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 10.w),
                                      child: Text(
                                        "${state.courseItem.elementAt(index).name}",
                                        style: TextStyle(
                                          color: AppColors.primaryText,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10.w),
                                      child: Text(
                                        "${state.courseItem.elementAt(index).lesson_num} Lesson",
                                        style: TextStyle(
                                          color:
                                              AppColors.primaryThreeElementText,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 0.w),
                                      child: Image(
                                        image: AssetImage(
                                            "assets/icons/star2.png"),
                                        width: 62.w,
                                        height: 10.h,
                                      ),
                                    ),
                                  ],
                                )
                              ]),
                          // 右侧
                          Container(
                            alignment: Alignment.centerRight,
                            child: Image(
                              image: AssetImage("assets/icons/arrow_right.png"),
                              width: 24.w,
                              height: 24.h,
                            ),
                          )
                        ],
                      )),
                );
              },
              childCount: state.courseItem.length,
            )),
          ),
        ]),
      );
      ;
    });
  }

  AppBar _buildAppBar() {
    return AppBar(
        title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 18.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          Container(
            child: Text(
              "Search",
              style: TextStyle(
                color: AppColors.primaryText,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
          ),
          Container(
            width: 24.w,
            height: 24.h,
            child: Image.asset("assets/icons/shopping-cart.png"),
          ),
        ],
      ),
    ));
  }

  Widget _searchView(BuildContext context, SearchState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 280.w,
          height: 40.h,
          margin: EdgeInsets.only(bottom: 0.h, top: 0.h),
          padding: EdgeInsets.only(top: 0.h, bottom: 0.h),
          decoration: BoxDecoration(
              color: AppColors.primaryBackground,
              borderRadius: BorderRadius.all(Radius.circular(15.h)),
              border: Border.all(color: AppColors.primaryFourElementText)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10.w),
                padding: EdgeInsets.only(left: 0.w, top: 0.w),
                width: 16.w,
                height: 16.w,
                child: Image.asset("assets/icons/search.png"),
              ),
              Container(
                width: 240.w,
                height: 40.h,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: "User interface",
                    hintStyle: TextStyle(
                      color: AppColors.primaryThreeElementText,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.normal,
                    fontSize: 12.sp,
                  ),
                  textInputAction: TextInputAction.search,
                  onChanged: (value) {

                  },
                  onSubmitted:(value) {
                    if(value.isNotEmpty){
                      SearchLogic(context: context).asyncPostSearchData(value);
                    }
                 },
                  maxLines: 1,
                  autocorrect: false, // 自动纠正
                  obscureText: false, // 隐藏输入内容, 密码框
                ),
              )
            ],
          ),
        ),
        Container(
          width: 40.h,
          height: 40.h,
          padding: EdgeInsets.all(5.w),
          decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.all(Radius.circular(13.w)),
              border: Border.all(color: AppColors.primaryElement)),
          child: Image.asset("assets/icons/options.png"),
        ),
      ],
    );
  }
}
