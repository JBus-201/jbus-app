import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/data/models/passenger.dart';
import 'package:jbus_app/screens/wallet/wallet/widgets/buttons/charge_wallet_button.dart';
import 'package:jbus_app/screens/wallet/wallet/widgets/buttons/scratch_wallet_button.dart';
import 'package:jbus_app/screens/wallet/wallet/widgets/buttons/send_money_button.dart';
import 'package:jbus_app/services/service_locator.dart';

class NaveyWalletContainer extends StatefulWidget {
  const NaveyWalletContainer({
    super.key,
  });

  @override
  State<NaveyWalletContainer> createState() => _NaveyWalletContainerState();
}

class _NaveyWalletContainerState extends State<NaveyWalletContainer> {
  late Passenger user;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUser();
  }

  Future<void> fetchUser() async {
    final res = await sl<ApiService>().getPasssenger();
    setState(() {
      user = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ourNavey,
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Text(
            AppLocalizations.of(context)!.walletBalance,
            style: const TextStyle(color: ourWhite),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder<Passenger>(
                  future: sl<ApiService>().getPasssenger(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      user = snapshot.data!;
                      return Text(
                        '${user.wallet / 100} ',
                        style: const TextStyle(fontSize: 50, color: ourWhite),
                      );
                    }
                  }),
              Text(
                AppLocalizations.of(context)!.jod,
                style: const TextStyle(
                  fontSize: 36,
                  color: ourWhite,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ChargeWalletButton(),
              ScratchWalletButton(),
            ],
          ),
          const SendMonyButton(),
        ],
      ),
    );
  }
}
