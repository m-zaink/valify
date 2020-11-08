/// Importing `valify` here.
import 'package:valify/valify.dart';

void main() {
  /// Although this library is intended to be used under a Flutter application,
  /// we will here see how to use the various constraint classes and `valifer`
  /// exposed by the library.

  /// Let's begin by creating a pipeline for validating an acceptable password.

  /// Let's first create a constraint to specify that the password being set by
  /// user should be atleast 8 characters long.
  final minLengthRequiredConstraint = MinimumLengthRequiredConstraint(
    minLength: 8,
    violationMessage: 'Password needs to be at least 8 characters long',
  );

  /// Let's next create a constraint to specify that the password needs to
  /// contain atleast one upper cased character.
  final shouldContainUpperCaseCharactersConstraint =
      UpperCaseCharactersRequiredConstraint(
    violationMessage:
        'Password should contain atleast one upper case character',
  );

  /// Let's put a constraint that password needs to contain atleast one lower
  /// cased character.
  final shouldContainLowerCaseCharactersConstraint =
      LowerCaseCharactersRequiredConstraint(
    violationMessage:
        'Password should contain at least one lower case character',
  );

  /// Let's add yet another constraint that password needs to contain at least
  /// one digit
  final shouldContainAtLeastOneDigit = DigitsRequiredConstraint(
    violationMessage: 'Password should contain at least one digit',
  );

  /// And lastly, let's specify that the password should contain at least one
  /// special character.
  final shouldContainSpecialCharactersConstraint =
      SpecialCharactersRequiredConstraint(
    specialCharacters: '?=.*[@!#\$%&’*+-/=?^_`{|}~.]<>'.split(''),
    allNeedToBePresent: false,
    violationMessage: 'Password should contain at least one special character',
  );

  /// Oh! BTW, let's also add a constraint that password shouldn't be longer than 64
  /// characters
  final maxLengthLimitingConstraint = MaximumLengthLimitingConstraint(
    maxLength: 64,
    violationMessage: 'Password cannot be greater than 64 characters in length',
  );

  /// And with all the above constraints, we can create a validation pipeline
  /// using `Valifier`.
  final passwordValifier = Valifier(
    constraints: [
      minLengthRequiredConstraint,
      shouldContainUpperCaseCharactersConstraint,
      shouldContainLowerCaseCharactersConstraint,
      shouldContainAtLeastOneDigit,
      shouldContainSpecialCharactersConstraint,
      maxLengthLimitingConstraint,
    ],
  );

  /// Let's see if any constraints are violated on the password 'HelloWorld'.
  final violatedConstraints =
      passwordValifier.allConstraintsViolatedOn('HelloWorld');

  if (violatedConstraints.isNotEmpty) {
    print(
      'Uh oh! Some constraints on password were violated. Let\'s see which ones',
    );

    for (var i = 0; i < violatedConstraints.length; i++) {
      print('$i. ${violatedConstraints[i].violationMessage}');
    }
  } else {
    print('Awesome! You got it all right.');
  }

  /// Although the above approach is just fine in creating constrant pipelines, it's very verbose.
  /// A much better approach would be as folows:

  final passwordValifierNonVerbose = Valifier(
    constraints: [
      MinimumLengthRequiredConstraint(
        minLength: 8,
        violationMessage: 'Password needs to be at least 8 characters long',
      ),
      UpperCaseCharactersRequiredConstraint(
        violationMessage:
            'Password should contain atleast one upper case character',
      ),
      LowerCaseCharactersRequiredConstraint(
        violationMessage:
            'Password should contain at least one lower case character',
      ),
      DigitsRequiredConstraint(
        violationMessage: 'Password should contain at least one digit',
      ),
      SpecialCharactersRequiredConstraint(
        specialCharacters: '?=.*[@!#\$%&’*+-/=?^_`{|}~.]<>'.split(''),
        allNeedToBePresent: false,
        violationMessage:
            'Password should contain at least one special character',
      ),
      MaximumLengthLimitingConstraint(
        maxLength: 64,
        violationMessage:
            'Password cannot be greater than 64 characters in length',
      ),
    ],
  );

  /// Let's see if any constraints are violated on the password 'HelloWorld'.
  final violatedConstraintsOnNonVerboseValifier =
      passwordValifierNonVerbose.allConstraintsViolatedOn('HelloWorld');

  if (violatedConstraintsOnNonVerboseValifier.isNotEmpty) {
    print(
      'Uh oh! Some constraints on password were violated. Let\'s see which ones',
    );

    for (var i = 0; i < violatedConstraints.length; i++) {
      print('$i. ${violatedConstraints[i].violationMessage}');
    }
  } else {
    print('Awesome! You got it all right.');
  }
}
