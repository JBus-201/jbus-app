import 'dart:io' hide HttpResponse;

import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:jbus_app/constants/strings.dart';
import 'package:jbus_app/data/models/bus.dart';
import 'package:jbus_app/data/models/bus_route.dart';
import 'package:jbus_app/data/models/favorite_point.dart';
import 'package:jbus_app/data/models/favorite_point_create_request.dart';
import 'package:jbus_app/data/models/fazaa.dart';
import 'package:jbus_app/data/models/fazaa_create_request.dart';
import 'package:jbus_app/data/models/friend.dart';
import 'package:jbus_app/data/models/friends_create_request.dart';
import 'package:jbus_app/data/models/passenger.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/data/models/login_request.dart';
import 'package:jbus_app/data/models/login_response.dart';
import 'package:jbus_app/data/models/point_create_request.dart';
import 'package:jbus_app/data/models/predefined_stops.dart';
import 'package:jbus_app/data/models/register_request.dart';
import 'package:jbus_app/data/models/trip.dart';
import 'package:jbus_app/data/models/trip_create_request.dart';
import 'package:jbus_app/data/models/trip_update_request.dart';
import 'package:retrofit/dio.dart';

void main() {
  group(
    'ApiService',
    () {
      late Dio dio;
      late ApiService apiService;
      late BaseOptions options;

      setUp(() {
        options = BaseOptions(
          contentType: Headers.jsonContentType,
          headers: {HttpHeaders.acceptHeader: Headers.jsonContentType},
        );
        dio = Dio(
          options,
        );
        dio.interceptors.add(LogInterceptor(
          requestBody: true,
          responseBody: true,
          requestHeader: true,
          responseHeader: true,
          error: true,
          request: true,
        ));
        apiService = ApiService(dio, baseUrl: baseUrl);
      });

      test('register should return LoginResponse', () async {
        // Arrange
        final email =
            'testemail${DateTime.now().toString().replaceAll(' ', '').replaceAll(':', '')}@example.com';
        await apiService.sendOTP(email);
        final registerRequest = RegisterRequest(
          password: 'testpassword',
          email: email,
          name: 'testname',
          phoneNumber: '12345678',
        );

        // Act
        final response = await apiService.register(registerRequest, 1234);
        // Assert
        expect(response, isA<LoginResponse>());
      });

      test('login should return LoginResponse', () async {
        // Arrange
        final loginRequest = LoginRequest(
          email: 'aboodsaob1139@gmail.com',
          password: 'password',
        );

        // Act
        final response = await apiService.login(loginRequest);

        // Assert
        expect(response, isA<LoginResponse>());
        expect(response.token, isA<String>());
        expect(response.passengerDto, isA<Passenger>());
      });

      // Add more tests for other methods in ApiService

      /*
      @POST("/FavoritePoint/addfavoritepoint")
  Future<HttpResponse> addFavoritePoint(
      @Body() FavoritePointCreateRequest favoritePointRequest);

  @DELETE("/FavoritePoint/{id}")
  Future<List<FavoritePoint>> deleteFavoritePoint(@Path("id") int id);

  @GET("/FavoritePoint/{id}")
  Future<FavoritePoint> getFavoritePoint(@Path("id") int id);

  @GET("/FavoritePoint/favoritepoints")
  Future<List<FavoritePoint>> getFavoritePoints();
  */

      test('addFavoritePoint should return HttpResponse', () async {
        // Arrange
        final loginRequest = LoginRequest(
          email: 'aboodsaob1139@gmail.com',
          password: 'password',
        );

        final loginResponse = await apiService.login(loginRequest);
        dio.options.headers['Authorization'] = 'Bearer ${loginResponse.token}';

        final favoritePointRequest = FavoritePointCreateRequest(
          name: 'testname',
          lat: 13.234,
          long: 123.234,
          routeId: 1,
        );

        // Act
        final response =
            await apiService.addFavoritePoint(favoritePointRequest);

        // Assert
        expect(response, isA<HttpResponse>());
        expect(response.response.statusCode, 201);
      });

      test('deleteFavoritePoint should return List<FavoritePoint>', () async {
        // Arrange
        final loginRequest = LoginRequest(
          email: 'aboodsaob1139@gmail.com',
          password: 'password',
        );

        final loginResponse = await apiService.login(loginRequest);
        dio.options.headers['Authorization'] = 'Bearer ${loginResponse.token}';

        final favoritePoints = await apiService.getFavoritePoints();

        final id = favoritePoints[0].id;

        // Act
        final response = await apiService.deleteFavoritePoint(id);

        // Assert
        expect(response, isA<HttpResponse>());
        expect(response.response.statusCode, 204);
      });

      test('getFavoritePoint should return FavoritePoint', () async {
        // Arrange
        final loginRequest = LoginRequest(
          email: 'aboodsaob1139@gmail.com',
          password: 'password',
        );

        final loginResponse = await apiService.login(loginRequest);
        dio.options.headers['Authorization'] = 'Bearer ${loginResponse.token}';
        final favoritePoints = await apiService.getFavoritePoints();

        final id = favoritePoints[0].id;

        // Act
        final response = await apiService.getFavoritePoint(id);

        // Assert
        expect(response, isA<FavoritePoint>());
      });

      test('getFavoritePoints should return List<FavoritePoint>', () async {
        // Arrange
        final loginRequest = LoginRequest(
          email: 'aboodsaob1139@gmail.com',
          password: 'password',
        );

        final loginResponse = await apiService.login(loginRequest);
        dio.options.headers['Authorization'] = 'Bearer ${loginResponse.token}';

        // Act
        final response = await apiService.getFavoritePoints();

        // Assert
        expect(response, isA<List<FavoritePoint>>());
      });

      /*
       @GET("/Route/getroutes")
  Future<List<BusRoute>> getRoutes();

  @GET("/Route/{id}")
  Future<BusRoute> getRoute(@Path("id") int id);

  @GET("/Route/{id}/favoritepoints")
  Future<List<FavoritePoint>> getFavoritePointsInRoute(@Path("id") int id);
      */

      test('getRoutes should return List<BusRoute>', () async {
        // Arrange
        final loginRequest = LoginRequest(
          email: 'aboodsaob1139@gmail.com',
          password: 'password',
        );

        final loginResponse = await apiService.login(loginRequest);
        dio.options.headers['Authorization'] = 'Bearer ${loginResponse.token}';

        // Act
        final response = await apiService.getRoutes();

        // Assert

        expect(response, isA<List<BusRoute>>());
      });

      test('getRoute should return BusRoute', () async {
        // Arrange
        final loginRequest = LoginRequest(
          email: 'aboodsaob1139@gmail.com',
          password: 'password',
        );

        final loginResponse = await apiService.login(loginRequest);
        dio.options.headers['Authorization'] = 'Bearer ${loginResponse.token}';

        final routes = await apiService.getRoutes();

        final id = routes[0].id;

        // Act

        final response = await apiService.getRoute(id);

        // Assert
        expect(response, isA<BusRoute>());
      });

      test('getFavoritePointsInRoute should return List<FavoritePoint>',
          () async {
        // Arrange
        final loginRequest = LoginRequest(
          email: 'aboodsaob1139@gmail.com',
          password: 'password',
        );

        final loginResponse = await apiService.login(loginRequest);
        dio.options.headers['Authorization'] = 'Bearer ${loginResponse.token}';

        final routes = await apiService.getRoutes();

        final id = routes[0].id;

        // Act

        final response = await apiService.getFavoritePointsInRoute(id);

        // Assert
        expect(response, isA<List<FavoritePoint>>());
      });

      /*
        @POST("/Fazaa/storeFazaas")
  Future<HttpResponse> storeFazaas(
      @Body() List<FazaaCreateRequest> fazaaStoreRequest);
        @GET("/Fazaa/getFazaaById/{id}")
  Future<Fazaa> getFazaaById(@Path("id") int id);

  @POST("/Friends/sendFriendRequest")
  Future<HttpResponse> sendFriendRequest(
      @Body() FriendsCreateRequest friendRequest);

      
      */

      test('storeFazaas should return HttpResponse', () async {
        // Arrange
        final loginRequest = LoginRequest(
          email: 'aboodsaob1139@gmail.com',
          password: 'password',
        );

        final loginResponse = await apiService.login(loginRequest);
        dio.options.headers['Authorization'] = 'Bearer ${loginResponse.token}';

        // Act
        final response = await apiService.storeFazaas(
          FazaaCreateRequest(
            amount: 1000,
            creditorId: loginResponse.passengerDto.id,
          ),
        );

        // Assert

        expect(response, isA<HttpResponse>());
        expect(response.response.statusCode, 201);
      }, skip: true);

      test('getFazaas should return List<Fazaa>', () async {
        // Arrange
        final loginRequest = LoginRequest(
          email: 'aboodsaob1139@gmail.com',
          password: 'password',
        );

        final loginResponse = await apiService.login(loginRequest);
        dio.options.headers['Authorization'] = 'Bearer ${loginResponse.token}';

        // Act
        final fazaas = await apiService.getFazaas();

        // Assert
        expect(fazaas, isA<List<Fazaa>>());
      });

      test('getFazaaById should return Fazaa', () async {
        // Arrange
        final loginRequest = LoginRequest(
          email: 'aboodsaob1139@gmail.com',
          password: 'password',
        );

        final loginResponse = await apiService.login(loginRequest);
        dio.options.headers['Authorization'] = 'Bearer ${loginResponse.token}';
        final fazaas = await apiService.getFazaas();

        // Act
        final fazaaResponse = await apiService.getFazaaById(fazaas[0].id);

        // Assert
        expect(fazaaResponse, isA<Fazaa>());
      });

      /*
        @POST("/Friends/sendFriendRequest")
  Future<HttpResponse> sendFriendRequest(
      @Body() FriendsCreateRequest friendRequest);

  @PUT("/Friends/confirmFriendRequest")
  Future<HttpResponse> confirmFriendRequest(@Body() int friendId);

  @GET("/Friends/getFriendById")
  Future<Friends> getFriendById(@Query("id") int friendId);

  @GET("/Friends/getFriends")
  Future<List<Friends>> getFriends();

  @GET("/Friends/getFriendRequests")
  Future<List<Friends>> getFriendRequests();

  @DELETE("/Friends/deleteFriend")
  Future<HttpResponse> deleteFriend(@Query("id") int friendId);
  */

      test('sendFriendRequest should return HttpResponse', () async {
        // Arrange
        final loginRequest = LoginRequest(
          email: 'testemail${DateTime.now()}@example.com',
          password: 'password',
        );

        final loginResponse = await apiService.login(loginRequest);
        dio.options.headers['Authorization'] = 'Bearer ${loginResponse.token}';
        final friendRequest = FriendsCreateRequest(
          friendId: loginResponse.passengerDto.id,
        );

        // Act
        final response = await apiService.sendFriendRequest(friendRequest);

        // Assert
        expect(response, isA<HttpResponse>());
        expect(response.response.statusCode, 201);
      }, skip: true);

      test('confirmFriendRequest should return HttpResponse', () async {
        // Arrange
        final loginRequest = LoginRequest(
          email: 'testemail${DateTime.now()}@example.com',
          password: 'password',
        );

        final loginResponse = await apiService.login(loginRequest);
        dio.options.headers['Authorization'] = 'Bearer ${loginResponse.token}';
        final friendRequest = FriendsCreateRequest(
          friendId: loginResponse.passengerDto.id,
        );

        final response = await apiService.sendFriendRequest(friendRequest);

        // Act
        final confirmResponse =
            await apiService.confirmFriendRequest(response.response.data);

        // Assert
        expect(confirmResponse, isA<HttpResponse>());
        expect(confirmResponse.response.statusCode, 200);
      }, skip: true);

      test('getFriendById should return Friends', () async {
        // Arrange
        final loginRequest = LoginRequest(
          email: 'testemail${DateTime.now()}@example.com',
          password: 'password',
        );

        final loginResponse = await apiService.login(loginRequest);
        dio.options.headers['Authorization'] = 'Bearer ${loginResponse.token}';
        final friendRequest = FriendsCreateRequest(
          friendId: loginResponse.passengerDto.id,
        );

        final response = await apiService.sendFriendRequest(friendRequest);

        // Act
        final friendResponse =
            await apiService.getFriendById(response.response.data);

        // Assert
        expect(friendResponse, isA<Friend>());
      }, skip: true);

      test('getFriends should return List<Friends>', () async {
        // Arrange
        final loginRequest = LoginRequest(
          email: 'aboodsaob1139@gmail.com',
          password: 'password',
        );

        final loginResponse = await apiService.login(loginRequest);
        dio.options.headers['Authorization'] = 'Bearer ${loginResponse.token}';

        // Act
        final friendsResponse = await apiService.getFriends();

        // Assert

        expect(friendsResponse, isA<List<Friend>>());
      });

      test('getTrips should return List<Trip>', () async {
        // Arrange
        final loginRequest = LoginRequest(
          email: 'aboodsaob1139@gmail.com',
          password: 'password',
        );

        final loginResponse = await apiService.login(loginRequest);
        dio.options.headers['Authorization'] = 'Bearer ${loginResponse.token}';

        // Act
        final tripsResponse = await apiService.getTrips();

        // Assert
        expect(tripsResponse, isA<List<Trip>>());
      });

      test('getTrip should return Trip', () async {
        // Arrange
        final loginRequest = LoginRequest(
          email: 'aboodsaob1139@gmail.com',
          password: 'password',
        );

        final loginResponse = await apiService.login(loginRequest);
        dio.options.headers['Authorization'] = 'Bearer ${loginResponse.token}';

        final tripsResponse = await apiService.getTrips();

        // Act
        final tripResponse = await apiService.getTrip(tripsResponse[0].id!);

        // Assert
        expect(tripResponse, isA<Trip>());
      });

      /*

  @PUT("/Trip/{id}")
  Future<HttpResponse> updateTrip(
      @Path("id") int id, @Body() TripUpdateRequest tripUpdateRequest);

  @POST("/Trip")
  Future<HttpResponse> createTrip(@Body() TripCreateRequest tripCreateRequest);
    */

      test('updateTrip should return HttpResponse', () async {
        // Arrange
        final loginRequest = LoginRequest(
          email: 'aboodsaob1139@gmail.com',
          password: 'password',
        );

        final loginResponse = await apiService.login(loginRequest);
        dio.options.headers['Authorization'] = 'Bearer ${loginResponse.token}';

        final tripsResponse = await apiService.getTrips();

        final tripUpdateRequest = TripUpdateRequest(
          status: 'ONGOING',
        );

        final tripUpdateRequest2 = TripUpdateRequest(
          status: 'COMPLETED',
        );
        try {
          await apiService.updateTrip(tripsResponse[0].id!, tripUpdateRequest);
        } catch (_) {}

        // Act
        final tripResponse = await apiService.updateTrip(
            tripsResponse[0].id!, tripUpdateRequest2);

        // Assert
        expect(tripResponse, isA<HttpResponse>());
        expect(tripResponse.response.statusCode, 204);
      }, skip: true);

      test('createTrip should return HttpResponse', () async {
        // Arrange
        final loginRequest = LoginRequest(
          email: 'aboodsaob1139@gmail.com',
          password: 'password',
        );

        final loginResponse = await apiService.login(loginRequest);
        dio.options.headers['Authorization'] = 'Bearer ${loginResponse.token}';
        final tripCreateRequest = TripCreateRequest(
          pickUpPoint: PointCreateRequest(
            latitude: 123.123,
            longitude: 123.123,
            name: 'testname',
          ),
          startedAt: DateTime.now().toUtc(),
          status: 'PENDING',
          finishedAt: DateTime.now().add(Duration(minutes: 10)).toUtc(),
        );

        // Act
        final tripResponse = await apiService.createTrip(tripCreateRequest);

        // Assert
        expect(tripResponse, isA<HttpResponse>());
        expect(tripResponse.response.statusCode, 201);
      }, skip: false);

      /* 
        @POST('/PaymentTransaction')
  Future<HttpResponse> createPaymentTransaction(
      @Body() PaymentTransactionCreate paymentTransactionCreate);

  @GET("Bus/getActiveBuses")
  Future<List<Bus>> getActiveBuses();

  @GET("PredefinedStops/{id}")
  Future<PredefinedStops> getPredefinedStop(@Path("id") int id);
  */

      // test('createPaymentTransaction should return HttpResponse', () async {
      //   // Arrange
      //   final loginRequest = LoginRequest(
      //     email: 'aboodsaob1139@gmail.com',
      //     password: 'password',
      //   );

      //   final loginResponse = await apiService.login(loginRequest);
      //   dio.options.headers['Authorization'] = 'Bearer ${loginResponse.token}';
      //   final paymentTransactionCreate = PaymentTransactionCreate(
      //     busId: 1,
      //     driverId: 1,
      //     routeId: 1,
      //     tripId: 1,
      //     amount: 1000,
      //     passengerId: loginResponse.passengerDto.id,
      //   );

      //   // Act
      //   final paymentTransactionResponse =
      //       await apiService.createPaymentTransaction(paymentTransactionCreate);

      //   // Assert
      //   expect(paymentTransactionResponse, isA<HttpResponse>());
      //   expect(paymentTransactionResponse.response.statusCode, 200);
      // }, skip: true);

      test('getActiveBuses should return List<Bus>', () async {
        // Arrange
        final loginRequest = LoginRequest(
          email: 'aboodsaob1139@gmail.com',
          password: 'password',
        );

        final loginResponse = await apiService.login(loginRequest);
        dio.options.headers['Authorization'] = 'Bearer ${loginResponse.token}';

        // Act
        final activeBusesResponse = await apiService.getActiveBuses();

        // Assert
        expect(activeBusesResponse, isA<List<Bus>>());
      });

      test('getPredefinedStop should return PredefinedStops', () async {
        // Arrange
        const predefinedStopsId = 1;

        // Act
        final predefinedStopsResponse =
            await apiService.getPredefinedStop(predefinedStopsId);

        // Assert
        expect(predefinedStopsResponse, isA<PredefinedStops>());
      });
    },
  );
}
