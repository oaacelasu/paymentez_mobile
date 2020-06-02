// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "add_card_camera_instructions" : MessageLookupByLibrary.simpleMessage("Locate the front of your card\ninside the guides and wait while\nthe camera capture the photo"),
    "add_card_cvc_amex_hint" : MessageLookupByLibrary.simpleMessage("1234"),
    "add_card_cvc_amex_label" : MessageLookupByLibrary.simpleMessage("CVV"),
    "add_card_cvc_hint" : MessageLookupByLibrary.simpleMessage("123"),
    "add_card_cvc_label" : MessageLookupByLibrary.simpleMessage("CVC"),
    "add_card_empty_expiration_date" : MessageLookupByLibrary.simpleMessage("Please enter your card\'s expiration date"),
    "add_card_expiration_date_hint" : MessageLookupByLibrary.simpleMessage("MM/YY"),
    "add_card_expiration_date_label" : MessageLookupByLibrary.simpleMessage("Expiration date"),
    "add_card_fiscal_number_label" : MessageLookupByLibrary.simpleMessage("Fiscal number"),
    "add_card_invalid_cvc" : MessageLookupByLibrary.simpleMessage("Your card\'s security code is invalid."),
    "add_card_invalid_expiration_date" : MessageLookupByLibrary.simpleMessage("Your card\'s expiration date is invalid."),
    "add_card_invalid_expiration_month" : MessageLookupByLibrary.simpleMessage("Your card\'s expiration month is invalid."),
    "add_card_invalid_expiration_year" : MessageLookupByLibrary.simpleMessage("Your card\'s expiration year is invalid."),
    "add_card_invalid_fiscal_number" : MessageLookupByLibrary.simpleMessage("Your fiscal number is invalid."),
    "add_card_invalid_name" : MessageLookupByLibrary.simpleMessage("Your card holder\'s name is invalid."),
    "add_card_invalid_number" : MessageLookupByLibrary.simpleMessage("Your card\'s number is invalid."),
    "add_card_invalid_tuya_code" : MessageLookupByLibrary.simpleMessage("Invalid password"),
    "add_card_name_hint" : MessageLookupByLibrary.simpleMessage("Jhon Doe"),
    "add_card_name_label" : MessageLookupByLibrary.simpleMessage("Card Holder\'s Name"),
    "add_card_number_hint" : MessageLookupByLibrary.simpleMessage("1234 1234 1234 1234"),
    "add_card_number_label" : MessageLookupByLibrary.simpleMessage("Card number"),
    "add_card_tuya_code_label" : MessageLookupByLibrary.simpleMessage("Tuya password"),
    "app_name" : MessageLookupByLibrary.simpleMessage("Paymentez SDK"),
    "loading_lbl" : MessageLookupByLibrary.simpleMessage("Loading...")
  };
}
