import 'package:meta/meta.dart';
import 'package:valify/constraints/input_constraint.dart';

/// Describes a constraints pipeline (valifying pipeline).
///
/// Exposes a list of methods that can be used to verify if any violations did occur, fetch a list of violations or
/// the first violation in the list of violations that occured.
abstract class Valifier {
  /// If any constraint from the constraint pipeline is violated on [input], then returns [true].
  /// Otherwise returns [false].
  bool areAllConstraintsSatisfiedOn(String input);

  /// Generates a list of all the constraints from the pipeline that were violated on [input].
  /// If no constraint was violated, an empty list is returned.
  List<InputConstraint> allConstraintsViolatedOn(String input);

  /// Fetch the first constraint that was violated from the pipeline on [input].
  /// Returns [null] if no constraint was violated at all.
  InputConstraint firstConstraintViolatedOn(String input);

  factory Valifier({@required List<InputConstraint> constraints}) {
    assert(constraints != null);

    return _ValifierImpl(
      constraints: constraints,
    );
  }
}

class _ValifierImpl implements Valifier {
  final List<InputConstraint> constraints;

  _ValifierImpl({
    @required this.constraints,
  }) : assert(constraints != null);

  @override
  bool areAllConstraintsSatisfiedOn(String input) {
    assert(input != null);

    for (var constraint in constraints) {
      if (constraint.isViolatedOn(input)) {
        return false;
      }
    }

    return true;
  }

  @override
  List<InputConstraint> allConstraintsViolatedOn(String input) {
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
  InputConstraint firstConstraintViolatedOn(String input) {
    assert(input != null);

    for (var constraint in constraints) {
      if (constraint.isViolatedOn(input)) {
        return constraint;
      }
    }

    return null;
  }
}
