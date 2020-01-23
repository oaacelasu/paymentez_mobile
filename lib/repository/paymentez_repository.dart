import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:paymentez_mobile/config/bloc.dart';

import 'model/card_model.dart';
import 'model/user.dart';

class PaymentezRepository {
  final ConfigState _configState;

  PaymentezRepository({ConfigState configState})
      : _configState = configState ?? DevModeState('', '');

  Future<void> createToken(
      {@required String sessionId,
      @required User user,
      @required CardModel card}) async {
    try {
      Response response = await Dio().get(_configState.baseUrl);
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
