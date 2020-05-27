// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

class S {
  S();
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return S();
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  String get app_name {
    return Intl.message(
      'Paymentez SDK',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  String get add_card_name_hint {
    return Intl.message(
      'Jhon Doe',
      name: 'add_card_name_hint',
      desc: '',
      args: [],
    );
  }

  String get add_card_name_label {
    return Intl.message(
      'Nombre del titular',
      name: 'add_card_name_label',
      desc: '',
      args: [],
    );
  }

  String get add_card_invalid_name {
    return Intl.message(
      'El Nombre del titular de la tarjeta no es válido.',
      name: 'add_card_invalid_name',
      desc: '',
      args: [],
    );
  }

  String get add_card_number_hint {
    return Intl.message(
      '1234 1234 1234 1234',
      name: 'add_card_number_hint',
      desc: '',
      args: [],
    );
  }

  String get add_card_number_label {
    return Intl.message(
      'Número de tarjeta',
      name: 'add_card_number_label',
      desc: '',
      args: [],
    );
  }

  String get add_card_invalid_number {
    return Intl.message(
      'El número de tarjeta no es válido.',
      name: 'add_card_invalid_number',
      desc: '',
      args: [],
    );
  }

  String get add_card_expiration_date_hint {
    return Intl.message(
      'MM/YY',
      name: 'add_card_expiration_date_hint',
      desc: '',
      args: [],
    );
  }

  String get add_card_expiration_date_label {
    return Intl.message(
      'Fecha de vto.',
      name: 'add_card_expiration_date_label',
      desc: '',
      args: [],
    );
  }

  String get add_card_empty_expiration_date {
    return Intl.message(
      ' Por favor ingresa la fecha de vencimiento de la tarjeta',
      name: 'add_card_empty_expiration_date',
      desc: '',
      args: [],
    );
  }

  String get add_card_invalid_expiration_month {
    return Intl.message(
      'El mes de vencimiento de la tarjeta no es válido.',
      name: 'add_card_invalid_expiration_month',
      desc: '',
      args: [],
    );
  }

  String get add_card_invalid_expiration_year {
    return Intl.message(
      'El año de vencimiento de la tarjeta no es válido.',
      name: 'add_card_invalid_expiration_year',
      desc: '',
      args: [],
    );
  }

  String get add_card_invalid_expiration_date {
    return Intl.message(
      'La fecha de vencimiento de la tarjeta no es válido.',
      name: 'add_card_invalid_expiration_date',
      desc: '',
      args: [],
    );
  }

  String get add_card_cvc_hint {
    return Intl.message(
      '123',
      name: 'add_card_cvc_hint',
      desc: '',
      args: [],
    );
  }

  String get add_card_cvc_amex_hint {
    return Intl.message(
      '1234',
      name: 'add_card_cvc_amex_hint',
      desc: '',
      args: [],
    );
  }

  String get add_card_cvc_label {
    return Intl.message(
      'CVC',
      name: 'add_card_cvc_label',
      desc: '',
      args: [],
    );
  }

  String get add_card_cvc_amex_label {
    return Intl.message(
      'CVV',
      name: 'add_card_cvc_amex_label',
      desc: '',
      args: [],
    );
  }

  String get add_card_invalid_cvc {
    return Intl.message(
      'El código de seguridad de la tarjeta no es válido.',
      name: 'add_card_invalid_cvc',
      desc: '',
      args: [],
    );
  }

  String get add_card_fiscal_number_label {
    return Intl.message(
      'Documento de Identificación',
      name: 'add_card_fiscal_number_label',
      desc: '',
      args: [],
    );
  }

  String get add_card_invalid_fiscal_number {
    return Intl.message(
      'El documento de Identificación no es valido.',
      name: 'add_card_invalid_fiscal_number',
      desc: '',
      args: [],
    );
  }

  String get add_card_tuya_code_label {
    return Intl.message(
      'Clave Tuya',
      name: 'add_card_tuya_code_label',
      desc: '',
      args: [],
    );
  }

  String get add_card_invalid_tuya_code {
    return Intl.message(
      'Clave invalida.',
      name: 'add_card_invalid_tuya_code',
      desc: '',
      args: [],
    );
  }

  String get add_card_camera_instructions {
    return Intl.message(
      'Ubique el frente de su tarjeta\ndentro de las guías y espere mientras\nel sistema captura la foto',
      name: 'add_card_camera_instructions',
      desc: '',
      args: [],
    );
  }

  String get loading_lbl {
    return Intl.message(
      'Cargando...',
      name: 'loading_lbl',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'pt'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}