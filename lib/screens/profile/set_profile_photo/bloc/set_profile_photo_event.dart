part of 'set_profile_photo_bloc.dart';

sealed class SetProfilePhotoEvent extends Equatable {}

class ChangeProfilePhotoEvent extends SetProfilePhotoEvent {
  ChangeProfilePhotoEvent(
      {this.profilePhotoUrl =
          'assets/images/profile_photos/defult_avatar.png'});

  final String profilePhotoUrl;

  @override
  List<Object> get props => [profilePhotoUrl];
}
