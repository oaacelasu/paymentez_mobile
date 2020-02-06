import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ConfigEvent extends Equatable {
  const ConfigEvent();
  @override
  List<Object> get props => [];
}

class SetEnvironment extends ConfigEvent {
  final String testMode;
  final String paymentezClientAppCode;
  final String paymentezClientAppKey;
  final bool isFlutterAppHost;

  const SetEnvironment(
      {@required this.testMode,
      @required this.paymentezClientAppCode, this.isFlutterAppHost = false,
      @required this.paymentezClientAppKey});

  @override
  List<Object> get props =>
      [testMode, paymentezClientAppCode, paymentezClientAppKey, isFlutterAppHost];

  @override
  String toString() =>
      'SetEnvironment { testMode :$testMode, paymentezClientAppCode: $paymentezClientAppCode,paymentezClientAppKey: $paymentezClientAppKey, isFlutterAppHost: $isFlutterAppHost}';
}
