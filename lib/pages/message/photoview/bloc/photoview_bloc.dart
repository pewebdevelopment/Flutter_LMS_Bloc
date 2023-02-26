import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'photoview_event.dart';
part 'photoview_state.dart';

class PhotoViewBloc extends Bloc<PhotoViewEvent, PhotoViewState> {
  PhotoViewBloc() : super(const PhotoViewState()) {
    on<PageChanged>(_onPageChanged);

  }

  void _onPageChanged(
      PageChanged event,
      Emitter<PhotoViewState> emit,
      ) {
    emit(state.copyWith(page: event.page));
  }

}
