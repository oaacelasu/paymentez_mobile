// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

class S {
  S(this.localeName);
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return S(localeName);
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  final String localeName;

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
      'Card Holder\'s Name',
      name: 'add_card_name_label',
      desc: '',
      args: [],
    );
  }

  String get add_card_invalid_name {
    return Intl.message(
      'Your card holder\'s name is invalid.',
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
      'Card number',
      name: 'add_card_number_label',
      desc: '',
      args: [],
    );
  }

  String get add_card_invalid_number {
    return Intl.message(
      'Your card\'s number is invalid.',
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
      'Expiration date',
      name: 'add_card_expiration_date_label',
      desc: '',
      args: [],
    );
  }

  String get add_card_empty_expiration_date {
    return Intl.message(
      'Please enter your card\'s expiration date',
      name: 'add_card_empty_expiration_date',
      desc: '',
      args: [],
    );
  }

  String get add_card_invalid_expiration_month {
    return Intl.message(
      'Your card\'s expiration month is invalid.',
      name: 'add_card_invalid_expiration_month',
      desc: '',
      args: [],
    );
  }

  String get add_card_invalid_expiration_year {
    return Intl.message(
      'Your card\'s expiration year is invalid.',
      name: 'add_card_invalid_expiration_year',
      desc: '',
      args: [],
    );
  }

  String get add_card_invalid_expiration_date {
    return Intl.message(
      'Your card\'s expiration date is invalid.',
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
      'Your card\'s security code is invalid.',
      name: 'add_card_invalid_cvc',
      desc: '',
      args: [],
    );
  }

  String get add_card_fiscal_number_label {
    return Intl.message(
      'Fiscal number',
      name: 'add_card_fiscal_number_label',
      desc: '',
      args: [],
    );
  }

  String get add_card_invalid_fiscal_number {
    return Intl.message(
      'Your fiscal number is invalid.',
      name: 'add_card_invalid_fiscal_number',
      desc: '',
      args: [],
    );
  }

  String get add_card_tuya_code_label {
    return Intl.message(
      'Tuya password',
      name: 'add_card_tuya_code_label',
      desc: '',
      args: [],
    );
  }

  String get add_card_invalid_tuya_code {
    return Intl.message(
      'Invalid password',
      name: 'add_card_invalid_tuya_code',
      desc: '',
      args: [],
    );
  }

  String get add_card_camera_instructions {
    return Intl.message(
      'Locate the front of your card\ninside the guides and wait while\nthe camera capture the photo',
      name: 'add_card_camera_instructions',
      desc: '',
      args: [],
    );
  }

  String get loading_lbl {
    return Intl.message(
      'Loading...',
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
      Locale('es', ''), Locale('pt', ''), Locale('en', ''),
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
      for (Locale supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}