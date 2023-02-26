import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/values/colors.dart';
import 'package:ulearning/pages/profile/account/bloc/account_bloc.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => Account());
  }

  @override
  State<Account> createState() => _AccountPage();
}

class _AccountPage extends State<Account> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(builder: (context, state) {
      return Scaffold(
        appBar: _buildAppBar(),
        backgroundColor: Colors.white,
        body: CustomScrollView(slivers: [
          SliverPadding(
            padding: EdgeInsets.only(
              top: 10.h,
              left: 25.w,
              right: 25.w,
            ),
            sliver: SliverToBoxAdapter(
              child: Container(
                child: Text(
                  "History",
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
          "My Account",
          style: TextStyle(
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }


  Widget _buildListItem(BuildContext context) {
    return Container(
      width: 325.w,
      height: 80.h,
      margin: EdgeInsets.only(
        bottom: 20.h,
      ),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
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
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10.w),
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
                          margin: EdgeInsets.only(left: 10.w),
                          child: Text(
                            "Ternsfer",
                            style: TextStyle(
                              color: AppColors.primaryThreeElementText,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    )
                  ]),
              // 右侧
              Container(
                alignment: Alignment.center,
                child: Text(
                  "-700.00",
                  style: TextStyle(
                    color: AppColors.primaryElement,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              )
            ],
          )),
    );
  }
}