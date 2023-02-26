import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'lesson_event.dart';
part 'lesson_state.dart';

class LessonBloc extends Bloc<LessonEvent, LessonState> {
  LessonBloc() : super(const LessonState()) {
    on<PageChanged>(_onPageChanged);

  }

  void _onPageChanged(
      PageChanged event,
      Emitter<LessonState> emit,
      ) {
    emit(state.copyWith(page: event.page));
  }

}
