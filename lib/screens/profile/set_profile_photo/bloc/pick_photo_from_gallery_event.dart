part of 'pick_photo_from_gallery_bloc.dart';

sealed class PickPhotoFromGalleryEvent extends Equatable {}

class PickUpPhotoFromGalleryEvent extends PickPhotoFromGalleryEvent {
  PickUpPhotoFromGalleryEvent({required this.file});

  final File file;

  @override
  List<Object> get props => [file];
}
