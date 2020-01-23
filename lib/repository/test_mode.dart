import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class TestMode extends Equatable {
  const TestMode({@required this.clientAppCode, @required this.clientAppKey});

  final String baseUrl = '';
  final String clientAppCode;
  final String clientAppKey;

  @override
  List<Object> get props => [baseUrl];
}

class DevMode extends TestMode {
  const DevMode(String clientAppCode, String clientAppKey):super(clientAppCode:clientAppCode, clientAppKey:clientAppKey);

  @override
  String get baseUrl => 'https://ccapi-dev.paymentez.com';
}

class StgMode extends TestMode {
  const StgMode(String clientAppCode, String clientAppKey):super(clientAppCode:clientAppCode, clientAppKey:clientAppKey);

  @override
  String get baseUrl => 'https://ccapi-stg.paymentez.com';
}

class QaMode extends TestMode {
  const QaMode(String clientAppCode, String clientAppKey):super(clientAppCode:clientAppCode, clientAppKey:clientAppKey);

  @override
  String get baseUrl => 'https://ccapi-qa.paymentez.com';
}

class ProdMode extends TestMode {
  const ProdMode(String clientAppCode, String clientAppKey):super(clientAppCode:clientAppCode, clientAppKey:clientAppKey);

  @override
  String get baseUrl => 'https://ccapi.paymentez.com';
}
