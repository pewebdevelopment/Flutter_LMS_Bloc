import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ulearning/common/entities/entities.dart';
import 'package:ulearning/common/utils/logger.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState()) {
    on<UserProfileChanged>(_onUserProfileChanged);
  }

  void _onUserProfileChanged(
      UserProfileChanged event,
      Emitter<ProfileState> emit,
      ) {
    emit(state.copyWith(userProfile: event.userProfile));
  }

}
