import 'package:bloc/bloc.dart';
import 'package:jbus_app/data/api/api_service.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final ApiService apiService;

  SignupCubit({
    required this.apiService,
  }) : super(SignupInitial());

  void sendOTP(String email) async {
    emit(SignupLoading());
    try {
      await apiService.sendOTP(email);
      emit(SignupOTPSent());
    } catch (error) {
      emit(SignupFailure(error.toString()));
    }
  }
}
