import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jbus_app/data/api/api_service.dart';
import 'package:jbus_app/data/models/bus_route.dart';
import 'package:jbus_app/data/models/favorite_point_create_request.dart';
import 'package:jbus_app/services/service_locator.dart';
import 'package:jbus_app/themes/appbar_style.dart';
import 'package:jbus_app/widgets/others/app_bar_title_logo.dart';

class AddFavoriteScreen extends StatefulWidget {
  const AddFavoriteScreen({super.key});

  @override
  State<AddFavoriteScreen> createState() => _AddFavoriteScreenState();
}

class _AddFavoriteScreenState extends State<AddFavoriteScreen> {
  final TextEditingController _nameController = TextEditingController();
  bool loading = false;

  LatLng? point;

  final _formKey = GlobalKey<FormState>();

  int? routeId;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (routeId == null) {
        showModalBottomSheet(
          isDismissible: false,
          context: context,
          builder: (context) {
            return SingleChildScrollView(
              child: FutureBuilder<List<BusRoute>>(
                future: sl<ApiService>().getRoutes(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }

                  if (snapshot.hasData) {
                    if (snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text('No routes found'),
                      );
                    }

                    return Column(
                      children: snapshot.data!.map((route) {
                        return ListTile(
                          title: Text(route.name ??
                              '${route.startingPoint.name} - ${route.endingPoint.name}'),
                          onTap: () {
                            setState(() {
                              routeId = route.id;
                            });
                            Navigator.pop(context);
                          },
                        );
                      }).toList(),
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            );
          },
        );
      }
    });
  }

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
        body: loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition:
                        const CameraPosition(target: LatLng(0, 0)),
                    markers: {
                      if (point != null)
                        Marker(
                          markerId: const MarkerId('point'),
                          position: point!,
                        ),
                    },
                    onTap: (latLng) {
                      setState(() {
                        point = latLng;
                      });
                    },
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Form(
                            key: _formKey,
                            child: TextFormField(
                              controller: _nameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a name';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                hintText: 'Enter Name',
                                border: UnderlineInputBorder(),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          ElevatedButton(
                            onPressed: point == null
                                ? null
                                : () async {
                                    if (!_formKey.currentState!.validate()) {
                                      return;
                                    }

                                    setState(() {
                                      loading = true;
                                    });

                                    FavoritePointCreateRequest request =
                                        FavoritePointCreateRequest(
                                      name: _nameController.text,
                                      lat: point!.latitude,
                                      long: point!.longitude,
                                      routeId: routeId!,
                                    );

                                    await sl<ApiService>()
                                        .addFavoritePoint(request);
                                    if (mounted) {
                                      Navigator.pop(context);
                                    }
                                  },
                            child: const Text('Save'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ));
  }
}
