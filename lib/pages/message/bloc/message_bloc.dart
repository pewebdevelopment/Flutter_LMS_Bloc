import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  MessageBloc() : super(const MessageState()) {
    on<PageChanged>(_onPageChanged);

  }

  void _onPageChanged(
      PageChanged event,
      Emitter<MessageState> emit,
      ) {
    emit(state.copyWith(page: event.page));
  }

}
