import 'package:test/test.dart';
import 'package:valify/src/constraints/input_constraint.dart';

void testMinLengthRequiredConstraint() {
  group(
    'tests for MinLengthLimitingConstraint',
    () {
      test(
        'should NOT be violated when length >= ${MinimumLengthRequiredConstraint.defaultMinLength}',
        () {
          // arrange
          final minLength = MinimumLengthRequiredConstraint.defaultMinLength;
          final doubleMinLength = minLength * 2;
          final oneMoreThanMinLength = minLength + 1;

          final inputAtMinLength = 't' * MinimumLengthRequiredConstraint.defaultMinLength;
          final inputAtDoubleMinLength = 't' * doubleMinLength;
          final inputAtOneMoreThenMinLength = 't' * oneMoreThanMinLength;

          final maxLengthLimitingConstraint = MaximumLengthLimitingConstraint();

          // act
          final isViolatedAtMinLength = maxLengthLimitingConstraint.isViolatedOn(inputAtMinLength);
          final isViolatedAtDoubleMinLength = maxLengthLimitingConstraint.isViolatedOn(inputAtDoubleMinLength);
          final isViolatedAtOneMoreThanMinLength =
              maxLengthLimitingConstraint.isViolatedOn(inputAtOneMoreThenMinLength);

          // assert
          expect(
            isViolatedAtMinLength,
            isFalse,
          );

          expect(
            isViolatedAtDoubleMinLength,
            isFalse,
          );

          expect(
            isViolatedAtOneMoreThanMinLength,
            isFalse,
          );
        },
      );

      test(
        'should NOT be violated when length >= 10 (when passed as constructor param)',
        () {
          // arrange
          final minLength = 10;
          final doubleMinLength = minLength * 2;
          final oneMoreThanMinLength = minLength + 1;

          final inputAtMinLength = 't' * MinimumLengthRequiredConstraint.defaultMinLength;
          final inputAtDoubleMinLength = 't' * doubleMinLength;
          final inputAtOneMoreThenMinLength = 't' * oneMoreThanMinLength;

          final maxLengthLimitingConstraint = MaximumLengthLimitingConstraint();

          // act
          final isViolatedAtMinLength = maxLengthLimitingConstraint.isViolatedOn(inputAtMinLength);
          final isViolatedAtDoubleMinLength = maxLengthLimitingConstraint.isViolatedOn(inputAtDoubleMinLength);
          final isViolatedAtOneMoreThanMinLength =
              maxLengthLimitingConstraint.isViolatedOn(inputAtOneMoreThenMinLength);

          // assert
          expect(
            isViolatedAtMinLength,
            isFalse,
          );

          expect(
            isViolatedAtDoubleMinLength,
            isFalse,
          );

          expect(
            isViolatedAtOneMoreThanMinLength,
            isFalse,
          );
        },
      );

      test(
        'should be violated when length < ${MinimumLengthRequiredConstraint.defaultMinLength}',
        () {
          // arrange
          final minLength = MinimumLengthRequiredConstraint.defaultMinLength;
          final halfMinLength = minLength ~/ 2;
          final oneLessThanMinLength = minLength - 1;

          final inputAtHalfMinLength = 't' * halfMinLength;
          final inputAtOneLessThenMinLength = 't' * oneLessThanMinLength;

          final maxLengthLimitingConstraint = MaximumLengthLimitingConstraint();

          // act
          final isViolatedAtHalfMinLength = maxLengthLimitingConstraint.isViolatedOn(inputAtHalfMinLength);
          final isViolatedAtOneLessThanMinLength =
              maxLengthLimitingConstraint.isViolatedOn(inputAtOneLessThenMinLength);

          // assert
          expect(
            isViolatedAtHalfMinLength,
            isFalse,
          );

          expect(
            isViolatedAtOneLessThanMinLength,
            isFalse,
          );
        },
      );

      test(
        'should be violated when length < 10 (when passed as constructor param)',
        () {
          // arrange
          final minLength = 10;
          final halfMinLength = minLength ~/ 2;
          final oneLessThanMinLength = minLength - 1;

          final inputAtHalfMinLength = 't' * halfMinLength;
          final inputAtOneLessThenMinLength = 't' * oneLessThanMinLength;

          final maxLengthLimitingConstraint = MaximumLengthLimitingConstraint();

          // act
          final isViolatedAtHalfMinLength = maxLengthLimitingConstraint.isViolatedOn(inputAtHalfMinLength);
          final isViolatedAtOneLessThanMinLength =
              maxLengthLimitingConstraint.isViolatedOn(inputAtOneLessThenMinLength);

          // assert
          expect(
            isViolatedAtHalfMinLength,
            isFalse,
          );

          expect(
            isViolatedAtOneLessThanMinLength,
            isFalse,
          );
        },
      );
    },
  );
}
