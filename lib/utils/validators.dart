class Validators {
  static final RegExp _nameRegExp = RegExp(r'^[A-Za-zÀ-ÖØ-öø-ÿ ]+$');

  static isValidName(String name) {
    return _nameRegExp.hasMatch(name);
  }

  static isValidCVV(String value, cvvLength) {
    return (value.isNotEmpty && value.length == cvvLength);
  }

  static isValidDateExp(String value) {
    return _isValidDate(value);
  }

  static isValidNumber(String cardType, String number, String mask) {
    return _validateCardNum(number) &&
        cardType.isNotEmpty &&
        mask.replaceAll(' ', '').length == number.length;
  }

  static _isValidDate(String value) {
    if (value.isEmpty) {
      return false;
    }

    int year;
    int month;
    // The value contains a forward slash if the month and year has been
    // entered.
    if (value.contains(new RegExp(r'(\/)'))) {
      var split = value.split(new RegExp(r'(\/)'));
      // The value before the slash is the month while the value to right of
      // it is the year.
      month = int.parse(split[0]);
      year = int.parse(split[1]);
    } else {
      // Only the month was entered
      month = int.parse(value.substring(0, (value.length)));
      year = -1; // Lets use an invalid year intentionally
    }

    print(month);
    print(year);

    if ((month < 1) || (month > 12)) {
      // A valid month is between 1 (January) and 12 (December)
      return false;
    }

    var fourDigitsYear = _convertYearTo4Digits(year);
    print(fourDigitsYear);
    if ((fourDigitsYear < 1) || (fourDigitsYear > 2099)) {
      // We are assuming a valid should be between 1 and 2099.
      // Note that, it's valid doesn't mean that it has not expired.
      return false;
    }

    if (!_hasDateExpired(month, year)) {
      return false;
    }
    return true;
  }

  /// Convert the two-digit year to four-digit year if necessary
  static int _convertYearTo4Digits(int year) {
    if (year < 100 && year >= 0) {
      var now = DateTime.now();
      String currentYear = now.year.toString();
      String prefix = currentYear.substring(0, currentYear.length - 2);
      year = int.parse('$prefix${year.toString().padLeft(2, '0')}');
    }
    return year;
  }

  static bool _hasDateExpired(int month, int year) {
    return !(month == null || year == null) && _isNotExpired(year, month);
  }

  static bool _isNotExpired(int year, int month) {
    // It has not expired if both the year and date has not passed
    return !_hasYearPassed(year) && !_hasMonthPassed(year, month);
  }

  static List<int> _getExpiryDate(String value) {
    var split = value.split(new RegExp(r'(\/)'));
    return [int.parse(split[0]), int.parse(split[1])];
  }

  static bool _hasMonthPassed(int year, int month) {
    var now = DateTime.now();
    // The month has passed if:
    // 1. The year is in the past. In that case, we just assume that the month
    // has passed
    // 2. Card's month (plus another month) is more than current month.
    return _hasYearPassed(year) ||
        _convertYearTo4Digits(year) == now.year && (month < now.month + 1);
  }

  static bool _hasYearPassed(int year) {
    int fourDigitsYear = _convertYearTo4Digits(year);
    var now = DateTime.now();
    // The year has passed if the year we are currently is more than card's
    // year
    return fourDigitsYear < now.year;
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
