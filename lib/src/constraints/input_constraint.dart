/// Describes the constraint that ought to be checked against a given input.
abstract class InputConstraint {
  /// Is the message that need to be shown if the constraint is violated.
  ///
  /// This can be set ahead-of-time to be used later on when violation occurs.
  final String violationMessage;

  InputConstraint(
    this.violationMessage,
  ) : assert(violationMessage != null);

  /// Verifies if the constraint is violated for the given [input].
  ///
  /// If input violates the constraints, returns `true`.
  /// Otherwise returns `false`.
  bool isViolatedOn(String input);
}
