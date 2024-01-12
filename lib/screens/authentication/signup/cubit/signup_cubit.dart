import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit()
      : super(const SignupState(
          firstName: '',
          lastName: '',
          email: '',
          mobileNumber: '',
          password: '',
          passwordConfirmation: '',
        ));

  void firstNameChanged(String value) {
    emit(state.copyWith(firstName: value));
  }

  void lastNameChanged(String value) {
    emit(state.copyWith(lastName: value));
  }

  void emailChanged(String value) {
    emit(state.copyWith(email: value));
  }

  void mobileNumberChanged(String value) {
    emit(state.copyWith(mobileNumber: value));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value));
  }

  void passwordConfirmationChanged(String value) {
    emit(state.copyWith(passwordConfirmation: value));
  }

  void submit() {
    final firstName = state.firstName;
    final lastName = state.lastName;
    final email = state.email;
    final mobileNumber = state.mobileNumber;
    final password = state.password;
    final passwordConfirmation = state.passwordConfirmation;

    if (firstName.isEmpty ||
        lastName.isEmpty ||
        email.isEmpty ||
        mobileNumber.isEmpty ||
        password.isEmpty ||
        passwordConfirmation.isEmpty) {
      return;
    }
  }
}
