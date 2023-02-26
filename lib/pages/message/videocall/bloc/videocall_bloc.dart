import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'videocall_event.dart';
part 'videocall_state.dart';

class VideoCallBloc extends Bloc<VideoCallEvent, VideoCallState> {
  VideoCallBloc() : super(const VideoCallState()) {
    on<PageChanged>(_onPageChanged);

  }

  void _onPageChanged(
      PageChanged event,
      Emitter<VideoCallState> emit,
      ) {
    emit(state.copyWith(page: event.page));
  }

}
