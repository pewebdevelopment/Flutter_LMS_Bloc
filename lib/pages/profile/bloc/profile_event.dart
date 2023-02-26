part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class UserProfileChanged extends ProfileEvent {
  const UserProfileChanged(this.userProfile);

  final UserItem userProfile;

  @override
  List<Object> get props => [userProfile];
}

