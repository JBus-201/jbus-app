import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pick_photo_from_gallery_event.dart';
part 'pick_photo_from_gallery_state.dart';

class PickPhotoFromGalleryBloc
    extends Bloc<PickPhotoFromGalleryEvent, PickPhotoFromGalleryState> {
  PickPhotoFromGalleryBloc()
      : super(PickPhotoFromGalleryState(file: File(''))) {
    on<PickPhotoFromGalleryEvent>((event, emit) {});

    on<PickUpPhotoFromGalleryEvent>(_pickUpPhotoFromGalleryEvent);
  }

  FutureOr<void> _pickUpPhotoFromGalleryEvent(PickUpPhotoFromGalleryEvent event,
      Emitter<PickPhotoFromGalleryState> emit) {
    File file = event.file;
    emit(state.copyWith(file));
  }
}
