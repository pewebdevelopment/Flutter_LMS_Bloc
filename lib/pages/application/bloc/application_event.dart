part of 'application_bloc.dart';

abstract class ApplicationEvent extends Equatable {
  const ApplicationEvent();

  @override
  List<Object> get props => [];
}

class PageChanged extends ApplicationEvent {
  const PageChanged(this.page);

  final int page;

  @override
  List<Object> get props => [page];
}

