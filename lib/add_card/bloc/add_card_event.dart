import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:paymentez_mobile/repository/model/card_model.dart';

abstract class AddCardEvent extends Equatable {
  const AddCardEvent(this.context);
  final BuildContext context;

  @override
  List<Object> get props => [context];
}

class NameChanged extends AddCardEvent {
  final String name;

  const NameChanged(BuildContext context, {@required this.name})
      : super(context);

  @override
  List<Object> get props => [name];

  @override
  String toString() => 'NameChanged { number :$name }';
}

class NumberChanged extends AddCardEvent {
  final String number;

  const NumberChanged(BuildContext context, {@required this.number})
      : super(context);

  @override
  List<Object> get props => [number];

  @override
  String toString() => 'NumberChanged { number :$number }';
}

class DateExpChanged extends AddCardEvent {
  final String dateExp;

  const DateExpChanged(BuildContext context, {@required this.dateExp})
      : super(context);

  @override
  List<Object> get props => [dateExp];

  @override
  String toString() => 'DateExpChanged { dateExp :$dateExp }';
}

class CvvChanged extends AddCardEvent {
  final String cvv;

  const CvvChanged(BuildContext context, {@required this.cvv}) : super(context);

  @override
  List<Object> get props => [cvv];

  @override
  String toString() => 'CvvChanged { cvv :$cvv }';
}

class FiscalNumberChanged extends AddCardEvent {
  final String fiscalNumber;

  const FiscalNumberChanged(BuildContext context, {@required this.fiscalNumber})
      : super(context);

  @override
  List<Object> get props => [fiscalNumber];

  @override
  String toString() => 'FiscalNumberChanged { fiscalNumber :$fiscalNumber }';
}

class TuyaCodeChanged extends AddCardEvent {
  final String tuyaCode;

  const TuyaCodeChanged(BuildContext context, {@required this.tuyaCode})
      : super(context);

  @override
  List<Object> get props => [tuyaCode];

  @override
  String toString() => 'TuyaCodeChanged { tuyaCode :$tuyaCode}';
}

class Submitted extends AddCardEvent {
  final CardModel card;

  const Submitted(
    BuildContext context, {
    @required this.card,
  }) : super(context);

  @override
  List<Object> get props => [card];

  @override
  String toString() {
    return 'Submitted { card: $card}';
  }
}
