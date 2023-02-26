part of 'message_bloc.dart';

class MessageState extends Equatable {
  const MessageState({
    this.page=0,
  });

  final int page;

  MessageState copyWith({
    int? page,
  }) {
    return MessageState(
      page: page ?? this.page,
    );
  }

  @override
  List<Object> get props => [page];
}
