part of 'signup_bloc.dart';

class SignupState extends Equatable {
  const SignupState({
    this.icon = Icons.visibility_off_outlined,
    this.obscureText = true,
  });
  final IconData icon;
  final bool obscureText;

  @override
  List<Object> get props => [icon];

  SignupState copyWith(IconData icon, bool obscureText) {
    return SignupState(icon: icon, obscureText: obscureText);
  }
}
