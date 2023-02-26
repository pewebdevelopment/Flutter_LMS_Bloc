part of 'photoview_bloc.dart';

abstract class PhotoViewEvent extends Equatable {
  const PhotoViewEvent();

  @override
  List<Object> get props => [];
}

class PageChanged extends PhotoViewEvent {
  const PageChanged(this.page);

  final int page;

  @override
  List<Object> get props => [page];
}

