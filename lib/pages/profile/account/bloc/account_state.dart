part of 'account_bloc.dart';

class AccountState extends Equatable {
  const AccountState({
    this.page=0,
  });

  final int page;

  AccountState copyWith({
    int? page,
  }) {
    return AccountState(
      page: page ?? this.page,
    );
  }

  @override
  List<Object> get props => [page];
}
