part of 'lesson_bloc.dart';

class LessonState extends Equatable {
  const LessonState({
    this.page=0,
  });

  final int page;

  LessonState copyWith({
    int? page,
  }) {
    return LessonState(
      page: page ?? this.page,
    );
  }

  @override
  List<Object> get props => [page];
}
