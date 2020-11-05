import 'package:test/test.dart';
import 'package:valify/constraints/input_constraint.dart';

void testUpperCaseCharactersRequiredConstraint() {
  group(
    'test for UpperCaseCharactersRequiredConstraint',
    () {
      test(
        'should NOT be violated when input contains at least '
        '${UpperCaseCharactersRequiredConstraint.defaultMinCharactersRequired} number of upper case characters',
        () {
          // arrange
          final minNumberOfUpperCaseCharactersRequired =
              UpperCaseCharactersRequiredConstraint.defaultMinCharactersRequired;
          final inputWithMinNumberOfUpperCaseCharactersAtLeadingPositions =
              'A' * minNumberOfUpperCaseCharactersRequired + 'blah';
          final inputWithMinNumberOfUpperCaseCharactersAtTrailingPositions =
              'blah' + 'B' * minNumberOfUpperCaseCharactersRequired;
          final inputWithMinNumberOfUpperCaseCharactersAtMiddlePositions =
              'blah' + 'C' * minNumberOfUpperCaseCharactersRequired + 'blah';
          final inputWithMoreThanMinNumberOfUpperCaseCharacters =
              'blah' + 'AB' * minNumberOfUpperCaseCharactersRequired + 'blah';

          final upperCaseCharactersRequiredConstraint = UpperCaseCharactersRequiredConstraint();

          // act
          final isViolatedAtMinNumberOfCharactersRequiredAtLeadingPositions = upperCaseCharactersRequiredConstraint
              .isViolatedOn(inputWithMinNumberOfUpperCaseCharactersAtLeadingPositions);

          final isViolatedAtMinNumberOfCharactersRequiredAtTrailingPositions = upperCaseCharactersRequiredConstraint
              .isViolatedOn(inputWithMinNumberOfUpperCaseCharactersAtTrailingPositions);

          final isViolatedAtMinNumberOfCharactersRequiredAtMiddlePositions = upperCaseCharactersRequiredConstraint
              .isViolatedOn(inputWithMinNumberOfUpperCaseCharactersAtMiddlePositions);

          final isViolatedAtMoreThanMinNumberOfCharactersRequired =
              upperCaseCharactersRequiredConstraint.isViolatedOn(inputWithMoreThanMinNumberOfUpperCaseCharacters);

          // assert
          expect(
            isViolatedAtMinNumberOfCharactersRequiredAtLeadingPositions,
            isFalse,
          );

          expect(
            isViolatedAtMinNumberOfCharactersRequiredAtTrailingPositions,
            isFalse,
          );

          expect(
            isViolatedAtMinNumberOfCharactersRequiredAtMiddlePositions,
            isFalse,
          );

          expect(
            isViolatedAtMoreThanMinNumberOfCharactersRequired,
            isFalse,
          );
        },
      );

      test(
        'should NOT be violated when input contains at least '
        '2 number of upper case characters',
        () {
          // arrange
          final minNumberOfUpperCaseCharactersRequired = 2;
          final inputWithMinNumberOfUpperCaseCharactersAtLeadingPositions =
              'A' * minNumberOfUpperCaseCharactersRequired + 'blah';
          final inputWithMinNumberOfUpperCaseCharactersAtTrailingPositions =
              'blah' + 'B' * minNumberOfUpperCaseCharactersRequired;
          final inputWithMinNumberOfUpperCaseCharactersAtMiddlePositions =
              'blah' + 'C' * minNumberOfUpperCaseCharactersRequired + 'blah';
          final inputWithMoreThanMinNumberOfUpperCaseCharacters =
              'blah' + 'AB' * minNumberOfUpperCaseCharactersRequired + 'blah';

          final upperCaseCharactersRequiredConstraint = UpperCaseCharactersRequiredConstraint();

          // act
          final isViolatedAtMinNumberOfCharactersRequiredAtLeadingPositions = upperCaseCharactersRequiredConstraint
              .isViolatedOn(inputWithMinNumberOfUpperCaseCharactersAtLeadingPositions);

          final isViolatedAtMinNumberOfCharactersRequiredAtTrailingPositions = upperCaseCharactersRequiredConstraint
              .isViolatedOn(inputWithMinNumberOfUpperCaseCharactersAtTrailingPositions);

          final isViolatedAtMinNumberOfCharactersRequiredAtMiddlePositions = upperCaseCharactersRequiredConstraint
              .isViolatedOn(inputWithMinNumberOfUpperCaseCharactersAtMiddlePositions);

          final isViolatedAtMoreThanMinNumberOfCharactersRequired =
              upperCaseCharactersRequiredConstraint.isViolatedOn(inputWithMoreThanMinNumberOfUpperCaseCharacters);

          // assert
          expect(
            isViolatedAtMinNumberOfCharactersRequiredAtLeadingPositions,
            isFalse,
          );

          expect(
            isViolatedAtMinNumberOfCharactersRequiredAtTrailingPositions,
            isFalse,
          );

          expect(
            isViolatedAtMinNumberOfCharactersRequiredAtMiddlePositions,
            isFalse,
          );

          expect(
            isViolatedAtMoreThanMinNumberOfCharactersRequired,
            isFalse,
          );
        },
      );

      test(
        'should be violated when input does not contains at least '
        '${UpperCaseCharactersRequiredConstraint.defaultMinCharactersRequired} number of upper case characters',
        () {
          // arrange
          final numberLessThanMinNumberOfUpperCaseCharactersRequired =
              UpperCaseCharactersRequiredConstraint.defaultMinCharactersRequired;
          final inputWithLessThanMinNumberOfUpperCaseCharactersAtLeadingPositions =
              'A' * numberLessThanMinNumberOfUpperCaseCharactersRequired + 'blah';
          final inputWithLessMinNumberOfUpperCaseCharactersAtTrailingPositions =
              'blah' + 'B' * numberLessThanMinNumberOfUpperCaseCharactersRequired;
          final inputWithLesssMinNumberOfUpperCaseCharactersAtMiddlePositions =
              'blah' + 'C' * numberLessThanMinNumberOfUpperCaseCharactersRequired + 'blah';

          final upperCaseCharactersRequiredConstraint = UpperCaseCharactersRequiredConstraint(
            minCharactersRequired: numberLessThanMinNumberOfUpperCaseCharactersRequired,
          );

          // act
          final isViolatedAtMinNumberOfCharactersRequiredAtLeadingPositions = upperCaseCharactersRequiredConstraint
              .isViolatedOn(inputWithLessThanMinNumberOfUpperCaseCharactersAtLeadingPositions);

          final isViolatedAtMinNumberOfCharactersRequiredAtTrailingPositions = upperCaseCharactersRequiredConstraint
              .isViolatedOn(inputWithLessMinNumberOfUpperCaseCharactersAtTrailingPositions);

          final isViolatedAtMinNumberOfCharactersRequiredAtMiddlePositions = upperCaseCharactersRequiredConstraint
              .isViolatedOn(inputWithLesssMinNumberOfUpperCaseCharactersAtMiddlePositions);

          // assert
          expect(
            isViolatedAtMinNumberOfCharactersRequiredAtLeadingPositions,
            isTrue,
          );

          expect(
            isViolatedAtMinNumberOfCharactersRequiredAtTrailingPositions,
            isTrue,
          );

          expect(
            isViolatedAtMinNumberOfCharactersRequiredAtMiddlePositions,
            isTrue,
          );
        },
      );
    },
  );
}
