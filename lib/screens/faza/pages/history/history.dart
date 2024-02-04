import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/data/models/fazaa.dart';
import 'package:jbus_app/screens/faza/widgets/view_faza.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FazaHistoryPage extends StatefulWidget {
  const FazaHistoryPage({super.key});

  @override
  State<FazaHistoryPage> createState() => _FazaHistoryPageState();
}

class _FazaHistoryPageState extends State<FazaHistoryPage> {
  late Future<List<Fazaa>> fazaHistoryList;
  late int myId;
  @override
  void initState() {
    super.initState();
    fazaHistoryList = sl<ApiService>().getFazaas();
    _loadUserData();
  }

  void _loadUserData() async {
    final userRes = sl<SharedPreferences>().getString('user');
    Map<String, dynamic> res = json.decode(userRes!);
    setState(() {
      myId = res['id'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<Fazaa>>(
            future: fazaHistoryList,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                print('Error: ${snapshot.error}');
                return Center(
                    child: Text(
                  AppLocalizations.of(context)!.somthingWrong,
                  textAlign: TextAlign.center,
                ));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                    child: Text(
                  AppLocalizations.of(context)!.noFaza,
                  textAlign: TextAlign.center,
                ));
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      Fazaa fazaa = snapshot.data![index];

                      return ListTile(
                        leading: Container(
                          height: MediaQuery.of(context).size.height * 0.058685,
                          width: MediaQuery.of(context).size.height * 0.058685,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: MediaQuery.of(context).size.height * 0.00058685)),
                          child: fazaa.inDebt.profileImage != null
                              ? Image.asset('${fazaa.inDebt.profileImage}')
                              : const Icon(Icons.person),
                        ),
                        title: Text(
                            '${fazaa.inDebt.id != myId ? fazaa.inDebt.user.name : AppLocalizations.of(context)!.you}'),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => FazaInfoViewDialog(
                                    myId: myId,
                                    fazaa: fazaa,
                                  ));
                        },
                        trailing: Text(
                          '${AppLocalizations.of(context)!.amount}: ${fazaa.amount}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: fazaa.paid ? ourGreen : ourRed,
                              fontSize:  MediaQuery.of(context).size.height * 0.01760563,
                              fontWeight: FontWeight.bold),
                        ),
                      );
                    });
              }
            }));
  }
}
