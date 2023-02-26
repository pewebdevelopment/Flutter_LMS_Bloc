import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/common/apis/apis.dart';
import 'package:ulearning/common/entities/entities.dart';
import 'package:ulearning/common/widgets/widgets.dart';
import 'package:ulearning/pages/search/bloc/search_bloc.dart';


class SearchLogic{
  final BuildContext context;

  SearchLogic({
    required this.context,
  });

  void init(){
    asyncPostRecommendData();
  }

  asyncPostRecommendData() async {
    var result = await CourseAPI.courseList();
    print(result);
    if(result.code==0){
      context.read<SearchBloc>().add(CourseItemChanged(result.data!));
    }else{
      toastInfo(msg: 'internet error');
    }

  }

  asyncPostSearchData(String content) async {
    SearchRequestEntity searchRequestEntity = new SearchRequestEntity();
    searchRequestEntity.search = content;
    var result = await CourseAPI.search(params: searchRequestEntity);
    print(result);
    if(result.code==0){
      context.read<SearchBloc>().add(CourseItemChanged(result.data!));
    }else{
      toastInfo(msg: 'internet error');
    }
  }

}