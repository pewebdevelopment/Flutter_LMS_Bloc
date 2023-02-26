import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'contibitor_event.dart';
part 'contibitor_state.dart';

class ContibitorBloc extends Bloc<ContibitorEvent, ContibitorState> {
  ContibitorBloc() : super(const ContibitorState()) {
    on<PageChanged>(_onPageChanged);

  }

  void _onPageChanged(
      PageChanged event,
      Emitter<ContibitorState> emit,
      ) {
    emit(state.copyWith(page: event.page));
  }

}
