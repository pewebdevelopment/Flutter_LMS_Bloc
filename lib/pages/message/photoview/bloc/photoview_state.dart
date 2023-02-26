part of 'photoview_bloc.dart';

class PhotoViewState extends Equatable {
  const PhotoViewState({
    this.page=0,
  });

  final int page;

  PhotoViewState copyWith({
    int? page,
  }) {
    return PhotoViewState(
      page: page ?? this.page,
    );
  }

  @override
  List<Object> get props => [page];
}
