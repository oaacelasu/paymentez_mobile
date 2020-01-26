import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymentez_mobile/config/bloc.dart';

class Paymentez {
  static const MethodChannel _channel = const MethodChannel('paymentez');
  static Paymentez _instance = new Paymentez();

  static Paymentez get getInstance => _instance;
  ConfigBloc _configBloc;

  Future<void> init(BuildContext context) async =>
      _channel.setMethodCallHandler((call) => _handleMethod(call, context));

  Future<dynamic> _handleMethod(MethodCall call, BuildContext context) async {
    _configBloc = BlocProvider.of<ConfigBloc>(context);
    debugPrint("${call.arguments}");
    switch (call.method) {
      case "setEnvironment":
        _configBloc.add(SetEnvironment(
            testMode: call.arguments['test_mode'] ?? '',
            paymentezClientAppCode:
                call.arguments['paymentez_client_app_code'] ?? '',
            paymentezClientAppKey:
                call.arguments['paymentez_client_app_key'] ?? ''));
        return new Future.value("");
    }
  }
}
