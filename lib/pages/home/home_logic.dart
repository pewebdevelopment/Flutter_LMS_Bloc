import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ulearning/common/apis/apis.dart';
import 'package:ulearning/common/entities/entities.dart';
import 'package:ulearning/common/routes/routes.dart';
import 'package:ulearning/common/utils/utils.dart';
import 'package:ulearning/common/values/constant.dart';
import 'package:ulearning/common/widgets/widgets.dart';
import 'package:ulearning/global.dart';
import 'package:ulearning/pages/frame/sign_in/bloc/sign_in_bloc.dart';
import 'package:ulearning/pages/home/bloc/home_bloc.dart';


class HomeLogic{
  final BuildContext context;

   HomeLogic({
    required this.context,
  });

  void init(){
    asyncPostAllData();
  }

  asyncPostAllData() async {

    var result = await CourseAPI.courseList();
    print(result);
    if(result.code==0){
      context.read<HomeBloc>().add(CourseItemChanged(result.data!));
    }else{
      toastInfo(msg: 'internet error');
    }

  }

}