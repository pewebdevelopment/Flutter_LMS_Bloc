import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(const AccountState()) {
    on<PageChanged>(_onPageChanged);

  }

  void _onPageChanged(
      PageChanged event,
      Emitter<AccountState> emit,
      ) {
    emit(state.copyWith(page: event.page));
  }

}
