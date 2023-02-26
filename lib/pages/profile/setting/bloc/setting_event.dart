part of 'setting_bloc.dart';

abstract class SettingEvent extends Equatable {
  const SettingEvent();

  @override
  List<Object> get props => [];
}

class PageChanged extends SettingEvent {
  const PageChanged(this.page);

  final int page;

  @override
  List<Object> get props => [page];
}

