import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/data/models/bus_route.dart';
import 'package:jbus_app/screens/view_routes/view-route.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:jbus_app/widgets/others/app_bar_title_logo.dart';

class SelectRoutePage extends StatefulWidget {
  const SelectRoutePage({super.key});

  @override
  State<SelectRoutePage> createState() => _SelectRoutePageState();
}

class _SelectRoutePageState extends State<SelectRoutePage> {
  Timer? _debounce;
  final TextEditingController _textEditingController = TextEditingController();
  Iterable<BusRoute> sRoutes = [];
  List<BusRoute> allRoutes = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchRoutes();
  }

  Future<void> fetchRoutes() async {
    try {
      List<BusRoute> routes = await sl<ApiService>().getRoutes();
      setState(() {
        allRoutes = routes;
        sRoutes = allRoutes;
      });
    } catch (error) {
      // ignore: avoid_print
      print("Error fetching routes: $error");
    }
  }

  void _onSearchTextChanged(String text) {
    if (_debounce != null && _debounce!.isActive) {
      _debounce!.cancel();
    }

    _debounce = Timer(const Duration(milliseconds: 50), () {
      setState(() {
        sRoutes = allRoutes.where((element) =>
            element.startingPoint.name!
                .toLowerCase()
                .contains(text.toLowerCase()) ||
            element.endingPoint.name!
                .toLowerCase()
                .contains(text.toLowerCase()));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const JbusAppBarTitle(),
      ),
      body: Column(
        children: [
          InkWell(
            child: ListTile(
              title: TextField(
                decoration: const InputDecoration(
                  hintText: "search",
                  contentPadding: EdgeInsets.all(12.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: _onSearchTextChanged,
                controller: _textEditingController,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01173709,
          ),
          Expanded(
            child: sRoutes.isNotEmpty
                ? ListView.builder(
                    controller: ScrollController(),
                    itemCount: allRoutes.length,
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                    itemBuilder: (context, index) {
                      BusRoute route = sRoutes.elementAt(index);
                      String? firstStop = route.startingPoint.name;
                      String? finalStop = route.endingPoint.name;
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height *
                                0.02347418),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ViewSelectedRoutePage(route: route)));
                          },
                          child: Container(
                            height:
                                MediaQuery.of(context).size.height * 0.17605634,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 236, 236, 236),
                                shape: BoxShape.rectangle,
                                boxShadow: [
                                  BoxShadow(
                                      color: ourLightGray,
                                      offset: Offset(2, 4),
                                      blurRadius: 5)
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      firstStop ?? 'N/A',
                                      style:  TextStyle(
                                          color: ourBlue,
                                          fontWeight: FontWeight.w400,
                                          fontSize: MediaQuery.of(context).size.height * 0.02347418),
                                    ),
                                     SizedBox(
                                      width: MediaQuery.of(context).size.height * 0.01760563,
                                    ),
                                    const Icon(
                                      Icons.linear_scale_outlined,
                                      color: ourOrange,
                                    ),
                                     SizedBox(
                                      width: MediaQuery.of(context).size.height * 0.01760563,
                                    ),
                                    Text(
                                      finalStop ?? 'N/A',
                                      style:  TextStyle(
                                          color: ourBlue,
                                          fontWeight: FontWeight.w400,
                                          fontSize: MediaQuery.of(context).size.height * 0.02347418),
                                    ),
                                  ],
                                ),
                                 SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.01760563,
                                ),
                                Text(
                                  'Fee: ${route.fee}',
                                  style:  TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: MediaQuery.of(context).size.height * 0.01877934),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : const Center(
                    child: Text('No routes found.'),
                  ),
          ),
        ],
      ),
    );
  }
}
