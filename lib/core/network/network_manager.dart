import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../components/snackbar/app_snackbar.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  // Initialize the network manager and set up a stream to continually check the connection status.
  @override
  void onInit() {
    super.onInit();
    isConnected();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((event) {
      if (event is ConnectivityResult) {
        _updateConnectionStatus(event as ConnectivityResult);
      } else
        for (var result in event) {
          _updateConnectionStatus(result);
        }
    });
  }

  // Update the connection status based on changes in connectivity and show a relevant popup for no internet connection.
  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus.value = result;
    if (_connectionStatus.value == ConnectivityResult.none) {
      AppSnackBar.customToast(message: "You are currently offline.");
    }
  }

  // Check the internet connection status
  // Return 'true' if connected, 'false' otherwise
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.none) {
        AppSnackBar.customToast(message: "You are currently offline.");
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }

  // Dispose or close the native connectivity status
  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
