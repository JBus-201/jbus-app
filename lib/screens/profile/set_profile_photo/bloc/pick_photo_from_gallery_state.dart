part of 'pick_photo_from_gallery_bloc.dart';

class PickPhotoFromGalleryState extends Equatable {
  const PickPhotoFromGalleryState({required this.file});
  final File file;
  @override
  List<Object> get props => [file];

  PickPhotoFromGalleryState copyWith(File file) {
    return PickPhotoFromGalleryState(file: file);
  }
}
