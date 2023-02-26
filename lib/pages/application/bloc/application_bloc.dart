

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'application_event.dart';
part 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc()  : super(const ApplicationState()) {
    on<PageChanged>(_onPageChanged);
  }

  void _onPageChanged(
      PageChanged event,
      Emitter<ApplicationState> emit,
      ) {
    emit(state.copyWith(page: event.page));
  }

}
