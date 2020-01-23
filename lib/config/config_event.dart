import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ConfigEvent extends Equatable {
  const ConfigEvent();
  @override
  List<Object> get props => [];
}

class SetEnvironment extends ConfigEvent {

  final int testMode;
  final String paymentezClientAppCode;
  final String paymentezClientAppKey;


  const SetEnvironment({@required this.testMode, @required this.paymentezClientAppCode,@required this.paymentezClientAppKey});

  @override
  List<Object> get props => [testMode, paymentezClientAppCode, paymentezClientAppKey];

  @override
  String toString() => 'SetEnvironment { testMode :$testMode, paymentezClientAppCode: $paymentezClientAppCode, $paymentezClientAppKey}';

}
