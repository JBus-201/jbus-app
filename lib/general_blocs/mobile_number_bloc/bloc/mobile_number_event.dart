part of 'mobile_number_bloc.dart';

sealed class MobileNumberEvent extends Equatable {
  const MobileNumberEvent();
}

class UpdateMobileNumberEvent extends MobileNumberEvent {
  const UpdateMobileNumberEvent(this.mobileNumber);
  final String mobileNumber;

  @override
  List<Object> get props => [mobileNumber];
}
