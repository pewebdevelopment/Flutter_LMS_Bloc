import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'voicecall_event.dart';
part 'voicecall_state.dart';

class VoiceCallBloc extends Bloc<VoiceCallEvent, VoiceCallState> {
  VoiceCallBloc() : super(const VoiceCallState()) {
    on<PageChanged>(_onPageChanged);

  }

  void _onPageChanged(
      PageChanged event,
      Emitter<VoiceCallState> emit,
      ) {
    emit(state.copyWith(page: event.page));
  }

}
