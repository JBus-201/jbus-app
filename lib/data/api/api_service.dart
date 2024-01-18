import 'package:jbus_app/constants/strings.dart';
import 'package:jbus_app/data/models/bus_route.dart';
import 'package:jbus_app/data/models/favorite_point.dart';
import 'package:jbus_app/data/models/favorite_point_create_request.dart';
import 'package:jbus_app/data/models/fazaa_create_request.dart';
import 'package:jbus_app/data/models/friend.dart';
import 'package:jbus_app/data/models/friends_create_request.dart';
import 'package:jbus_app/data/models/login_request.dart';
import 'package:jbus_app/data/models/login_response.dart';
import 'package:jbus_app/data/models/register_request.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST("/PassengerAccount/register/{otp}")
  Future<LoginResponse> register(
      @Body() RegisterRequest registerRequest, @Path("otp") int otp);

  @POST("/PassengerAccount/login")
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);

  @POST("/PassengerAccount/sendOTP")
  Future<HttpResponse> sendOTP(@Field() String email);

  @POST("/FavoritePoint/addfavoritepoint")
  Future<HttpResponse> addFavoritePoint(
      @Body() FavoritePointCreateRequest favoritePointRequest);

  @DELETE("/FavoritePoint/{id}")
  Future<HttpResponse> deleteFavoritePoint(@Path("id") int id);

  @GET("/FavoritePoint/{id}")
  Future<FavoritePoint> getFavoritePoint(@Path("id") int id);

  @GET("/FavoritePoint/favoritepoints")
  Future<List<FavoritePoint>> getFavoritePoints();

  @GET("/Route/getroutes")
  Future<List<BusRoute>> getRoutes();

  @GET("/Route/{id}")
  Future<BusRoute> getRoute(@Path("id") int id);

  @GET("/Route/{id}/favoritepoints")
  Future<List<FavoritePoint>> getFavoritePointsInRoute(@Path("id") int id);

  @POST("/Fazaa/storeFazaas")
  Future<HttpResponse> storeFazaas(
      @Body() List<FazaaCreateRequest> fazaaStoreRequest);

  @POST("/Friends/sendFriendRequest")
  Future<HttpResponse> sendFriendRequest(
      @Body() FriendsCreateRequest friendRequest);

  @PUT("/Friends/confirmFriendRequest")
  Future<HttpResponse> confirmFriendRequest(@Body() int friendId);

  @GET("/Friends/getFriendById")
  Future<Friend> getFriendById(@Query("id") int friendId);

  @GET("/Friends/getFriends")
  Future<List<Friend>> getFriends();

  @GET("/Friends/getFriendRequests")
  Future<List<Friend>> getFriendRequests();

  @DELETE("/Friends/deleteFriend")
  Future<HttpResponse> deleteFriend(@Query("id") int friendId);
}
