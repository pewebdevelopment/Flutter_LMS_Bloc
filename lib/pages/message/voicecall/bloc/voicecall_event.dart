part of 'voicecall_bloc.dart';

abstract class VoiceCallEvent extends Equatable {
  const VoiceCallEvent();

  @override
  List<Object> get props => [];
}

class PageChanged extends VoiceCallEvent {
  const PageChanged(this.page);

  final int page;

  @override
  List<Object> get props => [page];
}

