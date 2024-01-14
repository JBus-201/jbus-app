import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'set_profile_photo_event.dart';
part 'set_profile_photo_state.dart';

class SetProfilePhotoBloc
    extends Bloc<SetProfilePhotoEvent, SetProfilePhotoState> {
  SetProfilePhotoBloc()
      : super(
          const SetProfilePhotoState(
            photoUrl: 'assets/images/profile_photos/defult_avatar.png',
          ),
        ) {
    on<SetProfilePhotoEvent>((event, emit) {});

    on<ChangeProfilePhotoEvent>(_changeProfilePhotoEvent);
  }

  FutureOr<void> _changeProfilePhotoEvent(
      ChangeProfilePhotoEvent event, Emitter<SetProfilePhotoState> emit) {
    String photoUrl = event.profilePhotoUrl;

    emit(state.copyWith(photoUrl));
  }
}
