import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/data/models/register_request.dart';
import 'package:jbus_app/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'email_verify_state.dart';

class EmailVerifyCubit extends Cubit<EmailVerifyState> {
  final ApiService apiService;
  final AuthService authService;
  final SharedPreferences prefs;
  EmailVerifyCubit({
    required this.apiService,
    required this.authService,
    required this.prefs,
  }) : super(EmailVerifyInitial());

  void signUp(RegisterRequest request, int otp) async {
    emit(EmailVerifyLoading());
    try {
      final res = await apiService.register(request, otp);
      await authService.setLoggedIn(res.token);
      await prefs.setString('user', res.passengerDto.toString());

      emit(EmailVerifySuccess());
    } catch (error) {
      emit(EmailVerifyFailure(error.toString()));
    }
  }
}
