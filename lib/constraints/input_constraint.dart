import 'package:meta/meta.dart';

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
  /// If input violates the constraints, returns [true].
  /// Otherwise returns [false].
  bool isViolatedOn(String input);
}

/// Constraint on the maximum length of the input.
class MaximumLengthLimitingConstraint extends InputConstraint {
  static const int defaultMaxLength = 64;

  /// Length beyond which the input is said to be violating the constraint.
  final int maxLength;

  MaximumLengthLimitingConstraint({
    this.maxLength = MaximumLengthLimitingConstraint.defaultMaxLength,
    String violationMessage = 'MaximumLengthLimiting constraint violated',
  })  : assert(maxLength != null),
        assert(maxLength >= 0),
        super(violationMessage);

  /// If [input.length] > [maxLength], returns [true].
  /// Otherwise returns [false].
  @override
  bool isViolatedOn(String input) {
    assert(input != null);

    return input.length > maxLength;
  }
}

/// Constraint on the minimum length of the input.
class MinimumLengthRequiredConstraint extends InputConstraint {
  static const int defaultMinLength = 8;

  /// Length below which the input is said to be violating the constraint.
  final int minLength;

  MinimumLengthRequiredConstraint({
    this.minLength = MinimumLengthRequiredConstraint.defaultMinLength,
    String violationMessage = 'MinimumLengthRequired constraint violated',
  })  : assert(minLength != null),
        assert(minLength >= 0),
        super(violationMessage);

  /// If [input.length] < [minLength], then returns [true].
  /// Otherwise returns [false].
  @override
  bool isViolatedOn(String input) {
    assert(input != null);

    return input.length < minLength;
  }
}

/// Constraint on upper case characters being present in the input.
class UpperCaseCharactersRequiredConstraint extends InputConstraint {
  static const int defaultMinCharactersRequired = 1;

  /// Minimum number of characters that need to be upper cased.
  final int minCharactersRequired;

  /// Maximum number of characters that can be upper cased.
  final int maxCharactersAllowed;

  UpperCaseCharactersRequiredConstraint({
    this.minCharactersRequired =
        UpperCaseCharactersRequiredConstraint.defaultMinCharactersRequired,
    this.maxCharactersAllowed,
    String violationMessage = 'UpperCaseCharactersRequired constraint violated',
  })  : assert(minCharactersRequired != null),
        assert(minCharactersRequired >= 0),
        assert(maxCharactersAllowed == null ||
            maxCharactersAllowed >= minCharactersRequired),
        super(violationMessage);

  /// If [input] contains atleast [minCharactersRequired] number of upper case characters
  /// (and contains at most [maxCharactersAllowed] numbers of upper case characters
  /// if [maxCharactersAllowed] is set), then returns [true].
  /// Otherwise returns [false].
  @override
  bool isViolatedOn(String input) {
    assert(input != null);

    return !input.hasUpperCaseCharacters;
  }
}

/// Constraint to disallow any upper case characters in the input.
class AvoidUpperCaseCharactersConstraint extends InputConstraint {
  AvoidUpperCaseCharactersConstraint({
    String violationMessage = 'AvoidUpperCaseCharacters constraint violated',
  }) : super(violationMessage);

  /// If input contains even one upper case character, then returns [true].
  /// Otherwise returns [false].
  @override
  bool isViolatedOn(String input) {
    assert(input != null);

    return input.hasUpperCaseCharacters;
  }
}

/// Constraint on lower case characters being present in the input.
class LowerCaseCharactersRequiredConstraint extends InputConstraint {
  static const int defaultMinCharactersRequired = 1;

  /// Minimum number of characters that need to be lower cased.
  final int minCharactersRequired;

  /// Maximum number of characters that can be lower cased.
  final int maxCharactersAllowed;

  LowerCaseCharactersRequiredConstraint({
    this.minCharactersRequired =
        LowerCaseCharactersRequiredConstraint.defaultMinCharactersRequired,
    this.maxCharactersAllowed,
    String violationMessage = 'LowerCaseCharactersRequired constraint violated',
  })  : assert(minCharactersRequired != null),
        assert(minCharactersRequired >= 0),
        assert(maxCharactersAllowed == null ||
            maxCharactersAllowed >= minCharactersRequired),
        super(violationMessage);

  /// If [input] contains atleast [minCharactersRequired] number of lower case characters
  /// (and contains at most [maxCharactersAllowed] numbers of lower case characters
  /// if [maxCharactersAllowed] is set), then returns [true].
  /// Otherwise returns [false].
  @override
  bool isViolatedOn(String input) {
    assert(input != null);

    return !input.hasLowerCaseCharacters;
  }
}

/// Constraint to disallow any lower case characters in the input.
class AvoidLowerCaseCharactersConstraint extends InputConstraint {
  AvoidLowerCaseCharactersConstraint({
    String violationMessage = 'AvoidLowerCaseCharacters constraint violated',
  }) : super(violationMessage);

  /// If input contains even one lower case character, then returns [true].
  /// Otherwise returns [false].
  @override
  bool isViolatedOn(String input) {
    assert(input != null);

    return input.hasLowerCaseCharacters;
  }
}

/// Constraint on digts being present in the input.
class DigitsRequiredConstraint extends InputConstraint {
  static const int defaultMinDigitsRequired = 1;

  /// Minimum number of digits that need to be present in the input.
  final int minDigitsRequired;

  /// Maximum number of digits that can be present in the input.
  final int maxDigitsAllowed;

  DigitsRequiredConstraint({
    this.minDigitsRequired = DigitsRequiredConstraint.defaultMinDigitsRequired,
    this.maxDigitsAllowed,
    String violationMessage = 'DigitsRequired constraint violated',
  })  : assert(minDigitsRequired != null),
        assert(minDigitsRequired >= 0),
        assert(
            maxDigitsAllowed == null || maxDigitsAllowed >= minDigitsRequired),
        super(violationMessage);

  /// If [input] contains atleast [minDigitsRequired] number of digits
  /// (and contains at most [maxDigitsAllowed] numbers of digits
  /// if [maxDigitsAllowed] is set), then returns [true].
  /// Otherwise returns [false].
  @override
  bool isViolatedOn(String input) {
    assert(input != null);

    return !input.hasDigits;
  }
}

/// Constraint to disallow any digits in the input.
class AvoidDigitsConstraint extends InputConstraint {
  AvoidDigitsConstraint({
    String violationMessage = 'AvoidDigits constraint violated',
  }) : super(violationMessage);

  /// If input contains even one digit, then returns [true].
  /// Otherwise returns [false].
  @override
  bool isViolatedOn(String input) {
    assert(input != null);

    return input.hasDigits;
  }
}

/// Constraint on a list of special characters that may be present in the input.
class SpecialCharactersRequiredConstraint extends InputConstraint {
  /// A list of characters that may be present in the input.
  final List<String> specialCharacters;

  /// Indicates whether every character in the list need to be present in the input.
  ///
  /// Defaults to [false].
  final bool allNeedToBePresent;

  SpecialCharactersRequiredConstraint({
    @required this.specialCharacters,
    this.allNeedToBePresent = false,
    String violationMessage = 'SpecialCharactersRequired constraint violated',
  })  : assert(specialCharacters != null),
        assert(allNeedToBePresent != null),
        assert(
          specialCharacters.every((specialCharacter) =>
              specialCharacter != null && specialCharacter.length == 1),
          'Character strings cannot be null and should be exactly 1 character long',
        ),
        super(violationMessage);

  /// If input contains all the characters in the list of [specialCharacters], then returns [true].
  /// Otherwise returns [false].
  @override
  bool isViolatedOn(String input) {
    assert(input != null);

    if (allNeedToBePresent) {
      return !areAllSpecialCharactersPresentIn(input);
    } else {
      return !areAnySpecialCharactersPresentIn(input);
    }
  }

  bool areAllSpecialCharactersPresentIn(String input) {
    for (var specialCharacter in specialCharacters) {
      if (!input.contains(specialCharacter)) {
        return false;
      }
    }

    return true;
  }

  bool areAnySpecialCharactersPresentIn(String input) {
    var anyOnePresent = false;

    for (var specialCharacter in specialCharacters) {
      if (input.contains(specialCharacter)) {
        anyOnePresent = true;
        break;
      }
    }

    return anyOnePresent;
  }
}

/// Constraint on a list of special word that may be present in the input.
class SpecialWordsRequiredConstraint extends InputConstraint {
  /// A list of words that may be present in the input.
  final List<String> specialWords;

  /// Indicates whether every word in the list need to be present in the input.
  ///
  /// Defaults to [false].
  final bool allNeedToBePresent;

  SpecialWordsRequiredConstraint({
    @required this.specialWords,
    this.allNeedToBePresent = false,
    String violationMessage = 'SpecialWordsRequired constraint violated',
  })  : assert(specialWords != null),
        assert(allNeedToBePresent != null),
        assert(specialWords.every((specialWord) => specialWord != null)),
        super(violationMessage);

  /// If input contains all the word in the list of [specialWords], then returns [true].
  /// Otherwise returns [false].
  @override
  bool isViolatedOn(String input) {
    assert(input != null);

    if (allNeedToBePresent) {
      return !areAllSpecialWordsPresentIn(input);
    } else {
      return !areAnySpecialWordsPresentIn(input);
    }
  }

  bool areAllSpecialWordsPresentIn(String input) {
    for (var specialWord in specialWords) {
      if (!input.contains(specialWord)) {
        return false;
      }
    }

    return true;
  }

  bool areAnySpecialWordsPresentIn(String input) {
    var anyOnePresent = false;

    for (var specialWord in specialWords) {
      if (input.contains(specialWord)) {
        anyOnePresent = true;
        break;
      }
    }

    return anyOnePresent;
  }
}

/// Constraint on disallowing a list of black listed characters from the input.
class BlackListedCharactersConstraint extends InputConstraint {
  /// A list of characters that are black listed, i.e. shouldn't be present in the input.
  final List<String> blackListedCharacters;

  BlackListedCharactersConstraint({
    @required this.blackListedCharacters,
    String violationMessage = 'BlackListedCharacters constraint violated',
  })  : assert(blackListedCharacters != null),
        assert(
          blackListedCharacters.every((blackListedCharacter) =>
              blackListedCharacter != null && blackListedCharacter.length == 1),
          'Character strings cannot be null and should be exactly 1 character long',
        ),
        super(violationMessage);

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

/// Constraint on disallowing a list of black listed words from the input.
class BlackListedWordsConstraint extends InputConstraint {
  /// A list of words that are black listed, i.e. shouldn't be present in the input.
  final List<String> blackListedWords;

  BlackListedWordsConstraint({
    @required this.blackListedWords,
    String violationMessage = 'BlackListedWords constraint violated',
  })  : assert(blackListedWords != null),
        assert(blackListedWords
            .every((blackListedWord) => blackListedWord != null)),
        super(violationMessage);

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
class AvoidRepeatingCharactersConstraint extends InputConstraint {
  static const int defaultMaxNumberOfRepetitionsAllowed = 2;

  /// Maximum number of times any character in the input is allowed to be repeated.
  final int maxNumberOfRepetitionsAllowed;

  AvoidRepeatingCharactersConstraint({
    this.maxNumberOfRepetitionsAllowed =
        AvoidRepeatingCharactersConstraint.defaultMaxNumberOfRepetitionsAllowed,
    String violationMessage = 'AvoidRepeatingCharacters constraint violated',
  })  : assert(maxNumberOfRepetitionsAllowed != null),
        assert(maxNumberOfRepetitionsAllowed >= 0),
        super(violationMessage);

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
class AvoidRepeatingAlphabetsConstraint extends InputConstraint {
  static const int defaultMaxNumberOfRepetitionsAllowed = 2;

  /// Maximum number of times any alphabet in the input is allowed to be repeated.
  final int maxNumberOfRepetitionsAllowed;

  AvoidRepeatingAlphabetsConstraint({
    this.maxNumberOfRepetitionsAllowed =
        AvoidRepeatingAlphabetsConstraint.defaultMaxNumberOfRepetitionsAllowed,
    String violationMessage = 'AvoidRepeatingAlphabets constraint violated',
  })  : assert(maxNumberOfRepetitionsAllowed != null),
        assert(maxNumberOfRepetitionsAllowed >= 0),
        super(violationMessage);

  /// If any alphabet is repeated more then [maxNumberOfRepetitionsAllowed] times, then returns [true].
  /// Otherwise returns [false].
  @override
  bool isViolatedOn(String input) {
    assert(input != null);
    final alphabetsCountTable = <String, int>{};

    for (var i = 0; i < input.length; ++i) {
      if (input[i].hasAlphabets) {
        if (alphabetsCountTable.containsKey(input[i])) {
          alphabetsCountTable[input[i]] += 1;
        } else {
          alphabetsCountTable[input[i]] = 1;
        }
      }
    }

    for (var characterCount in alphabetsCountTable.entries) {
      if (characterCount.value > maxNumberOfRepetitionsAllowed) {
        return false;
      }
    }

    return true;
  }
}

/// Constraint on limiting the number of times any digit in the input can repeat.
class AvoidRepeatingDigitsConstraint extends InputConstraint {
  static const int defaultmaxNumberOfRepetitionsAllowed = 2;

  /// Maximum number of times any digit in the input is allowed to be repeated.
  final int maxNumberOfRepetitionsAllowed;

  AvoidRepeatingDigitsConstraint({
    this.maxNumberOfRepetitionsAllowed =
        AvoidRepeatingDigitsConstraint.defaultmaxNumberOfRepetitionsAllowed,
    String violationMessage = 'AvoidRepeatingDigits constraint violated',
  })  : assert(maxNumberOfRepetitionsAllowed != null),
        assert(maxNumberOfRepetitionsAllowed >= 0),
        super(violationMessage);

  @override
  bool isViolatedOn(String input) {
    assert(input != null);
    final digitsCountTable = <String, int>{};

    for (var i = 0; i < input.length; ++i) {
      if (input[i].hasDigits) {
        if (digitsCountTable.containsKey(input[i])) {
          digitsCountTable[input[i]] += 1;
        } else {
          digitsCountTable[input[i]] = 1;
        }
      }
    }

    for (var characterCount in digitsCountTable.entries) {
      if (characterCount.value > maxNumberOfRepetitionsAllowed) {
        return false;
      }
    }

    return true;
  }
}

/// Constraint on limiting the number of a times any character in the input to repeat consecutively.
class AvoidConsecutivelyRepeatingCharactersConstraint extends InputConstraint {
  static const int defaultMaxNumberOfRepetitionsAllowed = 2;

  /// Maximum number of times any character in the input is allowed to be repeated consecutively.
  final int maxNumberOfRepetitionsAllowed;

  AvoidConsecutivelyRepeatingCharactersConstraint({
    this.maxNumberOfRepetitionsAllowed =
        AvoidConsecutivelyRepeatingCharactersConstraint
            .defaultMaxNumberOfRepetitionsAllowed,
    String violationMessage =
        'AvoidConsecutivelyRepeatingCharacters constraint violated',
  })  : assert(maxNumberOfRepetitionsAllowed != null),
        assert(maxNumberOfRepetitionsAllowed >= 0),
        super(violationMessage);

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
class AvoidConsecutivelyRepeatingAlphabetsConstraint extends InputConstraint {
  static const int defaultmaxNumberOfRepetitionsAllowed = 2;

  /// Maximum number of times any alphabet in the input is allowed to be repeated consecutively.
  final int maxNumberOfRepetitionsAllowed;

  AvoidConsecutivelyRepeatingAlphabetsConstraint({
    this.maxNumberOfRepetitionsAllowed =
        AvoidConsecutivelyRepeatingDigitsConstraint
            .defaultmaxNumberOfRepetitionsAllowed,
    String violationMessage =
        'AvoidConsecutivelyRepeatingAlphabets constraint violated',
  })  : assert(maxNumberOfRepetitionsAllowed != null),
        assert(maxNumberOfRepetitionsAllowed >= 0),
        super(violationMessage);

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
class AvoidConsecutivelyRepeatingDigitsConstraint extends InputConstraint {
  static const int defaultmaxNumberOfRepetitionsAllowed = 2;

  /// Maximum number of times any digit in the input is allowed to be repeated consecutively.
  final int maxNumberOfRepetitionsAllowed;

  AvoidConsecutivelyRepeatingDigitsConstraint({
    this.maxNumberOfRepetitionsAllowed =
        AvoidConsecutivelyRepeatingDigitsConstraint
            .defaultmaxNumberOfRepetitionsAllowed,
    String violationMessage =
        'AvoidConsecutivelyRepeatingDigits constraint violated',
  })  : assert(maxNumberOfRepetitionsAllowed != null),
        assert(maxNumberOfRepetitionsAllowed >= 0),
        super(violationMessage);

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
class AvoidSequentialCharactersConstraint extends InputConstraint {
  static const int defaultMaxSequenceLength = 3;

  /// Maximum length of the sequence of consecutve characters.
  final int maxSequenceLength;

  AvoidSequentialCharactersConstraint({
    this.maxSequenceLength =
        AvoidSequentialCharactersConstraint.defaultMaxSequenceLength,
    String violationMessage = 'AvoidSequentialCharacters constraint violated',
  })  : assert(maxSequenceLength != null),
        assert(maxSequenceLength > 1),
        super(violationMessage);

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
class AvoidSequentialAlphabetsConstraint extends InputConstraint {
  static const int defaultMaxSequenceLength = 3;

  /// Maximum length of the sequence of alphabetically consecutve characters.
  final int maxSequenceLength;

  AvoidSequentialAlphabetsConstraint({
    this.maxSequenceLength =
        AvoidSequentialAlphabetsConstraint.defaultMaxSequenceLength,
    String violationMessage = 'AvoidSequentialAlphabets constraint violated',
  })  : assert(maxSequenceLength != null),
        assert(maxSequenceLength > 1),
        super(violationMessage);

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
class AvoidSequentialDigitsConstraint extends InputConstraint {
  static const int defaultMaxSequenceLength = 3;

  /// Maximum length of the sequence of numerically consecutive digits.
  final int maxSequenceLength;

  AvoidSequentialDigitsConstraint({
    this.maxSequenceLength =
        AvoidSequentialDigitsConstraint.defaultMaxSequenceLength,
    String violationMessage = 'AvoidSequentialDigits constraint violated',
  })  : assert(maxSequenceLength != null),
        assert(maxSequenceLength > 1),
        super(violationMessage);

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

/// Constraint on avoiding empty inputs.
class AvoidEmptinessConstraint extends InputConstraint {
  AvoidEmptinessConstraint({
    String violationMessage = 'AvoidEmptiness constraint violated',
  }) : super(violationMessage);

  /// If the input is empty, then returns [true].
  /// Otherwise returns [false].
  @override
  bool isViolatedOn(String input) {
    assert(input != null);

    return input.isEmpty;
  }
}

extension _StringX on String {
  bool get hasAlphabets => RegExp('[A-Za-z]').hasMatch(this);

  bool get hasUpperCaseCharacters => RegExp('[A-Z]').hasMatch(this);

  bool get hasLowerCaseCharacters => RegExp('[a-z]').hasMatch(this);

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
      if (i + 1 < length &&
          this[i].codeUnitAt(0) + 1 != this[i + 1].codeUnitAt(0)) {
        return false;
      }
    }

    return true;
  }

  bool get hasOnlyConsecutiveAlphabets {
    assert(length != 0);

    for (var i = 0; i < length; ++i) {
      if (i + 1 < length &&
          this[i].hasAlphabets &&
          this[i].codeUnitAt(0) + 1 != this[i + 1].codeUnitAt(0)) {
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
          this[i].codeUnitAt(0) + 1 != this[i + 1].codeUnitAt(0)) {
        return false;
      }
    }

    return true;
  }
}
