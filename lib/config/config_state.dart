import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ConfigState extends Equatable {
  const ConfigState(
      {@required this.clientAppCode, @required this.clientAppKey, this.isFlutterAppHost = false});

  final String baseUrl = '';
  final String clientAppCode;
  final String clientAppKey;
  final bool isFlutterAppHost;

  @override
  List<Object> get props => [baseUrl, clientAppCode, clientAppKey, isFlutterAppHost];
}

class DevModeState extends ConfigState {
  const DevModeState(String clientAppCode, String clientAppKey, bool isFlutterAppHost)
      : super(clientAppCode: clientAppCode, clientAppKey: clientAppKey, isFlutterAppHost:isFlutterAppHost);

  @override
  String get baseUrl => 'https://ccapi-dev.paymentez.com';
}

class StgModeState extends ConfigState {
  const StgModeState(String clientAppCode, String clientAppKey,  bool isFlutterAppHost)
      : super(clientAppCode: clientAppCode, clientAppKey: clientAppKey, isFlutterAppHost:isFlutterAppHost);

  @override
  String get baseUrl => 'https://ccapi-stg.paymentez.com';
}

class QaModeState extends ConfigState {
  const QaModeState(String clientAppCode, String clientAppKey,  bool isFlutterAppHost)
      : super(clientAppCode: clientAppCode, clientAppKey: clientAppKey, isFlutterAppHost:isFlutterAppHost);

  @override
  String get baseUrl => 'https://ccapi-qa.paymentez.com';
}

class ProdModeState extends ConfigState {
  const ProdModeState(String clientAppCode, String clientAppKey,  bool isFlutterAppHost)
      : super(clientAppCode: clientAppCode, clientAppKey: clientAppKey, isFlutterAppHost:isFlutterAppHost);

  @override
  String get baseUrl => 'https://ccapi.paymentez.com';
}
