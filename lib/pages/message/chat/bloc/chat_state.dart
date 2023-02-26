part of 'chat_bloc.dart';

class ChatState extends Equatable {
  const ChatState({
    this.page=0,
  });

  final int page;

  ChatState copyWith({
    int? page,
  }) {
    return ChatState(
      page: page ?? this.page,
    );
  }

  @override
  List<Object> get props => [page];
}
