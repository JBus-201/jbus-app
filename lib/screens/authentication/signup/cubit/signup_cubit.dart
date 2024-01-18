import 'package:bloc/bloc.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/data/models/register_request.dart';
import 'package:jbus_app/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final ApiService _apiService;
  final AuthService _authService;
  final SharedPreferences _prefs;

  SignupCubit({
    required ApiService apiService,
    required AuthService authService,
    required SharedPreferences prefs,
  })  : _apiService = apiService,
        _authService = authService,
        _prefs = prefs,
        super(SignupInitial());

  void signUp(RegisterRequest request, int otp) async {
    emit(SignupLoading());
    try {
      final res = await _apiService.register(request, otp);
      await _authService.setLoggedIn(res.token);
      await _prefs.setString('user', res.passengerDto.toString());

      emit(SignupSuccess());
    } catch (error) {
      emit(SignupFailure(error.toString()));
    }
  }
}
