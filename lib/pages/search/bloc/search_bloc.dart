import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ulearning/common/entities/entities.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState()) {
    on<CourseItemChanged>(_onCourseItemChanged);
  }

  void _onCourseItemChanged(
      CourseItemChanged event,
      Emitter<SearchState> emit,
      ) {
    emit(state.copyWith(courseItem: event.courseItem));
  }

}
