import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jbus_app/constants/colors/colors.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/data/models/bus_route.dart';
import 'package:jbus_app/screens/view_routes/view-route.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:jbus_app/themes/bloc/theme_bloc.dart';
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

  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
      return Scaffold(
        appBar: AppBar(
          title: const JbusAppBarTitle(),
        ),
        body: Column(
          children: [
            InkWell(
              child: ListTile(
                textColor:
                    themeState.thememode == ThemeMode.dark ? ourWhite : ourGray,
                focusColor:
                    themeState.thememode == ThemeMode.dark ? ourWhite : ourGray,
                selectedColor:
                    themeState.thememode == ThemeMode.dark ? ourWhite : ourGray,
                title: TextField(
                  decoration: InputDecoration(
                    hintText: "search",
                    hintStyle: TextStyle(
                      color: themeState.thememode == ThemeMode.light
                          ? ourGray
                          : ourWhite,
                    ),
                    contentPadding: const EdgeInsets.all(12.0),
                    focusColor: themeState.thememode == ThemeMode.light
                        ? ourWhite
                        : ourGray,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: themeState.thememode == ThemeMode.dark
                            ? ourWhite
                            : ourGray,
                        width: 1.5, // Adjust the border width
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: themeState.thememode == ThemeMode.dark
                            ? ourWhite
                            : ourGray,
                        width: 0.5,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: themeState.thememode == ThemeMode.dark
                          ? ourWhite
                          : ourGray,
                    ),
                  ),
                  style: TextStyle(
                    color: themeState.thememode == ThemeMode.dark
                        ? ourWhite
                        : ourGray,
                  ),
                  cursorColor: themeState.thememode == ThemeMode.dark
                      ? ourOrange
                      : ourBlue,
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
                      controller: ScrollController(),
                      itemCount: allRoutes.length,
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                      itemBuilder: (context, index) {
                        if (index < 0 || index >= sRoutes.length) {
                          return Container(); // Or any other fallback UI
                        }
                        BusRoute route = sRoutes.elementAt(index);
                        String? firstStop = route.startingPoint.name;
                        String? finalStop = route.endingPoint.name;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ViewSelectedRoutePage(route: route)));
                            },
                            child: Container(
                              height: 150,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: themeState.thememode == ThemeMode.light
                                      ? ourVeryLightGray
                                      : ourDarkGray,
                                  shape: BoxShape.rectangle,
                                  boxShadow: const [
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        firstStop ?? 'N/A',
                                        style: TextStyle(
                                            color: themeState.thememode ==
                                                    ThemeMode.light
                                                ? ourBlue
                                                : ourWhite,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 20),
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
                                        style: TextStyle(
                                            color: themeState.thememode ==
                                                    ThemeMode.light
                                                ? ourBlue
                                                : ourWhite,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'Fee: ${route.fee}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 16),
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
    });
  }
}
