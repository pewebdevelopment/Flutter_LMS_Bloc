part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class PageChanged extends ChatEvent {
  const PageChanged(this.page);

  final int page;

  @override
  List<Object> get props => [page];
}

