part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

class PageChanged extends AccountEvent {
  const PageChanged(this.page);

  final int page;

  @override
  List<Object> get props => [page];
}

