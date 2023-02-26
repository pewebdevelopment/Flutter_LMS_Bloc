part of 'message_bloc.dart';

abstract class MessageEvent extends Equatable {
  const MessageEvent();

  @override
  List<Object> get props => [];
}

class PageChanged extends MessageEvent {
  const PageChanged(this.page);

  final int page;

  @override
  List<Object> get props => [page];
}

