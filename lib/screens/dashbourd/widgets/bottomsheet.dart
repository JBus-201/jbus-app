import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/data/models/bus_route.dart';
import 'package:jbus_app/screens/trip/tripSettup.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:jbus_app/widgets/warnings/needFaza.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomSearchSheet extends StatefulWidget {
  const BottomSearchSheet({super.key});

  @override
  State<BottomSearchSheet> createState() => _BottomSearchSheetState();
}

class _BottomSearchSheetState extends State<BottomSearchSheet>
    with TickerProviderStateMixin {
  final double min = 0.2;
  final double max = 0.8;

  double _dragSheetPosition = 0.21;
  void _handleDragUpdate(DragUpdateDetails details) {
    setState(() {
      _dragSheetPosition -=
          details.primaryDelta! / MediaQuery.of(context).size.height;
      _dragSheetPosition = _dragSheetPosition.clamp(min, max);
    });
  }

  void _handleDragEnd(DragEndDetails details) {
    setState(() {
      _dragSheetPosition =
          (_dragSheetPosition - max).abs() <= (_dragSheetPosition - min).abs()
              ? max
              : min;
    });
  }

  final DraggableScrollableController _draggableScrollableController =
      DraggableScrollableController();

  List<BusRoute> allRoutes = [];
  late int wallet = 0;
  Timer? _debounce;
  final TextEditingController _textEditingController = TextEditingController();
  Iterable<BusRoute> sRoutes = [];
  @override
  void initState() {
    super.initState();
    // Call the API and assign the data to allRoutes when the widget initializes
    fetchRoutes();
    // fetchWallet();
  }

  Future<void> fetchRoutes() async {
    try {
      List<BusRoute> routes = await sl<ApiService>().getRoutes();
      setState(() {
        allRoutes = routes;
        sRoutes = allRoutes;
      });
    } catch (error) {
      // Handle error
      print("Error fetching routes: $error");
    }
  }

  Future<void> fetchWallet() async {
    final userRes = sl<SharedPreferences>().getString('user');
    Map<String, dynamic> res = json.decode(userRes!);
    setState(() {
      wallet = res['wallet'];
    });
  }

  void _onSearchTextChanged(String text) {
    if (_debounce != null && _debounce!.isActive) {
      _debounce!.cancel();
    }

    _debounce = Timer(const Duration(milliseconds: 50), () {
      setState(() {
        sRoutes = allRoutes.where(
          (element) => element.name!.toLowerCase().contains(text.toLowerCase()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: _handleDragUpdate,
      onVerticalDragEnd: _handleDragEnd,
      child: DraggableScrollableSheet(
        initialChildSize: _dragSheetPosition,
        minChildSize: min,
        maxChildSize: max,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(4, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 32,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color(0xff79747e),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: expand,
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
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: sRoutes.isNotEmpty
                      ? ListView.builder(
                          controller: scrollController,
                          itemCount: allRoutes.length,
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                          itemBuilder: (context, index) {
                            BusRoute route = sRoutes.elementAt(index);
                            int? indxOfDash = route.name?.indexOf('-');
                            String? firstStop =
                                route.name?.substring(0, indxOfDash);
                            String? finalStop =
                                route.name?.substring(indxOfDash! + 1);
                            return GestureDetector(
                              onTap: () {
                                if (wallet < route.fee) {
                                  showDialog(
                                      context: context,
                                      builder: (context) => NeedFazaDialog(
                                            title: 'Obs!',
                                            description:
                                                'You don\'t have mony\nDo you need Faza?',
                                            amount: route.fee - wallet,
                                            route: route,
                                          ));
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TripSettup(route: route)));
                                }
                              },
                              child: Container(
                                height: 100,
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          firstStop ?? 'N/A',
                                          style:
                                              const TextStyle(color: ourBlue),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        const Icon(
                                          Icons.linear_scale_outlined,
                                          color: ourOrange,
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Text(
                                          finalStop ?? 'N/A',
                                          style:
                                              const TextStyle(color: ourBlue),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'Fee: ${route.fee}',
                                      style: TextStyle(
                                        color: wallet >= route.fee
                                            ? ourGreen
                                            : ourRed,
                                      ),
                                    )
                                  ],
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
        },
      ),
    );
  }

  void expand() {
    _draggableScrollableController.animateTo(max,
        duration: const Duration(milliseconds: 10), curve: Curves.linear);
  }
}
