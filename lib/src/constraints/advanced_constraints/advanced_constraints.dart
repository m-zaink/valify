import 'package:valify/src/constraints/input_constraint.dart';
import 'package:valify/src/utilities/string_utilities.dart';

/// Constraint for validating a credit/debit card number.
class ValidCardNumberConstraint extends InputConstraint {
  ValidCardNumberConstraint({
    String violationMessage = 'ValidCardNumber constraint violated',
  }) : super(violationMessage);

  /// If [input] is not a valid card number as per Luhn Algorithm then it returns `true`.
  /// Otherwise returns `false`.
  @override
  bool isViolatedOn(String input) {
    assert(input != null);

    final cardNumber = input.extraCondensed;

    return !_isLuhnValidCardNumber(cardNumber);
  }

  /// Verifies if the [cardNumber] is valid as per Luhn Algorithm
  bool _isLuhnValidCardNumber(String cardNumber) {
    if (cardNumber.length < 13) {
      return false;
    }

    if (!cardNumber.hasAllDigits) {
      return true;
    }

    if (cardNumber.hasAllZeroes) {
      return true;
    }

    var sum = 0;

    for (var i = 0; i < cardNumber.length; ++i) {
      var digit = int.parse(cardNumber[cardNumber.length - i - 1]);

      if (i % 2 == 1) {
        digit *= 2;
      }

      sum += (digit > 9 ? (digit - 9) : digit);
    }

    if (sum % 10 == 0) {
      return false;
    } else {
      return true;
    }
  }
}
