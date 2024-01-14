part of 'set_profile_photo_bloc.dart';

class SetProfilePhotoState extends Equatable {
  const SetProfilePhotoState({required this.photoUrl});
  final String photoUrl;
  @override
  List<Object> get props => [photoUrl];

  SetProfilePhotoState copyWith(String photoUrl) {
    return SetProfilePhotoState(photoUrl: photoUrl);
  }
}
