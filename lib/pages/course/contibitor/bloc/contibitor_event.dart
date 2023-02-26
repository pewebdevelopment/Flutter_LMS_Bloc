part of 'contibitor_bloc.dart';

abstract class ContibitorEvent extends Equatable {
  const ContibitorEvent();

  @override
  List<Object> get props => [];
}

class PageChanged extends ContibitorEvent {
  const PageChanged(this.page);

  final int page;

  @override
  List<Object> get props => [page];
}

