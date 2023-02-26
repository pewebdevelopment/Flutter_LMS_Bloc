part of 'application_bloc.dart';

class ApplicationState extends Equatable {
  const ApplicationState({
    this.page=0,
  });

  final int page;

  ApplicationState copyWith({
    int? page,
  }) {
    return ApplicationState(
      page: page ?? this.page,
    );
  }

  @override
  List<Object> get props => [page];
}
