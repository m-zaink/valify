import 'package:meta/meta.dart';

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

/// Constraint to ensure that the card hasn't expired.
///
/// [input] to [isVioldatedOn] expects it to be of form 'MM/YY' or 'MM/YYYY'.
class ValidCardExpiryDateConstraint extends InputConstraint {
  ValidCardExpiryDateConstraint({
    String violationMessage = 'ValidCardExpiryDate constraint violated',
  }) : super(violationMessage);

  @override
  bool isViolatedOn(String input) {
    final monthAndYear = input.extraCondensed.split('/');

    if (monthAndYear.length != 2) {
      return true;
    }

    final month = monthAndYear[0];
    final year = monthAndYear[1];

    if (!month.hasAllDigits || !year.hasAllDigits) {
      return true;
    }

    if ((int.parse(year) % 100) < (DateTime.now().year % 100)) {
      return true;
    }

    if (int.parse(month) < DateTime.now().month) {
      return true;
    }

    return false;
  }
}

enum IssuerIdentificationNumber {
  unknown,
  americanExpress,
  dinnersClubInternational,
  dinnersClubUsaAndCanada,
  discoverCard,
  ukrCard,
  ruPay,
  interPayment,
  instaPayment,
  jcb,
  maestroUK,
  maestro,
  dankort,
  mir,
  npsPridnestrovie,
  masterCard,
  troy,
  visa,
  visaElectron,
  uatp,
  verve,
  lankaPay,
}

final regExpBasedOnIin = <IssuerIdentificationNumber, String>{
  IssuerIdentificationNumber.americanExpress: '^3[47]',
  IssuerIdentificationNumber.dinnersClubInternational: '^36',
  IssuerIdentificationNumber.dinnersClubUsaAndCanada: '^54',
};
