part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class CourseItemChanged extends SearchEvent {
  const CourseItemChanged(this.courseItem);

  final List<CourseItem> courseItem;

  @override
  List<Object> get props => [courseItem];
}

