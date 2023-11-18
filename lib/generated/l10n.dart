// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get createAccount {
    return Intl.message(
      'Create account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get firstName {
    return Intl.message(
      'First name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get lastName {
    return Intl.message(
      'Last name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Mobile number`
  String get mobileNumber {
    return Intl.message(
      'Mobile number',
      name: 'mobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `(Optional)`
  String get optional {
    return Intl.message(
      '(Optional)',
      name: 'optional',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your first name`
  String get enterYourFirstName {
    return Intl.message(
      'Enter your first name',
      name: 'enterYourFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your last name`
  String get enterYourLastName {
    return Intl.message(
      'Enter your last name',
      name: 'enterYourLastName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get enterYourEmail {
    return Intl.message(
      'Enter your email',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get enterYourPhonNumber {
    return Intl.message(
      'Enter your phone number',
      name: 'enterYourPhonNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter a password`
  String get enterAPassword {
    return Intl.message(
      'Enter a password',
      name: 'enterAPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enterYourPassword {
    return Intl.message(
      'Enter your password',
      name: 'enterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Re enter your password`
  String get reEnterYourPassword {
    return Intl.message(
      'Re enter your password',
      name: 'reEnterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message(
      'Or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Create account using`
  String get createAccountUsing {
    return Intl.message(
      'Create account using',
      name: 'createAccountUsing',
      desc: '',
      args: [],
    );
  }

  /// `Sign in using`
  String get signInUsing {
    return Intl.message(
      'Sign in using',
      name: 'signInUsing',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the code sent to the email below`
  String get pleaseEnterTheCodeSentToTheEmailBelow {
    return Intl.message(
      'Please enter the code sent to the email below',
      name: 'pleaseEnterTheCodeSentToTheEmailBelow',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the code sent to the mobile number below`
  String get pleaseEnterTheCodeSentToTheMobileNumberBelow {
    return Intl.message(
      'Please enter the code sent to the mobile number below',
      name: 'pleaseEnterTheCodeSentToTheMobileNumberBelow',
      desc: '',
      args: [],
    );
  }

  /// `Choose a photo for your profile`
  String get chooseAPhotoForYourProfile {
    return Intl.message(
      'Choose a photo for your profile',
      name: 'chooseAPhotoForYourProfile',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get help {
    return Intl.message(
      'Help',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `عربي`
  String get arabic {
    return Intl.message(
      'عربي',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Light theme`
  String get lightTheme {
    return Intl.message(
      'Light theme',
      name: 'lightTheme',
      desc: '',
      args: [],
    );
  }

  /// `Dark theme`
  String get darkTheme {
    return Intl.message(
      'Dark theme',
      name: 'darkTheme',
      desc: '',
      args: [],
    );
  }

  /// `Jordan theme`
  String get jordanTheme {
    return Intl.message(
      'Jordan theme',
      name: 'jordanTheme',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, Please enter a password.`
  String get sorryPleaseEnterAPassword {
    return Intl.message(
      'Sorry, Please enter a password.',
      name: 'sorryPleaseEnterAPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, Please enter your first name.`
  String get sorryPleaseEnterYourFirstName {
    return Intl.message(
      'Sorry, Please enter your first name.',
      name: 'sorryPleaseEnterYourFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Previous trips`
  String get previousTrips {
    return Intl.message(
      'Previous trips',
      name: 'previousTrips',
      desc: '',
      args: [],
    );
  }

  /// `Map`
  String get map {
    return Intl.message(
      'Map',
      name: 'map',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Boarding time`
  String get boardingTime {
    return Intl.message(
      'Boarding time',
      name: 'boardingTime',
      desc: '',
      args: [],
    );
  }

  /// `Time to get off`
  String get timeToGetOff {
    return Intl.message(
      'Time to get off',
      name: 'timeToGetOff',
      desc: '',
      args: [],
    );
  }

  /// `Boarding point`
  String get boardingPoint {
    return Intl.message(
      'Boarding point',
      name: 'boardingPoint',
      desc: '',
      args: [],
    );
  }

  /// `Drop off point`
  String get dropOffPoint {
    return Intl.message(
      'Drop off point',
      name: 'dropOffPoint',
      desc: '',
      args: [],
    );
  }

  /// `You have no previous trips`
  String get youHaveNoPreviousTrips {
    return Intl.message(
      'You have no previous trips',
      name: 'youHaveNoPreviousTrips',
      desc: '',
      args: [],
    );
  }

  /// `Request a ride`
  String get requestARide {
    return Intl.message(
      'Request a ride',
      name: 'requestARide',
      desc: '',
      args: [],
    );
  }

  /// `Current balance`
  String get currentBalance {
    return Intl.message(
      'Current balance',
      name: 'currentBalance',
      desc: '',
      args: [],
    );
  }

  /// `JOD`
  String get jordanianDinar {
    return Intl.message(
      'JOD',
      name: 'jordanianDinar',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get favorite {
    return Intl.message(
      'Favorite',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `Roads and tracks`
  String get roadsAndTracks {
    return Intl.message(
      'Roads and tracks',
      name: 'roadsAndTracks',
      desc: '',
      args: [],
    );
  }

  /// `Wallet`
  String get wallet {
    return Intl.message(
      'Wallet',
      name: 'wallet',
      desc: '',
      args: [],
    );
  }

  /// `Manage account`
  String get manageAccount {
    return Intl.message(
      'Manage account',
      name: 'manageAccount',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logOut {
    return Intl.message(
      'Log out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to log out?`
  String get doYouWantToLogOut {
    return Intl.message(
      'Do you want to log out?',
      name: 'doYouWantToLogOut',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, please enter a valid name.`
  String get sorryPleaseEnterAValidName {
    return Intl.message(
      'Sorry, please enter a valid name.',
      name: 'sorryPleaseEnterAValidName',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, Please enter your last name.`
  String get sorryPleaseEnterYourLastName {
    return Intl.message(
      'Sorry, Please enter your last name.',
      name: 'sorryPleaseEnterYourLastName',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, please enter your email.`
  String get sorryPleaseEnterYourEmail {
    return Intl.message(
      'Sorry, please enter your email.',
      name: 'sorryPleaseEnterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, Please enter a valid email.`
  String get sorryPleaseEnterAValidEmail {
    return Intl.message(
      'Sorry, Please enter a valid email.',
      name: 'sorryPleaseEnterAValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, Please enter a valid number starts with 07`
  String get sorryPleaseEnterAValidNumberStartsWith07 {
    return Intl.message(
      'Sorry, Please enter a valid number starts with 07',
      name: 'sorryPleaseEnterAValidNumberStartsWith07',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, Please enter a valid password with at least 8 characters, including capital and small letters, and numbers.`
  String get sorryPleaseEnterAValidPassword {
    return Intl.message(
      'Sorry, Please enter a valid password with at least 8 characters, including capital and small letters, and numbers.',
      name: 'sorryPleaseEnterAValidPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, Please re enter your password.`
  String get sorryPleaseReEnterYourPassword {
    return Intl.message(
      'Sorry, Please re enter your password.',
      name: 'sorryPleaseReEnterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, password does not match.`
  String get sorryPasswordDoesNotMatch {
    return Intl.message(
      'Sorry, password does not match.',
      name: 'sorryPasswordDoesNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Please enter an email`
  String get pleaseEnterAnEmail {
    return Intl.message(
      'Please enter an email',
      name: 'pleaseEnterAnEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters`
  String get passwordMustBeAtLeast6Characters {
    return Intl.message(
      'Password must be at least 6 characters',
      name: 'passwordMustBeAtLeast6Characters',
      desc: '',
      args: [],
    );
  }

  /// `Choose photo`
  String get choosePhoto {
    return Intl.message(
      'Choose photo',
      name: 'choosePhoto',
      desc: '',
      args: [],
    );
  }

  /// `JBUS driver`
  String get jbusDriver {
    return Intl.message(
      'JBUS driver',
      name: 'jbusDriver',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while loading QR code!`
  String get anErrorOccurredWhileLoadingQRCode {
    return Intl.message(
      'An error occurred while loading QR code!',
      name: 'anErrorOccurredWhileLoadingQRCode',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get tryAgain {
    return Intl.message(
      'Try again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Routes`
  String get routes {
    return Intl.message(
      'Routes',
      name: 'routes',
      desc: '',
      args: [],
    );
  }

  /// `Go`
  String get go {
    return Intl.message(
      'Go',
      name: 'go',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Drop off request`
  String get dropOffRequest {
    return Intl.message(
      'Drop off request',
      name: 'dropOffRequest',
      desc: '',
      args: [],
    );
  }

  /// `User Authentication Demo`
  String get userAuthenticationDemo {
    return Intl.message(
      'User Authentication Demo',
      name: 'userAuthenticationDemo',
      desc: '',
      args: [],
    );
  }

  /// `Drawer`
  String get drawer {
    return Intl.message(
      'Drawer',
      name: 'drawer',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
