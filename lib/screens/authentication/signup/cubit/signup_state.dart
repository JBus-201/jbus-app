part of 'signup_cubit.dart';

class SignupState extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String mobileNumber;
  final String password;
  final String passwordConfirmation;

  const SignupState({
    required this.firstName,
    required this.lastName,
    required this.email,
    this.mobileNumber = '',
    required this.password,
    required this.passwordConfirmation,
  });

  @override
  List<Object> get props => [
        firstName,
        lastName,
        email,
        mobileNumber,
        password,
        passwordConfirmation,
      ];

  SignupState copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? mobileNumber,
    String? password,
    String? passwordConfirmation,
  }) {
    return SignupState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      password: password ?? this.password,
      passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
    );
  }
}
