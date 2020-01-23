import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:paymentez_mobile/repository/test_mode.dart';

import 'model/card_model.dart';
import 'model/user.dart';

class PaymentezRepository {
  final TestMode _testMode;

  PaymentezRepository({TestMode testMode})
      : _testMode = testMode ?? DevMode('', '');

  Future<void> createToken(
      {@required String sessionId,
      @required User user,
      @required CardModel card}) async {
    try {
      Response response = await Dio().get(_testMode.baseUrl);
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
