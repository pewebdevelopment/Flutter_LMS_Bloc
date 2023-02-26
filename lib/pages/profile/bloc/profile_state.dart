part of 'profile_bloc.dart';

//enum ListStatus { loading, success, failure }
class ProfileState extends Equatable {
  const ProfileState({
    this.userProfile,
   // this.items = const <Item>[],
  });
  final UserItem? userProfile;
  //final List<Item> items;

  ProfileState copyWith({
    UserItem? userProfile,
  }) {
    return ProfileState(
      userProfile: userProfile ?? this.userProfile,
    );
  }

  @override
  List<Object?> get props => [userProfile];
}
