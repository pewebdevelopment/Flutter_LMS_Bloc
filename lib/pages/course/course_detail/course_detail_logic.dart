import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/common/apis/apis.dart';
import 'package:ulearning/common/entities/entities.dart';
import 'package:ulearning/common/widgets/widgets.dart';
import 'package:ulearning/pages/course/course_detail/bloc/course_detail_bloc.dart';


class CourseDetailLogic{
  final BuildContext context;

  CourseDetailLogic({
    required this.context,
  });

  void init(){

  }

  asyncPostAllData(int? id) async {
    CourseRequestEntity courseRequestEntity = new CourseRequestEntity();
    courseRequestEntity.id = id;
    var result = await CourseAPI.courseDetail(params: courseRequestEntity);
    print(result);
    if(result.code==0){
      context.read<CourseDetailBloc>().add(CourseItemChanged(result.data!));
    }else{
      toastInfo(msg: 'internet error');
    }

  }

}