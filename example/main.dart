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

  /// And lastly, let's specify that the password should contain at least one
  /// special character.
  final shouldContainSpecialCharactersConstraint =
      SpecialCharactersRequiredConstraint(
    specialCharacters: '?=.*[@!#\$%&’*+-/=?^_`{|}~.]<>'.split(''),
    allNeedToBePresent: false,
    violationMessage: 'Password should contain at least one special character',
  );

  /// Oh! BTW, let's also add a constraint to password shouldn't be longer than 64
  /// characters
  final maxLengthLimitingConstraint =
      MaximumLengthLimitingConstraint(maxLength: 64, violationMessage: '');

  /// And with all the above constraints, we can create a validation pipeline
  /// using `Valifier`.
  final passwordValifier = Valifier(
    constraints: [
      minLengthRequiredConstraint,
      shouldContainUpperCaseCharactersConstraint,
      shouldContainLowerCaseCharactersConstraint,
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
}
