import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/routes/names.dart';
import 'package:ulearning/common/values/colors.dart';
import 'package:ulearning/pages/message/bloc/message_bloc.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => Message());
  }

  @override
  State<Message> createState() => _MessagePage();
}

class _MessagePage extends State<Message> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessageBloc, MessageState>(builder: (context, state) {
      return Scaffold(
        appBar: _buildAppBar(),
        backgroundColor: Colors.white,
        body: CustomScrollView(slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 15.h,
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
                    return _buildListItem();
                  },
                  childCount: 6,
                )
            ),),
          SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 0.w),
              sliver:SliverToBoxAdapter(
                child:Align(alignment: Alignment.center,child: new Text('loading...'),),
              )
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
                  "Message",
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ),
          GestureDetector(
            child:Container(
                width: 24.w,
                height: 24.h,
                child: Image.asset("assets/icons/bell.png"),
              ),
              onTap:(){
        Navigator.of(context).pushNamed(AppRoutes.Unotification);
        },
        )
            ],
          ),
        ));
  }

  Widget _searchView(BuildContext context, state) {
    return  Container(
      width: 325.w,
      height: 40.h,
      margin: EdgeInsets.only(bottom: 0.h, top: 0.h),
      padding: EdgeInsets.only(top: 0.h, bottom: 0.h),
      decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.all(Radius.circular(15.h)),
          border: Border.all(color: AppColors.primaryFourElementText)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                hintText: "Search...",
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
              onChanged: (value) {
                // controller.state.email.value = value;
              },
              maxLines: 1,
              autocorrect: false, // 自动纠正
              obscureText: false, // 隐藏输入内容, 密码框
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.w),
            padding: EdgeInsets.only(left: 0.w, top: 0.w),
            width: 16.w,
            height: 16.w,
            child: Image.asset("assets/icons/mic.png"),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem() {

    return Container(
      width: 325.w,
      height: 80.h,
      margin: EdgeInsets.only(bottom: 0.h,),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 0.w),
      child: InkWell(
          onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.Chat);
          },
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          margin: EdgeInsets.only(left:10.w),
                          child: Text(
                            "Ricardo Bowker",
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left:10.w,top: 10.h),
                          child: Text(
                            "Hello, sir i need a app design",
                            style: TextStyle(
                              color: AppColors.primaryThreeElementText,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],)
                  ]),
              // 右侧
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment:Alignment.center,
                    child: Text(
                      "1 min",
                      style: TextStyle(
                        color: AppColors.primaryThreeElementText,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Container(
                    height: 15.h,
                    constraints: BoxConstraints(minWidth: 15.w),
                    decoration: BoxDecoration(
                        color: AppColors.primaryElement,
                        borderRadius: BorderRadius.all(Radius.circular(6.h)),),
                    alignment:Alignment.center,
                    child: Text(
                      "5",
                      style: TextStyle(
                        color: AppColors.primaryElementText,
                        fontSize: 8.sp,
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

