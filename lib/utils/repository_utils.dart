import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';

class RepositoryUtils {
  static String _getUniqToken(
      String authTimeStamp, String paymentezClientAppKey) {
    String uniqTokenString = paymentezClientAppKey + authTimeStamp;
    return sha256.convert(utf8.encode(uniqTokenString)).toString();
  }

  static String getAuthToken(
      String paymentezClientAppCode, String appClientKey) {
    String authTimeStamp = "${DateTime.now().millisecondsSinceEpoch}";
    String stringAuthToken = paymentezClientAppCode +
        ";" +
        authTimeStamp +
        ";" +
        _getUniqToken(authTimeStamp, appClientKey);
    String authToken = base64Encode(utf8.encode(stringAuthToken));
    return authToken;
  }

  // Must be top-level function
  static _parseAndDecode(String response) {
    return jsonDecode(response);
  }

  static parseJson(String text) {
    return compute(_parseAndDecode, text);
  }
}
