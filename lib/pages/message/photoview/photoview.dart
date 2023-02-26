import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/common/values/colors.dart';
import 'package:ulearning/pages/message/photoview/bloc/photoview_bloc.dart';

class PhotoView extends StatefulWidget {
  const PhotoView({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => PhotoView());
  }

  @override
  State<PhotoView> createState() => _PhotoViewPage();
}

class _PhotoViewPage extends State<PhotoView> {
  PageController pageController = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<PhotoViewBloc, PhotoViewState>(
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
                child: Center(child: Text("11111"),),
              );
            })
    );
  }
}
