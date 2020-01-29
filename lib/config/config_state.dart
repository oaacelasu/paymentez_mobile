import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ConfigState extends Equatable {
  const ConfigState(
      {@required this.clientAppCode, @required this.clientAppKey});

  final String baseUrl = '';
  final String clientAppCode;
  final String clientAppKey;

  @override
  List<Object> get props => [baseUrl, clientAppCode, clientAppKey];
}

class DevModeState extends ConfigState {
  const DevModeState(String clientAppCode, String clientAppKey)
      : super(clientAppCode: clientAppCode, clientAppKey: clientAppKey);

  @override
  String get baseUrl => 'https://ccapi-dev.paymentez.com';
}

class StgModeState extends ConfigState {
  const StgModeState(String clientAppCode, String clientAppKey)
      : super(clientAppCode: clientAppCode, clientAppKey: clientAppKey);

  @override
  String get baseUrl => 'https://ccapi-stg.paymentez.com';
}

class QaModeState extends ConfigState {
  const QaModeState(String clientAppCode, String clientAppKey)
      : super(clientAppCode: clientAppCode, clientAppKey: clientAppKey);

  @override
  String get baseUrl => 'https://ccapi-qa.paymentez.com';
}

class ProdModeState extends ConfigState {
  const ProdModeState(String clientAppCode, String clientAppKey)
      : super(clientAppCode: clientAppCode, clientAppKey: clientAppKey);

  @override
  String get baseUrl => 'https://ccapi.paymentez.com';
}
