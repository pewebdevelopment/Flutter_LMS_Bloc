part of 'lesson_bloc.dart';

abstract class LessonEvent extends Equatable {
  const LessonEvent();

  @override
  List<Object> get props => [];
}

class PageChanged extends LessonEvent {
  const PageChanged(this.page);

  final int page;

  @override
  List<Object> get props => [page];
}

