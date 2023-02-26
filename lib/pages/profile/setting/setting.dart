import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/entities/entities.dart';
import 'package:ulearning/common/routes/routes.dart';
import 'package:ulearning/common/utils/logger.dart';
import 'package:ulearning/common/values/colors.dart';
import 'package:ulearning/common/values/constant.dart';
import 'package:ulearning/global.dart';
import 'package:ulearning/pages/profile/setting/bloc/setting_bloc.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => Setting());
  }

  @override
  State<Setting> createState() => _SettingPage();
}

class _SettingPage extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingBloc, SettingState>(builder: (context, state) {
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
                child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20.h),
                  child:
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Image(
                        image: AssetImage("assets/icons/person(1).png"),
                        width: 20.w,
                        height: 20.h,
                      ),
                    ),
                    Container(
                      child: Text(
                        "Account",
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                    )
                  ],
                ),
                ),
                _buildListItem("Edit Account"),
                _buildListItem("Change your password"),
                _buildListItem("Security & privacy"),
              ],
            )),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 20.h,
              horizontal: 25.w,
            ),
            sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20.h),
                      child:
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Image(
                              image: AssetImage("assets/icons/bell.png"),
                              width: 20.w,
                              height: 20.h,
                            ),
                          ),
                          Container(
                            child: Text(
                              "Notification",
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    _buildListItem("Notification"),
                    _buildListItem("App notification"),
                  ],
                )),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 20.h,
              horizontal: 25.w,
            ),
            sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20.h),
                      child:
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Image(
                              image: AssetImage("assets/icons/list.png"),
                              width: 20.w,
                              height: 20.h,
                            ),
                          ),
                          Container(
                            child: Text(
                              "More",
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    _buildListItem("Language"),
                    _buildListItem("Country"),
                  ],
                )),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 20.h,
              horizontal: 25.w,
            ),
            sliver: SliverToBoxAdapter(
                child: GestureDetector(child: Container(
                  height: 40.w,
                  width: 120.w,
                  child: Image(
                    image: AssetImage("assets/icons/Logout.png"),
                  ),
                ),onTap: (){
                  Global.storageService.remove(STORAGE_USER_PROFILE_KEY);
                  Global.storageService.remove(STORAGE_USER_TOKEN_KEY);
                  Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.Sign_in, (Route<dynamic> route) => false);
                },),),
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
      child: Container(
        child: Text(
          "Settings",
          style: TextStyle(
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),
        ),
      ),
    ));
  }


  Widget _buildListItem(String title) {
    return Container(
      width: 325.w,
      height: 40.h,
      margin: EdgeInsets.only(
        bottom: 15.h,
      ),
      padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 14.w),
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.all(Radius.circular(15.w)),
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
              Container(
                margin: EdgeInsets.only(left: 0.w),
                child: Text(
                  "${title}",
                  style: TextStyle(
                    color: AppColors.primary_bg,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              // 右侧
              Container(
                alignment: Alignment.centerRight,
                child: Image(
                  image: AssetImage("assets/icons/arrow_right.png"),
                  width: 16.w,
                  height: 16.h,
                ),
              )
            ],
          )),
    );
  }
}
