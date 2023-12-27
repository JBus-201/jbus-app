import 'package:jbus_app/constants/strings.dart';
import 'package:jbus_app/data/models/favorite_point_create_request.dart';
import 'package:jbus_app/data/models/login_request.dart';
import 'package:jbus_app/data/models/login_response.dart';
import 'package:jbus_app/data/models/register_request.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST("PassengerAccount/register")
  Future<LoginResponse> register(@Body() RegisterRequest registerRequest);

  @POST("PassengerAccount/login")
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);

  @POST("PassengerAccount/SendOTP")
  Future<Response> sendOTP(@Field() String email);

  @POST("FavoritePoint/AddFavoritePoint")
  Future<Response> addFavoritePoint(
      @Body() FavoritePointCreateRequest favoritePointRequest);
}
