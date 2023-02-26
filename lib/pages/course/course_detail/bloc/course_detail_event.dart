part of 'course_detail_bloc.dart';

abstract class CourseDetailEvent extends Equatable {
  const CourseDetailEvent();

  @override
  List<Object> get props => [];
}

class CourseItemChanged extends CourseDetailEvent {
  const CourseItemChanged(this.courseItem);

  final CourseItem courseItem;

  @override
  List<Object> get props => [courseItem];
}

