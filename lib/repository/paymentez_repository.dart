import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:paymentez_mobile/config/bloc.dart';
import 'package:paymentez_mobile/utils/repository_utils.dart';

import 'model/card_bin_model.dart';
import 'model/card_model.dart';
import 'model/user.dart';

class PaymentezRepository {
  final ConfigState _configState;
  final Dio _dio;

  PaymentezRepository({ConfigState configState})
      : _configState = configState ?? DevModeState('', ''),
        _dio = Dio() {
    _dio.options.baseUrl = configState.baseUrl;
    _dio.options.connectTimeout = 30 * 1000;
    _dio.options.receiveTimeout = 30 * 1000;
    _dio.options.headers = {
      "Content-Type": "application/json",
      "Auth-Token": RepositoryUtils.getAuthToken(
          configState.clientAppCode, configState.clientAppKey)
    };
  }

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

  Future<CardBinModel> getCardBin({@required String bin}) async {
    try {
      print('${_configState.baseUrl}/v2/card_bin/$bin');
      Response response = await _dio.get('/v2/card_bin/$bin');
      print(response);
      return CardBinModel.fromJson(response.data);
    } catch (e) {
      print(e);
      return CardBinModel.fromJson({});
    }
  }
}
