import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Paymentez {
  static const MethodChannel _channel = const MethodChannel('paymentez');

  factory Paymentez() => _instance;

  static Paymentez _instance = new Paymentez();

  Future<void> init({@required String appId}) async {
    await _channel.invokeMethod('init', <String, dynamic>{'appId': appId});
  }

  Future<void> logEvent({@required String name}) async {
    await _channel.invokeMethod('logEvent', <String, dynamic>{'name': name});
    _channel.setMethodCallHandler((call) {
      return printCall(call: call);
    });
  }

  Future<dynamic> printCall({@required MethodCall call}) async {
    print(call.arguments);
    return true;
  }
}
