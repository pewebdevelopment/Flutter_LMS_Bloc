part of 'setting_bloc.dart';

class SettingState extends Equatable {
  const SettingState({
    this.page=0,
  });

  final int page;

  SettingState copyWith({
    int? page,
  }) {
    return SettingState(
      page: page ?? this.page,
    );
  }

  @override
  List<Object> get props => [page];
}
