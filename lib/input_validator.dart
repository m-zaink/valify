import 'package:meta/meta.dart';
import 'package:valify/constraints/input_constraint.dart';

abstract class InputValidator {
  factory InputValidator({@required List<InputConstraint> constraints}) {
    assert(constraints != null);

    return _InputValidatorImpl(
      constraints: constraints,
    );
  }

  bool areAllConstraintsSatisfiedOn({@required String input});

  List<InputConstraint> allConstraintsViolatedOn({@required String input});

  InputConstraint firstConstraintViolatedOn({@required String input});
}

class _InputValidatorImpl implements InputValidator {
  final List<InputConstraint> constraints;

  _InputValidatorImpl({
    @required this.constraints,
  }) : assert(constraints != null);

  @override
  bool areAllConstraintsSatisfiedOn({@required String input}) {
    assert(input != null);

    for (var constraint in constraints) {
      if (constraint.isViolatedOn(input)) {
        return false;
      }
    }

    return true;
  }

  @override
  List<InputConstraint> allConstraintsViolatedOn({@required String input}) {
    assert(input != null);

    final violatedConstraints = <InputConstraint>[];

    for (var constraint in constraints) {
      if (constraint.isViolatedOn(input)) {
        violatedConstraints.add(constraint);
      }
    }

    return violatedConstraints;
  }

  @override
  InputConstraint firstConstraintViolatedOn({@required String input}) {
    assert(input != null);

    for (var constraint in constraints) {
      if (constraint.isViolatedOn(input)) {
        return constraint;
      }
    }

    return null;
  }
}
