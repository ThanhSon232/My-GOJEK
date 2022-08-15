import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_gojek_driver/app/data/user_response.dart';
import 'package:my_gojek_driver/app/modules/home/controllers/confirm_order.dart';
import 'package:my_gojek_driver/app/routes/app_pages.dart';

import '../../../data/Maps.dart';
import '../../../data/network_handler.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  var isActive = false.obs;
  var isLoading = false.obs;
  var isMapLoaded = false.obs;
  var isAccepted = false.obs;
  Maps map = Maps();
  var position = {}.obs;
  late GoogleMapController googleMapController;
  UserResponse? userResponse;
  OverlayEntry? overlayEntry;
  OverlayState? overlayState;
  StreamSubscription? listener;
  StreamSubscription? listener1;
  RxList<LatLng> polylinePoints = <LatLng>[].obs;
  List<PointLatLng> searchResult = [];
  final RxList<Polyline> polyline = <Polyline>[].obs;
  RxMap<MarkerId, Marker> markers = <MarkerId, Marker>{}.obs;
  var text = "bắt đầu".obs;

  void insertOverlay(
      {required BuildContext context, required UserResponse? userResponse}) {
    overlayState = Overlay.of(context);
    isAccepted.value = true;

    overlayEntry = OverlayEntry(builder: (context) {
      return OrderInformation(userResponse: userResponse!,
        onStart: (Timer? timer) {
          timer = Timer.periodic(const Duration(seconds: 5), (Timer t) async {
            position.value = await map.getCurrentPosition();
            await FirebaseDatabase.instance
                .ref(
                "MOTORBIKE/${userResponse?.startAddress!.latitude!.toStringAsFixed(2).replaceFirst(".", ",")}/${userResponse?.startAddress!.longitude!.toStringAsFixed(2).replaceFirst(".", ",")}/request/464/driver/15")
                .set({
              "position": {
                "lat": position["latitude"],
                "long": position["longitude"]
              }
            });
          });
        },
      );
    });

    overlayState!.insert(overlayEntry!);
  }

  Future<void> changeStatus(BuildContext context) async {
    isLoading.value = true;
    position.value = await map.getCurrentPosition();

    await FirebaseDatabase.instance
        .ref(
            "MOTORBIKE/${double.parse(position["latitude"].toString()).toStringAsFixed(2).replaceFirst(".", ",")}/${double.parse(position["longitude"].toString()).toStringAsFixed(2).replaceFirst(".", ",")}/driverList")
        .child("15")
        .set({
      "email": "thanhson232@gmail.com",
      "fullname": "thanh son",
      "vehicleType": "sirius",
      "position": {"lat": position["latitude"], "long": position["longitude"]}
    });

    listener = FirebaseDatabase.instance
        .ref(
            "MOTORBIKE/${double.parse(position["latitude"].toString()).toStringAsFixed(2).replaceFirst(".", ",")}/${double.parse(position["longitude"].toString()).toStringAsFixed(2).replaceFirst(".", ",")}/request")
        .limitToFirst(1)
        .onChildAdded
        .listen((event) async {
      if (event.snapshot.exists) {
        var data = event.snapshot.value as Map;
        var result = await Get.toNamed(Routes.REQUEST);
        if (result == "true") {
          userResponse = UserResponse.fromJson(data);
          markers[const MarkerId("1")] = Marker(
              markerId: const MarkerId("1"),
              infoWindow: const InfoWindow(title: "Start address"),
              position: LatLng(userResponse!.startAddress!.latitude!,
                  userResponse!.startAddress!.longitude!));

          markers[const MarkerId("2")] = Marker(
              markerId: const MarkerId("2"),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueBlue),
              infoWindow: const InfoWindow(title: "Destination"),
              position: LatLng(userResponse!.destination!.latitude!,
                  userResponse!.destination!.longitude!));
          await route(userResponse!.startAddress, userResponse!.destination);

          insertOverlay(context: context, userResponse: userResponse);
        }
      }
    });
    isLoading.value = false;
  }

  route(Destination? from, Destination? to) async {
    polylinePoints.clear();
    var start = "${from?.latitude},${from?.longitude}";
    var end = "${to?.latitude},${to?.longitude}";
    Map<String, String> query = {
      "key": "d2c643ad1e2975f1fa0d1719903704e8",
      "origin": start,
      "destination": end,
      "mode": "motorcycle"
    };
    var response = await NetworkHandler.getWithQuery('route', query);
    searchResult = PolylinePoints()
        .decodePolyline(response["result"]["routes"][0]["overviewPolyline"]);
    for (var point in searchResult) {
      polylinePoints.add(LatLng(point.latitude, point.longitude));
    }
    polyline.refresh();
  }

  Future<void> cancelStatus() async {
    isLoading.value = true;
    await FirebaseDatabase.instance
        .ref(
            "MOTORBIKE/${double.parse(position["latitude"].toString()).toStringAsFixed(2).replaceFirst(".", ",")}/${double.parse(position["longitude"].toString()).toStringAsFixed(2).replaceFirst(".", ",")}/driverList/15")
        .remove();
    listener!.cancel();
    isLoading.value = false;
  }

  @override
  void onInit() async {
    isLoading.value = true;
    isMapLoaded.value = true;
    await map.determinePosition();
    if (map.permission == LocationPermission.whileInUse ||
        map.permission == LocationPermission.always) {
      position.value = await map.getCurrentPosition();
    }
    isMapLoaded.value = false;
    polyline.add(Polyline(
      polylineId: const PolylineId('line1'),
      visible: true,
      points: polylinePoints,
      width: 5,
      color: Colors.blue,
    ));
    isLoading.value = false;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
