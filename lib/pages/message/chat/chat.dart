import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/routes/names.dart';
import 'package:ulearning/common/utils/utils.dart';
import 'package:ulearning/common/values/colors.dart';
import 'package:ulearning/pages/message/chat/bloc/chat_bloc.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});


  @override
  State<Chat> createState() => _ChatPage();
}

class _ChatPage extends State<Chat> {
  final myinputController = TextEditingController();
  @override
  initState(){
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          return Scaffold(
            appBar: _buildAppBar(context,state),
            backgroundColor: Colors.white,
            body: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 70.h),
                    child: CustomScrollView(slivers: [
                    SliverPadding(
                      padding: EdgeInsets.symmetric(
                        vertical: 0.w,
                        horizontal: 25.w,
                      ),
                      sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                                (content, index) {

                              if(index%2==1){
                                return ChatRightItem();
                              }
                              return ChatLeftItem();
                            },
                            childCount: 10,
                          )
                      ),
                    ),
                  ]),),
                  Positioned(
                    bottom: 0.h,
                    child: Container(
                      width: 360.w,
                      constraints: BoxConstraints(
                          maxHeight: 170.h,
                          minHeight: 70.h
                      ),
                      padding: EdgeInsets.only(
                          left: 20.w, right: 20.w, bottom: 10.h, top: 10.h),
                      color: AppColors.primaryBackground,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              width: 270.w,
                              constraints: BoxConstraints(
                                  maxHeight: 170.h,
                                  minHeight: 50.h
                              ),
                              padding: EdgeInsets.only(top:5.h,bottom: 5.h),
                              decoration: BoxDecoration(
                                color: AppColors.primaryBackground,
                                border: Border.all(
                                    color: AppColors
                                        .primaryFourElementText),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(15)),
                              ),
                              child: Row(children: [
                                GestureDetector(
                                  child: Container(
                                    width: 40.w,
                                    height: 40.h,
                                    child: Image.asset(
                                        "assets/icons/05.png"),
                                  ), onTap: () {
                                  // controller.sendMessage();
                                },),
                                Container(
                                  width: 190.w,
                                  constraints: BoxConstraints(
                                      maxHeight: 150.h,
                                      minHeight: 30.h
                                  ),
                                  child: TextField(
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    controller: myinputController,
                                    autofocus: false,
                                    decoration: InputDecoration(
                                      hintText: "Message...",
                                      isDense: true,
                                      contentPadding: EdgeInsets.only(
                                          left: 10.w, top: 0, bottom: 0),
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
                                      hintStyle: TextStyle(
                                        fontSize: 12.sp,
                                        color: AppColors
                                            .primarySecondaryElementText,
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  child: Container(
                                    width: 30.w,
                                    height: 30.h,
                                    alignment: Alignment.centerRight,
                                    child: Image.asset(
                                        "assets/icons/icon(3).png"),
                                  ), onTap: () {
                                  // controller.sendMessage();
                                },)
                              ])),
                          GestureDetector(
                              child: Container(
                                  height: 40.h,
                                  width: 40.w,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryElement,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                        offset: Offset(1,
                                            1), // changes position of shadow
                                      ),
                                    ],
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(40.w)),
                                  ),
                                  child: Image.asset(
                                      "assets/icons/send2.png")), onTap: () {
                           // controller.goMore();
                          }),
                        ],
                      ),
                    ),
                  ),
                ]),)
          );
        });
  }

  AppBar _buildAppBar(BuildContext context,state) {
    return AppBar(
        bottom: PreferredSize(
            child: Container(
              color: AppColors.primarySecondaryBackground,
              height: 1.0,
            ),
            preferredSize: Size.fromHeight(1.0)),
        title: Container(child:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 50.h,
                    child: Image(
                      image: AssetImage("assets/icons/image(5).png"),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left:10.w),
                        child: Text(
                          "Ricardo Bowker",
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left:10.w,top: 0.h),
                        child: Text(
                          "online",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(child: Container(
                  width: 25.w,
                  height: 25.h,
                  margin: EdgeInsets.only(right: 15.w),
                  child: Image(
                    image: AssetImage("assets/icons/video(2).png"),
                  ),
                ),onTap: (){
                  Navigator.of(context).pushNamed(AppRoutes.VideoCall);
                },),
                GestureDetector(child: Container(
                  width: 25.w,
                  height: 25.h,
                  child: Image(
                    image: AssetImage("assets/icons/phone-call.png"),
                  )),onTap: (){
                  Navigator.of(context).pushNamed(AppRoutes.VoiceCall);
                },),
              ],
            )
          ],
        )
          ,));
  }

  Widget ChatLeftItem() {

    return Container(
      padding: EdgeInsets.only(top: 10.h, left: 0.w, right: 20.w,bottom: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: 250.w, //
                  minHeight: 40.w //
              ),
              child: Column(
                  mainAxisAlignment:MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Container(
                    margin: EdgeInsets.only(left: 0.w,top: 0.w),
                    padding: EdgeInsets.only(
                        top: 10.w, bottom: 10.w, left: 10.w, right: 10.w),
                    decoration: BoxDecoration(
                      color: AppColors.primarySecondaryBackground,
                      borderRadius:BorderRadius.only(topLeft:Radius.circular(0.w),topRight: Radius.circular(20.w),bottomRight:Radius.circular(20.w),bottomLeft:Radius.circular(20.w)),
                    ),
                    child:"text"=="text"?Text("荷兰咯荷兰咯荷兰咯荷兰咯荷兰咯荷兰咯荷兰咯荷兰咯", style: TextStyle(fontSize: 14.sp, color: AppColors.primaryText)):ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 90.w),
                        child: GestureDetector(
                          child: CachedNetworkImage(imageUrl:""),
                          onTap: () {
                           // Get.toNamed(AppRoutes.Photoimgview,parameters: {"url": item.content??""});
                          },
                        )),
                  ),
                    Container(
                      margin: EdgeInsets.only(top: 10.h),
                      child: Text(
                          null == null? "22:10" : duTimeLineFormat(("" as Timestamp).toDate()),
                          style: TextStyle(fontSize: 10.sp, color: AppColors.primarySecondaryElementText)
                      ),)
                  ])),
        ],
      ),
    );
  }


  Widget ChatRightItem() {
    return Container(
      padding: EdgeInsets.only(top: 10.w, left: 20.w, right: 0.w,bottom: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: 250.w, //
                  minHeight: 40.w //
              ),
              child:Column(
                mainAxisAlignment:MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 0.w,top: 0.w),
                    padding: EdgeInsets.only(
                        top: 10.w, bottom: 10.w, left: 10.w, right: 10.w),
                    decoration: BoxDecoration(
                      color: AppColors.primaryElement,
                      borderRadius: BorderRadius.only(topLeft:Radius.circular(20.w),topRight: Radius.circular(0.w),bottomRight:Radius.circular(20.w),bottomLeft:Radius.circular(20.w)),
                    ),
                    child: "text"=="text"?Text("看看事实上是事实上",
                        style: TextStyle(fontSize: 14.sp, color: AppColors.primaryElementText)
                    ):ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 90.w, //
                        ),
                        child:GestureDetector(
                          child: CachedNetworkImage(imageUrl:""),
                          onTap: () {
                            //Get.toNamed(AppRoutes.Photoimgview,parameters: {"url": item.content??""});
                          },
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.h),
                    child: Text(
                        null == null? "12:10" : duTimeLineFormat(("" as Timestamp).toDate()),
                        style: TextStyle(fontSize: 10.sp, color: AppColors.primarySecondaryElementText)
                    ),)
                ],)),
        ],
      ),
    );
  }



}
