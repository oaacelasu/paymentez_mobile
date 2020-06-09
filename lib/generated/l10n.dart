// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Paymentez SDK`
  String get app_name {
    return Intl.message(
      'Paymentez SDK',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Jhon Doe`
  String get add_card_name_hint {
    return Intl.message(
      'Jhon Doe',
      name: 'add_card_name_hint',
      desc: '',
      args: [],
    );
  }

  /// `Card Holder's Name`
  String get add_card_name_label {
    return Intl.message(
      'Card Holder\'s Name',
      name: 'add_card_name_label',
      desc: '',
      args: [],
    );
  }

  /// `Your card holder's name is invalid.`
  String get add_card_invalid_name {
    return Intl.message(
      'Your card holder\'s name is invalid.',
      name: 'add_card_invalid_name',
      desc: '',
      args: [],
    );
  }

  /// `1234 1234 1234 1234`
  String get add_card_number_hint {
    return Intl.message(
      '1234 1234 1234 1234',
      name: 'add_card_number_hint',
      desc: '',
      args: [],
    );
  }

  /// `Card number`
  String get add_card_number_label {
    return Intl.message(
      'Card number',
      name: 'add_card_number_label',
      desc: '',
      args: [],
    );
  }

  /// `Your card's number is invalid.`
  String get add_card_invalid_number {
    return Intl.message(
      'Your card\'s number is invalid.',
      name: 'add_card_invalid_number',
      desc: '',
      args: [],
    );
  }

  /// `MM/YY`
  String get add_card_expiration_date_hint {
    return Intl.message(
      'MM/YY',
      name: 'add_card_expiration_date_hint',
      desc: '',
      args: [],
    );
  }

  /// `Expiration date`
  String get add_card_expiration_date_label {
    return Intl.message(
      'Expiration date',
      name: 'add_card_expiration_date_label',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your card's expiration date`
  String get add_card_empty_expiration_date {
    return Intl.message(
      'Please enter your card\'s expiration date',
      name: 'add_card_empty_expiration_date',
      desc: '',
      args: [],
    );
  }

  /// `Your card's expiration month is invalid.`
  String get add_card_invalid_expiration_month {
    return Intl.message(
      'Your card\'s expiration month is invalid.',
      name: 'add_card_invalid_expiration_month',
      desc: '',
      args: [],
    );
  }

  /// `Your card's expiration year is invalid.`
  String get add_card_invalid_expiration_year {
    return Intl.message(
      'Your card\'s expiration year is invalid.',
      name: 'add_card_invalid_expiration_year',
      desc: '',
      args: [],
    );
  }

  /// `Your card's expiration date is invalid.`
  String get add_card_invalid_expiration_date {
    return Intl.message(
      'Your card\'s expiration date is invalid.',
      name: 'add_card_invalid_expiration_date',
      desc: '',
      args: [],
    );
  }

  /// `123`
  String get add_card_cvc_hint {
    return Intl.message(
      '123',
      name: 'add_card_cvc_hint',
      desc: '',
      args: [],
    );
  }

  /// `1234`
  String get add_card_cvc_amex_hint {
    return Intl.message(
      '1234',
      name: 'add_card_cvc_amex_hint',
      desc: '',
      args: [],
    );
  }

  /// `CVC`
  String get add_card_cvc_label {
    return Intl.message(
      'CVC',
      name: 'add_card_cvc_label',
      desc: '',
      args: [],
    );
  }

  /// `CVV`
  String get add_card_cvc_amex_label {
    return Intl.message(
      'CVV',
      name: 'add_card_cvc_amex_label',
      desc: '',
      args: [],
    );
  }

  /// `Your card's security code is invalid.`
  String get add_card_invalid_cvc {
    return Intl.message(
      'Your card\'s security code is invalid.',
      name: 'add_card_invalid_cvc',
      desc: '',
      args: [],
    );
  }

  /// `Fiscal number`
  String get add_card_fiscal_number_label {
    return Intl.message(
      'Fiscal number',
      name: 'add_card_fiscal_number_label',
      desc: '',
      args: [],
    );
  }

  /// `Your fiscal number is invalid.`
  String get add_card_invalid_fiscal_number {
    return Intl.message(
      'Your fiscal number is invalid.',
      name: 'add_card_invalid_fiscal_number',
      desc: '',
      args: [],
    );
  }

  /// `Tuya password`
  String get add_card_tuya_code_label {
    return Intl.message(
      'Tuya password',
      name: 'add_card_tuya_code_label',
      desc: '',
      args: [],
    );
  }

  /// `Invalid password`
  String get add_card_invalid_tuya_code {
    return Intl.message(
      'Invalid password',
      name: 'add_card_invalid_tuya_code',
      desc: '',
      args: [],
    );
  }

  /// `Locate the front of your card\ninside the guides and wait while\nthe camera capture the photo`
  String get add_card_camera_instructions {
    return Intl.message(
      'Locate the front of your card\ninside the guides and wait while\nthe camera capture the photo',
      name: 'add_card_camera_instructions',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
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