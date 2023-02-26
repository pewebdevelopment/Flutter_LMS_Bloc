part of 'contibitor_bloc.dart';

class ContibitorState extends Equatable {
  const ContibitorState({
    this.page=0,
  });

  final int page;

  ContibitorState copyWith({
    int? page,
  }) {
    return ContibitorState(
      page: page ?? this.page,
    );
  }

  @override
  List<Object> get props => [page];
}
