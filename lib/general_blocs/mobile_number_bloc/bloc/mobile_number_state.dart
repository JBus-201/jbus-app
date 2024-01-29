part of 'mobile_number_bloc.dart';

class MobileNumberState extends Equatable {
  const MobileNumberState({this.mobileNumber ='Add a mobile number'});

  final String mobileNumber;
  
  @override
  List<Object> get props => [mobileNumber];

MobileNumberState copyWith(String mobileNumber) {
    return MobileNumberState(mobileNumber: mobileNumber);
  }
}
