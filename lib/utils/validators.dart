class Validators {
  static final RegExp _nameRegExp = RegExp(r'^[A-Za-zÀ-ÖØ-öø-ÿ ]+$');

  static isValidName(String name) {
    return _nameRegExp.hasMatch(name);
  }

  static isValidNumber(String cardType, String number, String mask) {
    return _validateCardNum(number) &&
        cardType.isNotEmpty &&
        mask.replaceAll(' ', '').length == number.length;
  }

  /// With the card number with Luhn Algorithm
  /// https://en.wikipedia.org/wiki/Luhn_algorithm
  static bool _validateCardNum(String input) {
    if (input.isEmpty) {
      return false;
    }

    input = _getCleanedNumber(input);

    if (input.length < 8) {
      return false;
    }

    int sum = 0;
    int length = input.length;
    for (var i = 0; i < length; i++) {
      // get digits in reverse order
      int digit = int.parse(input[length - i - 1]);

      // every 2nd number multiply with 2
      if (i % 2 == 1) {
        digit *= 2;
      }
      sum += digit > 9 ? (digit - 9) : digit;
    }
    return (sum % 10 == 0);
  }

  static String _getCleanedNumber(String text) {
    RegExp regExp = new RegExp(r"[^0-9]");
    return text.replaceAll(regExp, '');
  }
}
