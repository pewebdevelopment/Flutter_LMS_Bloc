part of 'search_bloc.dart';

class SearchState extends Equatable {
  const SearchState({
    this.courseItem = const <CourseItem>[],
  });

  final List<CourseItem> courseItem;

  SearchState copyWith({
    List<CourseItem>? courseItem,
  }) {
    return SearchState(
      courseItem: courseItem ?? this.courseItem,
    );
  }

  @override
  List<Object> get props => [courseItem];
}
