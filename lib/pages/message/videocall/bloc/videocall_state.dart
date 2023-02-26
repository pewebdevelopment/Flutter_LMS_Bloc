part of 'videocall_bloc.dart';

class VideoCallState extends Equatable {
  const VideoCallState({
    this.page=0,
  });

  final int page;

  VideoCallState copyWith({
    int? page,
  }) {
    return VideoCallState(
      page: page ?? this.page,
    );
  }

  @override
  List<Object> get props => [page];
}
