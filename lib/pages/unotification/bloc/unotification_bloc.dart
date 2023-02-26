import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'unotification_event.dart';
part 'unotification_state.dart';

class UnotificationBloc extends Bloc<UnotificationEvent, UnotificationState> {
  UnotificationBloc() : super(const UnotificationState()) {
    on<PageChanged>(_onPageChanged);

  }

  void _onPageChanged(
      PageChanged event,
      Emitter<UnotificationState> emit,
      ) {
    emit(state.copyWith(page: event.page));
  }

}
