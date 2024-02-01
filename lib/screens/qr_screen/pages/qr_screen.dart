import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/screens/qr_screen/cubit/qr_screen_cubit.dart';
import 'package:jbus_app/themes/appbar_style.dart';
import 'package:jbus_app/widgets/others/app_bar_title_logo.dart';
import 'package:jbus_app/widgets/warnings/warning.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QrScreen extends StatelessWidget {
  const QrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(115.0),
          child: AppBar(
            automaticallyImplyLeading: true,
            elevation: 0,
            backgroundColor: Colors.black.withOpacity(0),
            title: const JbusAppBarTitle(),
            flexibleSpace: const AppBarStyle(),
          ),
        ),
        body: BlocProvider(
          create: (context) => QrScreenCubit(),
          child: BlocConsumer<QrScreenCubit, QrScreenState>(
            listener: (context, state) {
              if (state is QrScreenSuccess) {
                Navigator.pop(context,true);
              }
              if (state is QrScreenFailure) {
                context.read<QrScreenCubit>().controller!.resumeCamera();
                showDialog(
                    context: context,
                    builder: (context) => Warning(
                        title: AppLocalizations.of(context)!.ops,
                        description:
                            AppLocalizations.of(context)!.somthingWrong));
              }
            },
            builder: (context, state) {
              final cubit = context.watch<QrScreenCubit>();
              return Stack(
                children: [
                  Container(
                    child: QRView(
                      key: cubit.qrKey,
                      onQRViewCreated: cubit.onQRViewCreated,
                      cameraFacing: CameraFacing.back,
                      overlay: QrScannerOverlayShape(
                        borderColor: ourOrange,
                        borderLength: 50,
                        borderRadius: 15,
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ));
  }

}
