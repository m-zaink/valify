import 'package:meta/meta.dart';

/// Describes the constraint that ought to be checked against a given input.
abstract class InputConstraint {
  /// Is the message that need to be shown if the constraint is violated.
  ///
  /// This can be set when be used later on when violation occurs.
  String get violationMessage;

  /// Verifies if the constraint is violated for the given [input].
  ///
  /// If input violates the constraints, returns [true].
  /// Otherwise returns [false].
  bool isViolatedOn(String input);
}

/// Constraint on the maximum length of the input.
class MaximumLengthLimitingConstraint implements InputConstraint {
  static const int defaultMaxLength = 64;

  /// Length beyond which the input is said to be violating the constraint.
  final int maxLength;

  @override
  final String violationMessage;

  MaximumLengthLimitingConstraint({
    this.maxLength = MaximumLengthLimitingConstraint.defaultMaxLength,
    this.violationMessage = '',
  })  : assert(maxLength != null),
        assert(violationMessage != null);

  /// If [input.length] > [maxLength], returns [true].
  /// Otherwise returns [false].
  @override
  bool isViolatedOn(String input) {
    assert(input != null);

    return input.length > maxLength;
  }
}

/// Constraint on the minimum length of the input.
class MinimumLengthRequiredConstraint implements InputConstraint {
  static const int defaultMinLength = 8;

  /// Length below which the input is said to be violating the constraint.
  final int minLength;

  @override
  final String violationMessage;

  MinimumLengthRequiredConstraint({
    this.minLength = MinimumLengthRequiredConstraint.defaultMinLength,
    this.violationMessage = '',
  })  : assert(minLength != null),
        assert(violationMessage != null);

  /// If [input.length] < [minLength], then returns [true].
  /// Otherwise returns [false].
  @override
  bool isViolatedOn(String input) {
    assert(input != null);

    return input.length < minLength;
  }
}

/// Constraint on upper case characters being present in the input.
class UpperCaseCharactersRequiredConstraint implements InputConstraint {
  static const int defaultMinCharactersRequired = 1;

  /// Minimum number of characters that need to be upper cased.
  final int minCharactersRequired;

  /// Maximum number of characters that can be upper cased.
  final int maxCharactersAllowed;

  @override
  final String violationMessage;

  UpperCaseCharactersRequiredConstraint({
    this.minCharactersRequired =
        UpperCaseCharactersRequiredConstraint.defaultMinCharactersRequired,
    this.maxCharactersAllowed,
    this.violationMessage = '',
  })  : assert(minCharactersRequired != null),
        assert(maxCharactersAllowed == null ||
            maxCharactersAllowed >= minCharactersRequired),
        assert(violationMessage != null);

  /// If [input] contains atleast [minCharactersRequired] number of upper case characters
  /// (and contains at most [maxCharactersAllowed] numbers of upper case characters
  /// if [maxCharactersAllowed] is set), then returns [true].
  /// Otherwise returns [false].
  @override
  bool isViolatedOn(String input) {
    assert(input != null);

    final regExForUpperCaseCharacters =
        RegExp('[A-Z]{$minCharactersRequired,${maxCharactersAllowed ?? ''}}');
    return !regExForUpperCaseCharacters.hasMatch(input);
  }
}

/// Constraint to disallowing any upper case characters in the input.
class AvoidUpperCaseCharactersConstraint implements InputConstraint {
  @override
  final String violationMessage;

  AvoidUpperCaseCharactersConstraint({this.violationMessage = ''})
      : assert(violationMessage != null);

  /// If input contains even one upper case character, then returns [true].
  /// Otherwise returns [false].
  @override
  bool isViolatedOn(String input) {
    assert(input != null);

    final regExForUpperCaseCharacters = RegExp('[A-Z]');

    return regExForUpperCaseCharacters.hasMatch(input);
  }
}

/// Constraint on lower case characters being present in the input.
class LowerCaseCharactersRequiredConstraint implements InputConstraint {
  static const int defaultMinCharactersRequired = 1;

  /// Minimum number of characters that need to be lower cased.
  final int minCharactersRequired;

  /// Maximum number of characters that can be lower cased.
  final int maxCharactersAllowed;

  @override
  final String violationMessage;

  LowerCaseCharactersRequiredConstraint({
    this.minCharactersRequired =
        LowerCaseCharactersRequiredConstraint.defaultMinCharactersRequired,
    this.maxCharactersAllowed,
    this.violationMessage = '',
  })  : assert(minCharactersRequired != null),
        assert(maxCharactersAllowed == null ||
            maxCharactersAllowed >= minCharactersRequired),
        assert(violationMessage != null);

  /// If [input] contains atleast [minCharactersRequired] number of lower case characters
  /// (and contains at most [maxCharactersAllowed] numbers of lower case characters
  /// if [maxCharactersAllowed] is set), then returns [true].
  /// Otherwise returns [false].
  @override
  bool isViolatedOn(String input) {
    assert(input != null);

    final regExForLowerCaseCharacters =
        RegExp('[a-z]{$minCharactersRequired,${maxCharactersAllowed ?? ''}}');
    return !regExForLowerCaseCharacters.hasMatch(input);
  }
}

/// Constraint to disallowing any lower case characters in the input.
class AvoidLowerCaseCharactersConstraint implements InputConstraint {
  @override
  final String violationMessage;

  AvoidLowerCaseCharactersConstraint({this.violationMessage = ''})
      : assert(violationMessage != null);

  /// If input contains even one lower case character, then returns [true].
  /// Otherwise returns [false].
  @override
  bool isViolatedOn(String input) {
    assert(input != null);

    final regExForLowerCaseCharacters = RegExp('[a-z]');

    return regExForLowerCaseCharacters.hasMatch(input);
  }
}

/// Constraint on digts being present in the input.
class DigitsRequiredConstraint implements InputConstraint {
  static const int defaultMinDigitsRequired = 1;

  /// Minimum number of digits that need to be present in the input.
  final int minDigitsRequired;

  /// Maximum number of digits that can be present in the input.
  final int maxDigitsAllowed;

  @override
  final String violationMessage;

  DigitsRequiredConstraint({
    this.minDigitsRequired = DigitsRequiredConstraint.defaultMinDigitsRequired,
    this.maxDigitsAllowed,
    this.violationMessage = '',
  })  : assert(minDigitsRequired != null),
        assert(
            maxDigitsAllowed != null || maxDigitsAllowed >= minDigitsRequired),
        assert(violationMessage != null);

  /// If [input] contains atleast [minDigitsRequired] number of digits
  /// (and contains at most [maxDigitsAllowed] numbers of digits
  /// if [maxDigitsAllowed] is set), then returns [true].
  /// Otherwise returns [false].
  @override
  bool isViolatedOn(String input) {
    assert(input != null);

    final regExForDigits =
        RegExp('[0-9]{$minDigitsRequired,${maxDigitsAllowed ?? ''}}');
    return !regExForDigits.hasMatch(input);
  }
}

/// Constraint to disallowing any digits in the input.
class AvoidDigitsConstraint implements InputConstraint {
  @override
  final String violationMessage;

  AvoidDigitsConstraint({this.violationMessage = ''})
      : assert(violationMessage != null);

  /// If input contains even one digit, then returns [true].
  /// Otherwise returns [false].
  @override
  bool isViolatedOn(String input) {
    assert(input != null);

    final regExForDigits = RegExp('[0-9]');

    return regExForDigits.hasMatch(input);
  }
}

/// Constraint on a list of special characters being present in the input.
class SpecialCharactersRequiredConstraint implements InputConstraint {
  /// A list of characters that need to be present in the input.
  final List<String> specialCharacters;

  @override
  final String violationMessage;

  SpecialCharactersRequiredConstraint({
    @required this.specialCharacters,
    this.violationMessage = '',
  })  : assert(specialCharacters != null),
        assert(violationMessage != null);

  /// If input contains all the characters in the list of [specialCharacters], then returns [true].
  /// Otherwise returns [false].
  @override
  bool isViolatedOn(String input) {
    for (var specialCharacter in specialCharacters) {
      if (!input.contains(specialCharacter)) {
        return true;
      }
    }

    return false;
  }
}

/// Constraint on a list of special words being present in the input.
class SpecialWordsRequiredConstraint implements InputConstraint {
  /// A list of words that need to be present in the input.
  final List<String> specialWords;

  @override
  final String violationMessage;

  SpecialWordsRequiredConstraint({
    @required this.specialWords,
    this.violationMessage = '',
  })  : assert(specialWords != null),
        assert(violationMessage != null);

  /// If input contains all the word in the list of [specialWords], then returns [true].
  /// Otherwise returns [false].
  @override
  bool isViolatedOn(String input) {
    for (var specialWord in specialWords) {
      if (!input.contains(specialWord)) {
        return false;
      }
    }

    return true;
  }
}

/// Constraint on a list of black list characters being NOT present in the input.
class BlackListedCharactersConstraint implements InputConstraint {
  /// A list of characters that are black listed, i.e. shouldn't be present in the input.
  final List<String> blackListedCharacters;

  @override
  final String violationMessage;

  BlackListedCharactersConstraint({
    @required this.blackListedCharacters,
    this.violationMessage = '',
  })  : assert(blackListedCharacters != null),
        assert(violationMessage != null);

  /// If any character in the list of [blackListedCharacters] is present in the input, returns [true].
  /// Otherwise returns [false].
  @override
  bool isViolatedOn(String input) {
    for (var blackListedCharacter in blackListedCharacters) {
      if (input.contains(blackListedCharacter)) {
        return true;
      }
    }

    return false;
  }
}

/// Constraint on a list of black list words being NOT present in the input.
class BlackListedWordsConstraint implements InputConstraint {
  /// A list of words that are black listed, i.e. shouldn't be present in the input.
  final List<String> blackListedWords;

  @override
  final String violationMessage;

  BlackListedWordsConstraint({
    @required this.blackListedWords,
    this.violationMessage = '',
  })  : assert(blackListedWords != null),
        assert(violationMessage != null);

  /// If any word in the list of [blackListedCharacters] is present in the input, returns [true].
  /// Otherwise returns [false].
  @override
  bool isViolatedOn(String input) {
    for (var blackListedWord in blackListedWords) {
      if (input.contains(blackListedWord)) {
        return true;
      }
    }

    return false;
  }
}

/// Constraint on limiting the number of times any character in the input can repeat.
class AvoidRepeatingCharactersConstraint implements InputConstraint {
  static const int defaultMaxNumberOfRepetitionsAllowed = 2;

  /// Maximum number of times any character in the input is allowed to be repeated.
  final int maxNumberOfRepetitionsAllowed;

  @override
  final String violationMessage;

  AvoidRepeatingCharactersConstraint({
    this.maxNumberOfRepetitionsAllowed =
        AvoidRepeatingCharactersConstraint.defaultMaxNumberOfRepetitionsAllowed,
    this.violationMessage = '',
  }) : assert(maxNumberOfRepetitionsAllowed != null);

  /// If any character is repeated more then [maxNumberOfRepetitionsAllowed] times, then returns [true].
  /// Otherwise returns [false].
  @override
  bool isViolatedOn(String input) {
    assert(input != null);
    final charactersCountTable = <String, int>{};

    for (var i = 0; i < input.length; ++i) {
      if (charactersCountTable.containsKey(input[i])) {
        charactersCountTable[input[i]] += 1;
      } else {
        charactersCountTable[input[i]] = 1;
      }
    }

    for (var characterCount in charactersCountTable.entries) {
      if (characterCount.value > maxNumberOfRepetitionsAllowed) {
        return false;
      }
    }

    return true;
  }
}

/// Constraint on limiting the number of times any alphabet in the input can repeat.
class AvoidRepeatingAlphabetsConstraint implements InputConstraint {
  static const int defaultMaxNumberOfRepetitionsAllowed = 2;

  /// Maximum number of times any alphabet in the input is allowed to be repeated.
  final int maxNumberOfRepetitionsAllowed;

  @override
  final String violationMessage;

  AvoidRepeatingAlphabetsConstraint({
    this.maxNumberOfRepetitionsAllowed =
        AvoidRepeatingAlphabetsConstraint.defaultMaxNumberOfRepetitionsAllowed,
    this.violationMessage = '',
  }) : assert(maxNumberOfRepetitionsAllowed != null);

  /// If any alphabet is repeated more then [maxNumberOfRepetitionsAllowed] times, then returns [true].
  /// Otherwise returns [false].
  @override
  bool isViolatedOn(String input) {
    assert(input != null);
    final charactersCountTable = <String, int>{};

    for (var i = 0; i < input.length; ++i) {
      if (input[i].hasAlphabets) {
        if (charactersCountTable.containsKey(input[i])) {
          charactersCountTable[input[i]] += 1;
        } else {
          charactersCountTable[input[i]] = 1;
        }
      }
    }

    for (var characterCount in charactersCountTable.entries) {
      if (characterCount.value > maxNumberOfRepetitionsAllowed) {
        return false;
      }
    }

    return true;
  }
}

/// Constraint on limiting the number of times any digit in the input can repeat.
class AvoidRepeatingDigitsConstraint implements InputConstraint {
  static const int defaultmaxNumberOfRepetitionsAllowed = 2;

  /// Maximum number of times any digit in the input is allowed to be repeated.
  final int maxNumberOfRepetitionsAllowed;

  @override
  final String violationMessage;

  AvoidRepeatingDigitsConstraint({
    this.maxNumberOfRepetitionsAllowed =
        AvoidRepeatingDigitsConstraint.defaultmaxNumberOfRepetitionsAllowed,
    this.violationMessage = '',
  }) : assert(maxNumberOfRepetitionsAllowed != null);

  @override
  bool isViolatedOn(String input) {
    assert(input != null);
    final charactersCountTable = <String, int>{};

    for (var i = 0; i < input.length; ++i) {
      if (input[i].hasDigits) {
        if (charactersCountTable.containsKey(input[i])) {
          charactersCountTable[input[i]] += 1;
        } else {
          charactersCountTable[input[i]] = 1;
        }
      }
    }

    for (var characterCount in charactersCountTable.entries) {
      if (characterCount.value > maxNumberOfRepetitionsAllowed) {
        return false;
      }
    }

    return true;
  }
}

/// Constraint on limiting the number of a times any character in the input to repeat consecutively.
class AvoidConsecutivelyRepeatingCharactersConstraint
    implements InputConstraint {
  static const int defaultMaxNumberOfRepetitionsAllowed = 2;

  /// Maximum number of times any character in the input is allowed to be repeated consecutively.
  final int maxNumberOfRepetitionsAllowed;

  AvoidConsecutivelyRepeatingCharactersConstraint({
    this.maxNumberOfRepetitionsAllowed =
        AvoidConsecutivelyRepeatingCharactersConstraint
            .defaultMaxNumberOfRepetitionsAllowed,
    this.violationMessage = '',
  })  : assert(maxNumberOfRepetitionsAllowed != null),
        assert(violationMessage != null);

  @override
  final String violationMessage;

  /// If any character is repeated consecutively more then [maxNumberOfRepetitionsAllowed] times,
  /// then returns [true].
  /// Otherwise returns [false].
  @override
  bool isViolatedOn(String input) {
    assert(input != null);

    for (var i = 0; i < input.length; ++i) {
      if (i + maxNumberOfRepetitionsAllowed <= input.length &&
          input
              .substring(i, i + maxNumberOfRepetitionsAllowed)
              .hasAllIdenticalCharacters) {
        return true;
      }
    }

    return false;
  }
}

/// Constraint on limiting the number of a times any alphabet in the input to repeat consecutively.
class AvoidConsecutivelyRepeatingAlphabetsConstraint
    implements InputConstraint {
  static const int defaultmaxNumberOfRepetitionsAllowed = 2;

  /// Maximum number of times any alphabet in the input is allowed to be repeated consecutively.
  final int maxNumberOfRepetitionsAllowed;

  @override
  final String violationMessage;

  AvoidConsecutivelyRepeatingAlphabetsConstraint({
    this.maxNumberOfRepetitionsAllowed =
        AvoidConsecutivelyRepeatingDigitsConstraint
            .defaultmaxNumberOfRepetitionsAllowed,
    this.violationMessage = '',
  })  : assert(maxNumberOfRepetitionsAllowed != null),
        assert(violationMessage != null);

  /// If any alphabet is repeated consecutively more then [maxNumberOfRepetitionsAllowed] times,
  /// then returns [true].
  /// Otherwise returns [false].
  @override
  bool isViolatedOn(String input) {
    assert(input != null);

    for (var i = 0; i < input.length; ++i) {
      if (i + maxNumberOfRepetitionsAllowed <= input.length &&
          input
              .substring(i, i + maxNumberOfRepetitionsAllowed)
              .hasAllIdenticalAlphabets) {
        return true;
      }
    }

    return false;
  }
}

/// Constraint on limiting the number of a times any digit in the input to repeat consecutively.
class AvoidConsecutivelyRepeatingDigitsConstraint implements InputConstraint {
  static const int defaultmaxNumberOfRepetitionsAllowed = 2;

  /// Maximum number of times any digit in the input is allowed to be repeated consecutively.
  final int maxNumberOfRepetitionsAllowed;

  @override
  final String violationMessage;

  AvoidConsecutivelyRepeatingDigitsConstraint({
    this.maxNumberOfRepetitionsAllowed =
        AvoidConsecutivelyRepeatingDigitsConstraint
            .defaultmaxNumberOfRepetitionsAllowed,
    this.violationMessage = '',
  })  : assert(maxNumberOfRepetitionsAllowed != null),
        assert(violationMessage != null);

  /// If any digit is repeated consecutively more then [maxNumberOfRepetitionsAllowed] times,
  /// then returns [true].
  /// Otherwise returns [false].
  @override
  bool isViolatedOn(String input) {
    assert(input != null);

    for (var i = 0; i < input.length; ++i) {
      if (i + maxNumberOfRepetitionsAllowed <= input.length &&
          input
              .substring(i, i + maxNumberOfRepetitionsAllowed)
              .hasAllIdenticalDigits) {
        return true;
      }
    }

    return false;
  }
}

/// Constraint on limiting the length of sequence of consecutive characters.
class AvoidSequentialCharactersConstraint implements InputConstraint {
  static const int defaultMaxSequenceLength = 3;

  /// Maximum length of the sequence of consecutve characters.
  final int maxSequenceLength;

  @override
  final String violationMessage;

  AvoidSequentialCharactersConstraint({
    this.maxSequenceLength =
        AvoidSequentialCharactersConstraint.defaultMaxSequenceLength,
    this.violationMessage = '',
  })  : assert(maxSequenceLength != null),
        assert(maxSequenceLength > 1);

  /// If any sequenc with alphabetically consecutive characters is found
  /// with length > [mexSequenceLength], returns [true].
  /// Otherwise returns [false].
  @override
  bool isViolatedOn(String input) {
    assert(input != null);

    for (var i = 0; i < input.length; ++i) {
      if (i + maxSequenceLength <= input.length &&
          input
              .substring(i, i + maxSequenceLength)
              .hasOnlyConsecutiveCharacters) {
        return true;
      }
    }

    return false;
  }
}

/// Constraint on limiting the length of sequence of alphabetically consecutive letters.
class AvoidSequentialAlphabetsConstraint implements InputConstraint {
  static const int defaultMaxSequenceLength = 3;

  /// Maximum length of the sequence of alphabetically consecutve characters.
  final int maxSequenceLength;

  @override
  final String violationMessage;

  AvoidSequentialAlphabetsConstraint({
    this.maxSequenceLength =
        AvoidSequentialAlphabetsConstraint.defaultMaxSequenceLength,
    this.violationMessage = '',
  })  : assert(maxSequenceLength != null),
        assert(maxSequenceLength > 1);

  /// If any sequenc with alphabetically consecutive characters is found
  /// with length > [mexSequenceLength], returns [true].
  /// Otherwise returns [false].
  @override
  bool isViolatedOn(String input) {
    assert(input != null);

    for (var i = 0; i < input.length; ++i) {
      if (i + maxSequenceLength <= input.length &&
          input
              .substring(i, i + maxSequenceLength)
              .hasOnlyConsecutiveAlphabets) {
        return true;
      }
    }

    return false;
  }
}

/// Constraint on limiting the length of sequence of numerically consecutive digits.
class AvoidSequentialDigitsConstraint implements InputConstraint {
  static const int defaultMaxSequenceLength = 3;

  /// Maximum length of the sequence of numerically consecutive digits.
  final int maxSequenceLength;

  @override
  final String violationMessage;

  AvoidSequentialDigitsConstraint({
    this.maxSequenceLength =
        AvoidSequentialDigitsConstraint.defaultMaxSequenceLength,
    this.violationMessage = '',
  })  : assert(maxSequenceLength != null),
        assert(maxSequenceLength > 1);

  /// If any sequenc with numerically consecutive digits is found
  /// with length > [mexSequenceLength], returns [true].
  /// Otherwise returns [false].
  @override
  bool isViolatedOn(String input) {
    assert(input != null);

    for (var i = 0; i < input.length; ++i) {
      if (i + maxSequenceLength <= input.length &&
          input.substring(i, i + maxSequenceLength).hasOnlyConsecutiveDigits) {
        return true;
      }
    }

    return false;
  }
}

extension _StringX on String {
  bool get hasAlphabets => RegExp('[A-Za-z]').hasMatch(this);

  bool get hasDigits => RegExp('[0-9]').hasMatch(this);

  bool get hasAllIdenticalCharacters {
    assert(length != 0);

    for (var i = 0; i < length; ++i) {
      if (i + 1 < length && this[i] != this[i + 1]) {
        return false;
      }
    }

    return true;
  }

  bool get hasAllIdenticalAlphabets {
    assert(length != 0);

    for (var i = 0; i < length; ++i) {
      if (i + 1 < length && this[i].hasAlphabets && this[i] != this[i + 1]) {
        return false;
      }
    }

    return true;
  }

  bool get hasAllIdenticalDigits {
    assert(length != 0);

    for (var i = 0; i < length; ++i) {
      if (i + 1 < length && this[i].hasDigits && this[i] != this[i + 1]) {
        return false;
      }
    }

    return true;
  }

  bool get hasOnlyConsecutiveCharacters {
    assert(length != 0);

    for (var i = 0; i < length; ++i) {
      if (i + 1 < length && this[i].compareTo(this[i + 1]) != -1) {
        return false;
      }
    }

    return true;
  }

  bool get hasOnlyConsecutiveAlphabets {
    assert(length != 0);

    for (var i = 0; i < length; ++i) {
      if (i + 1 < length &&
          this[i].hasAllIdenticalCharacters &&
          this[i].compareTo(this[i + 1]) != -1) {
        return false;
      }
    }

    return true;
  }

  bool get hasOnlyConsecutiveDigits {
    assert(length != 0);

    for (var i = 0; i < length; ++i) {
      if (i + 1 < length &&
          this[i].hasDigits &&
          this[i].compareTo(this[i + 1]) != -1) {
        return false;
      }
    }

    return true;
  }
}
