import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

part 'qr_screen_state.dart';

class QrScreenCubit extends Cubit<QrScreenState> {
  QrScreenCubit() : super(QrScreenInitial());

  GlobalKey qrKey = GlobalKey();
  QRViewController? controller;
  ApiService apiService = sl<ApiService>();
  bool scanned = false;

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      if (scanned) {
        return;
      }
      scanned = true;
      controller.pauseCamera();
      emit(QrScreenLoading());
      try {
        final res =
          await apiService.scanQrCode({"encryptedData": scanData.code!});

      if (res.response.statusCode == 200) {
        emit(QrScreenSuccess(res.response.data));
      } else {
        emit(QrScreenFailure(res.response.data));
      }
      } catch (e) {
        emit(const QrScreenFailure("Saob Error"));
      }
    });
  }
}
