part of 'videocall_bloc.dart';

abstract class VideoCallEvent extends Equatable {
  const VideoCallEvent();

  @override
  List<Object> get props => [];
}

class PageChanged extends VideoCallEvent {
  const PageChanged(this.page);

  final int page;

  @override
  List<Object> get props => [page];
}

