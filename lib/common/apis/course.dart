import 'package:ulearning/common/entities/entities.dart';
import 'package:ulearning/common/utils/utils.dart';
import 'package:ulearning/common/values/values.dart';

class CourseAPI {

  static Future<CourseListResponseEntity> courseList() async {
    var response = await HttpUtil().post(
      'api/course_list',
    );
    return CourseListResponseEntity.fromJson(response);
  }

  static Future<CourseDetailResponseEntity> courseDetail({
    CourseRequestEntity? params,
  }) async {
    var response = await HttpUtil().post(
      'api/course_detail',
      queryParameters: params?.toJson(),
    );
    return CourseDetailResponseEntity.fromJson(response);
  }

  static Future<AuthorResponseEntity> courseAuthor({
    AuthorRequestEntity? params,
  }) async {
    var response = await HttpUtil().post(
      'api/course_author',
      queryParameters: params?.toJson(),
    );
    return AuthorResponseEntity.fromJson(response);
  }

  static Future<CourseListResponseEntity> search({
    SearchRequestEntity? params,
  }) async {
    var response = await HttpUtil().post(
      'api/search',
      queryParameters: params?.toJson(),
    );
    return CourseListResponseEntity.fromJson(response);
  }


}
