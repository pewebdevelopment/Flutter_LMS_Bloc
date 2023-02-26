import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ulearning/common/utils/utils.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(const ChatState()) {
    on<PageChanged>(_onPageChanged);
  }

  void _onPageChanged(
      PageChanged event,
      Emitter<ChatState> emit,
      ) {
    emit(state.copyWith(page: event.page));
  }

}
