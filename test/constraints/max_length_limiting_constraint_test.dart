import 'package:test/test.dart';
import 'package:valify/constraints/input_constraint.dart';

void testMaxLengthLimitingConstraint() {
  group(
    'tests for MaximumLengthLimitingConstraint',
    () {
      test(
        'should NOT be violated when length <= ${MaximumLengthLimitingConstraint.defaultMaxLength}',
        () {
          // arrange
          final halfMaxLength = MaximumLengthLimitingConstraint.defaultMaxLength ~/ 2;
          final oneLessThanMaxLength = MaximumLengthLimitingConstraint.defaultMaxLength - 1;

          final inputAtMaxLength = 't' * MaximumLengthLimitingConstraint.defaultMaxLength;
          final inputAtHalfMaxLength = 't' * halfMaxLength;
          final inputAtOneLessThenMaxLength = 't' * oneLessThanMaxLength;

          final maxLengthLimitingConstraint = MaximumLengthLimitingConstraint();

          // act
          final isViolatedAtMaxLength = maxLengthLimitingConstraint.isViolatedOn(inputAtMaxLength);
          final isViolatedAtHalfMaxLength = maxLengthLimitingConstraint.isViolatedOn(inputAtHalfMaxLength);
          final isViolatedAtOneLessThanMaxLength =
              maxLengthLimitingConstraint.isViolatedOn(inputAtOneLessThenMaxLength);

          // assert
          expect(
            isViolatedAtMaxLength,
            isFalse,
          );

          expect(
            isViolatedAtHalfMaxLength,
            isFalse,
          );

          expect(
            isViolatedAtOneLessThanMaxLength,
            isFalse,
          );
        },
      );

      test(
        'should NOT be violated when length < 10 (when passed as constructor param)',
        () {
          // arrange
          final maxLength = 10;
          final halfOfMaxLength = maxLength ~/ 2;
          final oneLessThanMaxLength = maxLength - 1;

          final inputAtMaxLength = 't' * maxLength;
          final inputAtDoubleOfMaxLength = 't' * halfOfMaxLength;
          final inputAtOneMoreThanMaxLength = 't' * oneLessThanMaxLength;

          final maxLengthLimitingConstraint = MaximumLengthLimitingConstraint(
            maxLength: maxLength,
          );

          // act
          final isViolatedAtMaxLength = maxLengthLimitingConstraint.isViolatedOn(inputAtMaxLength);
          final isViolatedAtHalfOfMaxLength = maxLengthLimitingConstraint.isViolatedOn(inputAtDoubleOfMaxLength);
          final isViolatedAtOneLessThanMaxLength =
              maxLengthLimitingConstraint.isViolatedOn(inputAtOneMoreThanMaxLength);

          // assert
          expect(
            isViolatedAtMaxLength,
            isFalse,
          );

          expect(
            isViolatedAtHalfOfMaxLength,
            isFalse,
          );

          expect(
            isViolatedAtOneLessThanMaxLength,
            isFalse,
          );
        },
      );

      test(
        'should be violated when length > ${MaximumLengthLimitingConstraint.defaultMaxLength}',
        () {
          // arrange
          final doubleOfMaxLength = MaximumLengthLimitingConstraint.defaultMaxLength * 2;
          final oneMoreThanMaxLength = MaximumLengthLimitingConstraint.defaultMaxLength + 1;

          final inputAtDoubleOfMaxLength = 't' * doubleOfMaxLength;
          final inputAtOneMoreThanMaxLength = 't' * oneMoreThanMaxLength;

          final maxLengthLimitingConstraint = MaximumLengthLimitingConstraint();

          // act
          final isViolatedAtDoubleOfMaxLength = maxLengthLimitingConstraint.isViolatedOn(inputAtDoubleOfMaxLength);
          final isViolatedAtOneMoreThanHalfLength =
              maxLengthLimitingConstraint.isViolatedOn(inputAtOneMoreThanMaxLength);

          // assert
          expect(
            isViolatedAtDoubleOfMaxLength,
            isTrue,
          );

          expect(
            isViolatedAtOneMoreThanHalfLength,
            isTrue,
          );
        },
      );

      test(
        'should be violated when length > 10 (when passed as constructor param)',
        () {
          // arrange
          final maxLength = 10;
          final doubleOfMaxLength = maxLength * 2;
          final oneMoreThanMaxLength = maxLength + 1;

          final inputAtDoubleOfMaxLength = 't' * doubleOfMaxLength;
          final inputAtOneMoreThanMaxLength = 't' * oneMoreThanMaxLength;

          final maxLengthLimitingConstraint = MaximumLengthLimitingConstraint(
            maxLength: maxLength,
          );

          // act
          final isViolatedAtDoubleOfMaxLength = maxLengthLimitingConstraint.isViolatedOn(inputAtDoubleOfMaxLength);
          final isViolatedAtOneMoreThanMaxLength =
              maxLengthLimitingConstraint.isViolatedOn(inputAtOneMoreThanMaxLength);

          // assert
          expect(
            isViolatedAtDoubleOfMaxLength,
            isTrue,
          );

          expect(
            isViolatedAtOneMoreThanMaxLength,
            isTrue,
          );
        },
      );
    },
  );
}
