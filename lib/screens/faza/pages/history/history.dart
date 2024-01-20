import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/data/models/fazaa.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:jbus_app/widgets/others/friendView.dart';

class FazaHistoryPage extends StatefulWidget {
  const FazaHistoryPage({super.key});

  @override
  State<FazaHistoryPage> createState() => _FazaHistoryPageState();
}

class _FazaHistoryPageState extends State<FazaHistoryPage> {
  late Future<List<Fazaa>> fazaHistoryList;

  @override
  void initState() {
    super.initState();
    fazaHistoryList = sl<ApiService>().getFazaas();
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
                return const Center(
                    child: Text(
                  'Somthing went wrong while geting your data',
                  textAlign: TextAlign.center,
                ));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('There is no faza\'s'));
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      Fazaa fazaa = snapshot.data![index];

                      return ListTile(
                        leading: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 0.5)),
                          child: fazaa.inDebt.profileImage != null
                              ? Image.asset('${fazaa.inDebt.profileImage}')
                              : const Icon(Icons.person),
                        ),
                        title: Text('${fazaa.inDebt.user.name}'),
                        // onTap: () {
                        //   showDialog(
                        //       context: context,
                        //       builder: (context) => FriendViewDialog(
                        //             id: fazaa.inDebt.id,
                        //             name: fazaa.inDebt.user.name,
                        //             profileImage: fazaa.inDebt.profileImage,
                        //           ));
                        // },
                        trailing: Text(
                          'Amount: ${fazaa.amount}',
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: fazaa.paid ? ourGreen : ourRed,fontSize: 15,fontWeight: FontWeight.bold),
                        ),
                        // subtitle:
                        //     Text('${friend.passenger.user.name ?? 'N/A'}'),
                      );
                    });
              }
            }));
  }
}
