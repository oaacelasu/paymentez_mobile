import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

@immutable
class CardBinModel extends Equatable {
  final String carrier;
  final String urlLogoPng;
  final String urlLogo;
  final List<dynamic> installmentsOptions;
  final int cvvLength;
  final bool useLuhn;
  final String cardMask;
  final String cardType;
  final bool otp;

  CardBinModel({
    @required String carrier,
    @required String urlLogoPng,
    @required String urlLogo,
    @required List<dynamic> installmentsOptions,
    @required int cvvLength,
    @required bool useLuhn,
    @required String cardMask,
    @required String cardType,
    @required bool otp,
  })  : carrier = carrier,
        urlLogoPng = urlLogoPng,
        urlLogo = urlLogo,
        installmentsOptions = installmentsOptions,
        cvvLength = cvvLength,
        useLuhn = useLuhn,
        cardMask = cardMask,
        cardType = cardType,
        otp = otp;

  CardBinModel copyWith({
    String carrier,
    String urlLogoPng,
    String urlLogo,
    List<dynamic> installmentsOptions,
    int cvvLength,
    bool useLuhn,
    String cardMask,
    MaskTextInputFormatter numberMaskFormatter,
    String cardType,
    bool otp,
  }) =>
      CardBinModel(
          carrier: carrier ?? this.carrier,
          urlLogoPng: urlLogoPng ?? this.urlLogoPng,
          urlLogo: urlLogo ?? this.urlLogo,
          installmentsOptions: installmentsOptions ?? this.installmentsOptions,
          cvvLength: cvvLength ?? this.cvvLength,
          useLuhn: useLuhn ?? useLuhn,
          cardMask: cardMask ?? this.cardMask,
          cardType: cardType ?? this.cardType,
          otp: otp ?? this.otp);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'carrier': this.carrier,
        'url_logo_png': this.urlLogoPng,
        'url_logo': this.urlLogo,
        'installments_options': this.installmentsOptions,
        'cvv_length': this.cvvLength,
        'use_luhn': this.useLuhn,
        'card_mask': this.cardMask,
        'card_type': this.cardType,
        'otp': this.otp
      };

  factory CardBinModel.fromJson(Map<String, dynamic> json) => CardBinModel(
        carrier: json['carrier']?.toString() ?? '0',
        urlLogoPng: json['url_logo_png'] ?? '',
        urlLogo: json['url_logo'] ?? '',
        installmentsOptions: json['installments_options'] ?? [],
        cvvLength: json['cvv_length'] ?? 3,
        useLuhn: json['use_luhn'] ?? true,
        cardMask: json['card_mask'] ?? 'XXXX XXXX XXXX XXXX',
        cardType: json['card_type'] ?? '',
        otp: json['otp'] ?? true,
      );

  @override
  String toString() {
    return 'CardBinModel{carrier: $carrier, urlLogoPng: $urlLogoPng, urlLogo: $urlLogo, installmentsOptions: $installmentsOptions, cvvLength: $cvvLength, cardMask: $cardMask, cardType: $cardType, otp: $otp, use_luhn: $useLuhn}';
  }

  @override
  List<Object> get props => [
        carrier,
        urlLogoPng,
        urlLogo,
        installmentsOptions,
        cvvLength,
        useLuhn,
        cardMask,
        cardType,
        otp,
      ];
}
