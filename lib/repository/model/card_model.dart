import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class CardModel extends Equatable {
  final String bin;
  final String status;
  final String token;
  final String message;
  final String expiryYear;
  final String expiryMonth;
  final String transactionReference;
  final String type;
  final String number;
  final String origin;
  final String holderName;
  final String cvc;

  CardModel({
    @required String bin,
    @required String status,
    @required String token,
    @required String message,
    @required String expiryYear,
    @required String expiryMonth,
    @required String transactionReference,
    @required String type,
    @required String number,
    @required String origin,
    @required String holderName,
    @required String cvc,
  })  : bin = bin,
        status = status,
        token = token,
        message = message,
        expiryYear = expiryYear,
        expiryMonth = expiryMonth,
        transactionReference = transactionReference,
        type = type,
        number = number,
        origin = origin,
        holderName = holderName,
        cvc = cvc;

  CardModel copyWith(
          {String bin,
          String status,
          String token,
          String message,
          String expiryYear,
          String expiryMonth,
          String transactionReference,
          String type,
          String number,
          String origin,
          String holderName,
          String cvc}) =>
      CardModel(
        bin: bin ?? this.bin,
        status: status ?? this.status,
        token: token ?? this.token,
        message: message ?? this.message,
        expiryYear: expiryYear ?? this.expiryYear,
        expiryMonth: expiryMonth ?? this.expiryMonth,
        transactionReference: transactionReference ?? this.transactionReference,
        type: type ?? this.type,
        number: number ?? this.number,
        origin: origin ?? this.origin,
        holderName: holderName ?? this.holderName,
        cvc: cvc ?? this.cvc,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'bin': this.bin,
        'status': this.status,
        'token': this.token,
        'message': this.message,
        'expiry_year': this.expiryYear,
        'expiry_month': this.expiryMonth,
        'transaction_reference': this.transactionReference,
        'type': this.type,
        'number': this.number,
        'origin': this.origin,
        'holder_name': this.holderName,
        'cvc': this.cvc,
      };

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
      bin: json['bin'],
      status: json['status'],
      token: json['token'],
      message: json['message'],
      expiryYear: json['expiry_year'],
      expiryMonth: json['expiry_month'],
      transactionReference: json['transaction_reference'],
      type: json['type'],
      number: json['number'],
      origin: json['origin'],
      holderName: json['holder_name'],
      cvc: json['cvc']);

  @override
  String toString() {
    return 'CardModel{bin : $bin,status: $status, token: $token, message: $message, expiryYear: $expiryYear, expiryMonth: $expiryMonth, transactionReference: $transactionReference, type: $type, number: $number, origin: $origin, holderName: $holderName, cvc: $cvc}';
  }

  @override
  List<Object> get props => [
        bin,
        status,
        token,
        message,
        expiryYear,
        expiryMonth,
        transactionReference,
        type,
        number,
        origin,
        holderName,
        cvc
      ];
}
