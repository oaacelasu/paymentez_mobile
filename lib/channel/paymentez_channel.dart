import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Paymentez {
  static const MethodChannel _channel = const MethodChannel('paymentez');
  static Paymentez _instance = new Paymentez();

  /// Returns the default (first initialized) instance of the Pushwoosh.
  static Paymentez get getInstance => _instance;


  Future<void> init() async =>
      _channel.setMethodCallHandler(_handleMethod);

  Future<dynamic> _handleMethod(MethodCall call) async {
    switch(call.method) {
      case "setEnvironment":
        debugPrint('setEnvironment: ${call.arguments}');
        return new Future.value("");
    }
  }
}
