import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/screens/qr_screen/cubit/qr_screen_cubit.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScreen extends StatelessWidget {
  const QrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) => QrScreenCubit(),
      child: BlocConsumer<QrScreenCubit, QrScreenState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.watch<QrScreenCubit>();
          return Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(
                    top: 50, left: 20, right: 20, bottom: 70),
                child: QRView(
                  key: cubit.qrKey,
                  onQRViewCreated: cubit.onQRViewCreated,
                  cameraFacing: CameraFacing.back,
                ),
              )
            ],
          );
        },
      ),
    ));
  }
}
