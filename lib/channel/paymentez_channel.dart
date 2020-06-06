import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymentez_mobile/config/bloc.dart';
import 'package:paymentez_mobile/repository/model/card_model.dart';
import 'package:paymentez_mobile/repository/model/error_model.dart';

class Paymentez {
  static const MethodChannel _channel = const MethodChannel('paymentez');
  static const MethodChannel _kountChannel = const MethodChannel('kount');

  static Paymentez _instance = new Paymentez();

  static Paymentez get getInstance => _instance;
  ConfigBloc _configBloc;

  Future<void> init(BuildContext context) async =>
      _channel.setMethodCallHandler((call) => _handleMethod(call, context));

  Future<void> deliverAddCardResponse(
      BuildContext context, dynamic response) async {
    if (response is CardModel) {
      _channel.invokeMethod("onAddCardSuccess", response.toJson());
    } else if (response is ErrorModel) {
      _channel.invokeMethod("onAddCardFail", response.toJson());
    }
  }

  Future<void> pop(BuildContext context) async {
    _channel.invokeMethod("pop");
  }

  Future<String> getSessionId(BuildContext context, bool testMode) async =>
      kIsWeb
          ? _getSessionIdForWeb(testMode)
          : _kountChannel.invokeMethod(
              "getSessionId", <String, dynamic>{"test_mode": testMode});

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

  Future<String> _getSessionIdForWeb(bool testMode) {
    return Future.value('');
  }
}
