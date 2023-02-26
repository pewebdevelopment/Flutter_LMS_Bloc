part of 'voicecall_bloc.dart';

class VoiceCallState extends Equatable {
  const VoiceCallState({
    this.page=0,
  });

  final int page;

  VoiceCallState copyWith({
    int? page,
  }) {
    return VoiceCallState(
      page: page ?? this.page,
    );
  }

  @override
  List<Object> get props => [page];
}
