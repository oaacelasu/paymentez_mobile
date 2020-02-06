import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kount/flutter_kount.dart';
import 'package:paymentez_mobile/config/bloc.dart';
import 'package:paymentez_mobile/repository/model/card_bin_model.dart';
import 'package:paymentez_mobile/repository/model/card_model.dart';
import 'package:paymentez_mobile/repository/model/user.dart';
import 'package:paymentez_mobile/utils/repository_utils.dart';


class PaymentezRepository {
  final ConfigState _configState;
  final User _user;
  final Dio _dio;


  ConfigState get configState =>_configState;

  PaymentezRepository({ConfigState configState, User user})
      : _configState = configState ?? DevModeState('', '', false),
        _user = user,
        _dio = Dio() {
    _dio.options.baseUrl = configState.baseUrl;
    _dio.options.connectTimeout = 30 * 1000;
    _dio.options.receiveTimeout = 30 * 1000;
    _dio.interceptors
        .add(LogInterceptor(requestBody: true, responseBody: true)); //开启请求日志
    _dio.options.headers = {
      "Content-Type": "application/json",
      "Auth-Token": RepositoryUtils.getAuthToken(
          configState.clientAppCode, configState.clientAppKey)
    };
  }

  Future<Response> createToken(BuildContext context,
      {@required String sessionId, @required CardModel card}) async {
      print('${_configState.baseUrl}/v2/card/add');

      Response response = await _dio.post('/v2/card/add', data: {
        "session_id": await FlutterKount.sessionId,
        "card": card.toJson(),
        "user": _user.toJson(),
      });

      return response;

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
