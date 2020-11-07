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
  /// If input violates the constraints, returns `true`.
  /// Otherwise returns `false`.
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

  /// If [input.length] > [maxLength], returns `true`.
  /// Otherwise returns `false`.
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

  /// If [input.length] < [minLength], then returns `true`.
  /// Otherwise returns `false`.
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
  /// if [maxCharactersAllowed] is set), then returns `true`.
  /// Otherwise returns `false`.
  @override
  bool isViolatedOn(String input) {
    assert(input != null);

    final upperCaseCharactersRegExp =
        RegExp('[A-Z]{$minCharactersRequired,${maxCharactersAllowed ?? ''}}');

    return !upperCaseCharactersRegExp.hasMatch(input);
  }
}

/// Constraint to ensure that every character in the input is upper cased.
class AllUpperCaseCharactersConstraint extends InputConstraint {
  AllUpperCaseCharactersConstraint({
    String violationMessage = 'AllUpperCaseCharacters constraint violated',
  }) : super(violationMessage);

  /// If [input] constains any other characters other than only upper case characters, then returns `true`.
  ///
  /// Otherwise returns `false`.
  @override
  bool isViolatedOn(String input) {
    assert(input != null);

    return !input.hasAllUpperCaseCharacters;
  }
}

/// Constraint to disallow any upper case characters in the input.
class AvoidUpperCaseCharactersConstraint extends InputConstraint {
  AvoidUpperCaseCharactersConstraint({
    String violationMessage = 'AvoidUpperCaseCharacters constraint violated',
  }) : super(violationMessage);

  /// If input contains even one upper case character, then returns `true`.
  /// Otherwise returns `false`.
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
  /// if [maxCharactersAllowed] is set), then returns `true`.
  /// Otherwise returns `false`.
  @override
  bool isViolatedOn(String input) {
    assert(input != null);

    final lowerCaseCharactersRegExp =
        RegExp('[a-z]{$minCharactersRequired,${maxCharactersAllowed ?? ''}}');

    return !lowerCaseCharactersRegExp.hasMatch(input);
  }
}

/// Constraint to ensure that every character in the input is lower cased.
class AllLowerCaseCharactersConstraint extends InputConstraint {
  AllLowerCaseCharactersConstraint({
    String violationMessage = 'AllLowerCaseCharacters constraint violated',
  }) : super(violationMessage);

  /// If [input] constains any other characters other than only lower case characters, then returns `true`.
  ///
  /// Otherwise returns `false`.
  @override
  bool isViolatedOn(String input) {
    assert(input != null);

    return !input.hasAllLowerCaseCharacters;
  }
}

/// Constraint to disallow any lower case characters in the input.
class AvoidLowerCaseCharactersConstraint extends InputConstraint {
  AvoidLowerCaseCharactersConstraint({
    String violationMessage = 'AvoidLowerCaseCharacters constraint violated',
  }) : super(violationMessage);

  /// If input contains even one lower case character, then returns `true`.
  /// Otherwise returns `false`.
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
  /// if [maxDigitsAllowed] is set), then returns `true`.
  /// Otherwise returns `false`.
  @override
  bool isViolatedOn(String input) {
    assert(input != null);

    final digitsRegExp =
        RegExp('[0-9]{$minDigitsRequired,${maxDigitsAllowed ?? ''}}');

    return !digitsRegExp.hasMatch(input);
  }
}

/// Constraint to disallow any digits in the input.
class AvoidDigitsConstraint extends InputConstraint {
  AvoidDigitsConstraint({
    String violationMessage = 'AvoidDigits constraint violated',
  }) : super(violationMessage);

  /// If input contains even one digit, then returns `true`.
  /// Otherwise returns `false`.
  @override
  bool isViolatedOn(String input) {
    assert(input != null);

    return input.hasDigits;
  }
}

/// Constraint on a list of special characters that may be present in the input.
///
/// Special characters doesn't necessarily have to be special as per universal convention.
/// They may also include any characters that you think are special according to your
/// business need. E.g. The letter 'v' may be special for our business need.
class SpecialCharactersRequiredConstraint extends InputConstraint {
  /// A list of characters that may be present in the input.
  final List<String> specialCharacters;

  /// Indicates whether every character in the list need to be present in the input.
  ///
  /// Defaults to `false`.
  final bool allNeedToBePresent;

  /// Indicates whether evaluation should happen as is or by ignoring the case.
  ///
  /// Defaults to `false`.
  final bool caseInsensitive;

  SpecialCharactersRequiredConstraint({
    @required this.specialCharacters,
    this.allNeedToBePresent = false,
    this.caseInsensitive = false,
    String violationMessage = 'SpecialCharactersRequired constraint violated',
  })  : assert(specialCharacters != null),
        assert(specialCharacters.isNotEmpty),
        assert(allNeedToBePresent != null),
        assert(caseInsensitive != null),
        assert(
          specialCharacters.every((specialCharacter) =>
              specialCharacter != null && specialCharacter.length == 1),
          'Character strings cannot be null and should be exactly 1 character long',
        ),
        super(violationMessage);

  /// If input contains all the characters in the list of [specialCharacters],
  /// then returns `true`.
  ///
  /// Otherwise returns `false`.
  @override
  bool isViolatedOn(String input) {
    assert(input != null);

    if (allNeedToBePresent) {
      return !_areAllSpecialCharactersPresentIn(input);
    } else {
      return !_areAnySpecialCharactersPresentIn(input);
    }
  }

  /// Evaluates if every special character in the list of [specialCharacters]
  ///  is present in the input.
  bool _areAllSpecialCharactersPresentIn(String input) {
    for (var specialCharacter in specialCharacters) {
      if (caseInsensitive) {
        if (!input.toLowerCase().contains(specialCharacter.toLowerCase())) {
          return false;
        }
      } else {
        if (!input.contains(specialCharacter)) {
          return false;
        }
      }
    }

    return true;
  }

  /// Evaluates if at least any one special character from the list of
  /// [specialCharacters] is present in the input.
  bool _areAnySpecialCharactersPresentIn(String input) {
    for (var specialCharacter in specialCharacters) {
      if (caseInsensitive) {
        if (input.toLowerCase().contains(specialCharacter.toLowerCase())) {
          return true;
        }
      } else {
        if (input.contains(specialCharacter)) {
          return true;
        }
      }
    }

    return false;
  }
}

/// Constraint on a list of special words that may be present in the input.
class SpecialWordsRequiredConstraint extends InputConstraint {
  /// A list of words that may be present in the input.
  final List<String> specialWords;

  /// Indicates whether every word in the list need to be present in the input.
  ///
  /// Defaults to `false`.
  final bool allNeedToBePresent;

  /// Indicates whether evaluation should happen as is or by ignoring the case.
  ///
  /// Defaults to `false`.
  final bool caseInsensitive;

  SpecialWordsRequiredConstraint({
    @required this.specialWords,
    this.allNeedToBePresent = false,
    this.caseInsensitive = false,
    String violationMessage = 'SpecialWordsRequired constraint violated',
  })  : assert(specialWords != null),
        assert(specialWords.isNotEmpty),
        assert(allNeedToBePresent != null),
        assert(caseInsensitive != null),
        assert(specialWords.every((specialWord) => specialWord != null)),
        super(violationMessage);

  /// If input contains all the word in the list of [specialWords], then returns `true`.
  ///
  /// Otherwise returns `false`.
  @override
  bool isViolatedOn(String input) {
    assert(input != null);

    if (allNeedToBePresent) {
      return !_areAllSpecialWordsPresentIn(input);
    } else {
      return !_areAnySpecialWordsPresentIn(input);
    }
  }

  /// Evaluates if every special word in the list of [specialWords] is present in the input.
  bool _areAllSpecialWordsPresentIn(String input) {
    for (var specialWord in specialWords) {
      if (caseInsensitive) {
        if (!input.toLowerCase().contains(specialWord.toLowerCase())) {
          return false;
        }
      } else {
        if (!input.contains(specialWord)) {
          return false;
        }
      }
    }

    return true;
  }

  /// Evaluates if at least any one special word from the list of [specialWords] is present in the input.
  bool _areAnySpecialWordsPresentIn(String input) {
    for (var specialWord in specialWords) {
      if (caseInsensitive) {
        if (input.toLowerCase().contains(specialWord.toLowerCase())) {
          return true;
        }
      } else {
        if (input.contains(specialWord)) {
          return true;
        }
      }
    }

    return false;
  }
}

/// Constraint on disallowing a list of black listed characters from the input.
class BlackListedCharactersConstraint extends InputConstraint {
  /// A list of characters that are black listed, i.e. shouldn't be present in the input.
  final List<String> blackListedCharacters;

  /// Indicates whether evaluation should happen as is or by ignoring the case.
  ///
  /// Defaults to `false`.
  final bool caseInsensitive;

  BlackListedCharactersConstraint({
    @required this.blackListedCharacters,
    this.caseInsensitive = false,
    String violationMessage = 'BlackListedCharacters constraint violated',
  })  : assert(blackListedCharacters != null),
        assert(blackListedCharacters.isNotEmpty),
        assert(caseInsensitive != null),
        assert(
          blackListedCharacters.every((blackListedCharacter) =>
              blackListedCharacter != null && blackListedCharacter.length == 1),
          'Character strings cannot be null and should be exactly 1 character long',
        ),
        super(violationMessage);

  /// If any character in the list of [blackListedCharacters] is present in the input, returns `true`.
  ///
  /// Otherwise returns `false`.
  @override
  bool isViolatedOn(String input) {
    for (var blackListedCharacter in blackListedCharacters) {
      if (caseInsensitive) {
        if (input.toLowerCase().contains(blackListedCharacter.toLowerCase())) {
          return true;
        }
      } else {
        if (input.contains(blackListedCharacter)) {
          return true;
        }
      }
    }

    return false;
  }
}

/// Constraint on disallowing a list of black listed words from the input.
class BlackListedWordsConstraint extends InputConstraint {
  /// A list of words that are black listed, i.e. shouldn't be present in the input.
  final List<String> blackListedWords;

  /// Indicates whether evaluation should happen as is or by ignoring the case.
  ///
  /// Defaults to `false`.
  final bool caseInsensitive;

  BlackListedWordsConstraint({
    @required this.blackListedWords,
    this.caseInsensitive = false,
    String violationMessage = 'BlackListedWords constraint violated',
  })  : assert(blackListedWords != null),
        assert(blackListedWords.isNotEmpty),
        assert(caseInsensitive != null),
        assert(blackListedWords
            .every((blackListedWord) => blackListedWord != null)),
        super(violationMessage);

  /// If any word in the list of [blackListedCharacters] is present in the input, returns `true`.
  ///
  /// Otherwise returns `false`.
  @override
  bool isViolatedOn(String input) {
    for (var blackListedWord in blackListedWords) {
      if (caseInsensitive) {
        if (input.toLowerCase().contains(blackListedWord.toLowerCase())) {
          return true;
        }
      } else {
        if (input.contains(blackListedWord)) {
          return true;
        }
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

  /// Indicates whether evaluation should happen as is or by ignoring the case.
  ///
  /// Defaults to `false`.
  final bool caseInsensitive;

  AvoidRepeatingCharactersConstraint({
    this.maxNumberOfRepetitionsAllowed =
        AvoidRepeatingCharactersConstraint.defaultMaxNumberOfRepetitionsAllowed,
    this.caseInsensitive = false,
    String violationMessage = 'AvoidRepeatingCharacters constraint violated',
  })  : assert(maxNumberOfRepetitionsAllowed != null),
        assert(maxNumberOfRepetitionsAllowed >= 0),
        super(violationMessage);

  /// If any character is repeated more then [maxNumberOfRepetitionsAllowed] times, then returns `true`.
  /// Otherwise returns `false`.
  @override
  bool isViolatedOn(String input) {
    assert(input != null);
    final charactersCountTable = <String, int>{};

    for (var i = 0; i < input.length; ++i) {
      final characterAtCurrentIndex =
          caseInsensitive ? input[i].toLowerCase() : input[i];

      if (charactersCountTable.containsKey(characterAtCurrentIndex)) {
        charactersCountTable[characterAtCurrentIndex] += 1;
      } else {
        charactersCountTable[characterAtCurrentIndex] = 1;
      }
    }

    return charactersCountTable.values
        .where(
          (count) => count > maxNumberOfRepetitionsAllowed,
        )
        .isNotEmpty;
  }
}

/// Constraint on limiting the number of times any alphabet in the input can repeat.
class AvoidRepeatingAlphabetsConstraint extends InputConstraint {
  static const int defaultMaxNumberOfRepetitionsAllowed = 2;

  /// Maximum number of times any alphabet in the input is allowed to be repeated.
  final int maxNumberOfRepetitionsAllowed;

  /// Indicates whether evaluation should happen as is or by ignoring the case.
  ///
  /// Defaults to `false`.
  final bool caseInsensitive;

  AvoidRepeatingAlphabetsConstraint({
    this.maxNumberOfRepetitionsAllowed =
        AvoidRepeatingAlphabetsConstraint.defaultMaxNumberOfRepetitionsAllowed,
    this.caseInsensitive = false,
    String violationMessage = 'AvoidRepeatingAlphabets constraint violated',
  })  : assert(maxNumberOfRepetitionsAllowed != null),
        assert(maxNumberOfRepetitionsAllowed >= 0),
        assert(caseInsensitive != null),
        super(violationMessage);

  /// If any alphabet is repeated more then [maxNumberOfRepetitionsAllowed] times, then returns `true`.
  /// Otherwise returns `false`.
  @override
  bool isViolatedOn(String input) {
    assert(input != null);
    final alphabetsCountTable = <String, int>{};

    for (var i = 0; i < input.length; ++i) {
      if (input[i].hasAlphabets) {
        final alphabetAtCurrentIndex =
            caseInsensitive ? input[i].toLowerCase() : input[i];

        if (alphabetsCountTable.containsKey(alphabetAtCurrentIndex)) {
          alphabetsCountTable[alphabetAtCurrentIndex] += 1;
        } else {
          alphabetsCountTable[alphabetAtCurrentIndex] = 1;
        }
      }
    }

    return alphabetsCountTable.values
        .where((count) => count > maxNumberOfRepetitionsAllowed)
        .isNotEmpty;
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

  /// If input contains any character that is repeated more than [maxNumberOfRepeatitionAllowed] times, returns `true`.
  ///
  /// Otherwise returns `false`.
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

    return digitsCountTable.values
        .where((count) => count > maxNumberOfRepetitionsAllowed)
        .isNotEmpty;
  }
}

/// Constraint on limiting the number of a times any character in the input to repeat consecutively.
class AvoidConsecutivelyRepeatingCharactersConstraint extends InputConstraint {
  static const int defaultMaxNumberOfRepetitionsAllowed = 2;

  /// Maximum number of times any character in the input is allowed to be repeated consecutively.
  final int maxNumberOfRepetitionsAllowed;

  /// Indicates whether evaluation should happen as is or by ignoring the case.
  ///
  /// Defaults to `false`.
  final bool caseInsensitive;

  AvoidConsecutivelyRepeatingCharactersConstraint({
    this.maxNumberOfRepetitionsAllowed =
        AvoidConsecutivelyRepeatingCharactersConstraint
            .defaultMaxNumberOfRepetitionsAllowed,
    this.caseInsensitive = false,
    String violationMessage =
        'AvoidConsecutivelyRepeatingCharacters constraint violated',
  })  : assert(maxNumberOfRepetitionsAllowed != null),
        assert(maxNumberOfRepetitionsAllowed >= 0),
        assert(caseInsensitive != null),
        super(violationMessage);

  /// If any character is repeated consecutively more then [maxNumberOfRepetitionsAllowed] times,
  /// then returns `true`.
  ///
  /// Otherwise returns `false`.
  @override
  bool isViolatedOn(String input) {
    assert(input != null);

    for (var i = 0; i < input.length; ++i) {
      if (i + 1 + maxNumberOfRepetitionsAllowed <= input.length) {
        final currentSubString =
            input.substring(i, i + 1 + maxNumberOfRepetitionsAllowed);

        if (caseInsensitive) {
          if (currentSubString.toLowerCase().hasAllIdenticalCharacters) {
            return true;
          }
        } else {
          if (currentSubString.hasAllIdenticalCharacters) {
            return true;
          }
        }
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

  /// Indicates whether evaluation should happen as is or by ignoring the case.
  ///
  /// Defaults to `false`.
  final bool caseInsensitive;

  AvoidConsecutivelyRepeatingAlphabetsConstraint({
    this.maxNumberOfRepetitionsAllowed =
        AvoidConsecutivelyRepeatingDigitsConstraint
            .defaultmaxNumberOfRepetitionsAllowed,
    this.caseInsensitive = false,
    String violationMessage =
        'AvoidConsecutivelyRepeatingAlphabets constraint violated',
  })  : assert(maxNumberOfRepetitionsAllowed != null),
        assert(maxNumberOfRepetitionsAllowed >= 0),
        assert(caseInsensitive != null),
        super(violationMessage);

  /// If any alphabet is repeated consecutively more then [maxNumberOfRepetitionsAllowed] times,
  /// then returns `true`.
  ///
  /// Otherwise returns `false`.
  @override
  bool isViolatedOn(String input) {
    assert(input != null);

    for (var i = 0; i < input.length; ++i) {
      if (i + 1 + maxNumberOfRepetitionsAllowed <= input.length) {
        final currentSubString =
            input.substring(i, i + 1 + maxNumberOfRepetitionsAllowed);

        if (caseInsensitive) {
          if (currentSubString.toLowerCase().hasAllIdenticalAlphabets) {
            return true;
          }
        } else {
          if (currentSubString.hasAllIdenticalAlphabets) {
            return true;
          }
        }
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
  /// then returns `true`.
  ///
  /// Otherwise returns `false`.
  @override
  bool isViolatedOn(String input) {
    assert(input != null);

    for (var i = 0; i < input.length; ++i) {
      if (i + 1 + maxNumberOfRepetitionsAllowed <= input.length &&
          input
              .substring(i, i + 1 + maxNumberOfRepetitionsAllowed)
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

  /// Indicates whether evaluation should happen as is or by ignoring the case.
  ///
  /// Defaults to `false`.
  final bool caseInsensitive;

  AvoidSequentialCharactersConstraint({
    this.maxSequenceLength =
        AvoidSequentialCharactersConstraint.defaultMaxSequenceLength,
    this.caseInsensitive = false,
    String violationMessage = 'AvoidSequentialCharacters constraint violated',
  })  : assert(maxSequenceLength != null),
        assert(maxSequenceLength > 1),
        assert(caseInsensitive != null),
        super(violationMessage);

  /// If any sequenc with alphabetically consecutive characters is found
  /// with length > [mexSequenceLength], returns `true`.
  ///
  /// Otherwise returns `false`.
  @override
  bool isViolatedOn(String input) {
    assert(input != null);

    for (var i = 0; i < input.length; ++i) {
      if (i + 1 + maxSequenceLength <= input.length) {
        final currentSubString = input.substring(i, i + 1 + maxSequenceLength);

        if (caseInsensitive) {
          if (currentSubString.toLowerCase().hasOnlyConsecutiveCharacters) {
            return true;
          }
        } else {
          if (currentSubString.hasOnlyConsecutiveCharacters) {
            return true;
          }
        }
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

  /// Indicates whether evaluation should happen as is or by ignoring the case.
  ///
  /// Defaults to `false`.
  final bool caseInsensitive;

  AvoidSequentialAlphabetsConstraint({
    this.maxSequenceLength =
        AvoidSequentialAlphabetsConstraint.defaultMaxSequenceLength,
    this.caseInsensitive = false,
    String violationMessage = 'AvoidSequentialAlphabets constraint violated',
  })  : assert(maxSequenceLength != null),
        assert(maxSequenceLength > 1),
        assert(caseInsensitive != null),
        super(violationMessage);

  /// If any sequenc with alphabetically consecutive characters is found
  /// with length > [mexSequenceLength], returns `true`.
  ///
  /// Otherwise returns `false`.
  @override
  bool isViolatedOn(String input) {
    assert(input != null);

    for (var i = 0; i < input.length; ++i) {
      if (i + 1 + maxSequenceLength <= input.length &&
          input
              .substring(i, i + 1 + maxSequenceLength)
              .hasOnlyConsecutiveAlphabets) {
        final currentSubString = input.substring(i, i + 1 + maxSequenceLength);

        if (caseInsensitive) {
          if (currentSubString.toLowerCase().hasOnlyConsecutiveAlphabets) {
            return true;
          }
        } else {
          if (currentSubString.hasOnlyConsecutiveAlphabets) {
            return true;
          }
        }
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
  /// with length > [mexSequenceLength], returns `true`.
  ///
  /// Otherwise returns `false`.
  @override
  bool isViolatedOn(String input) {
    assert(input != null);

    for (var i = 0; i < input.length; ++i) {
      if (i + 1 + maxSequenceLength <= input.length &&
          input
              .substring(i, i + 1 + maxSequenceLength)
              .hasOnlyConsecutiveDigits) {
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

  /// If the input is empty, then returns `true`.
  /// Otherwise returns `false`.
  @override
  bool isViolatedOn(String input) {
    assert(input != null);

    return input.isEmpty;
  }
}

extension _StringX on String {
  bool get hasAlphabets => RegExp('[A-Za-z]').hasMatch(this);

  bool get hasAllAlphabets {
    if (isEmpty) {
      return false;
    }

    for (var i = 0; i < length; ++i) {
      if (!this[i].hasAlphabets) {
        return false;
      }
    }

    return true;
  }

  bool get hasUpperCaseCharacters => RegExp('[A-Z]').hasMatch(this);

  bool get hasAllUpperCaseCharacters {
    if (isEmpty) {
      return false;
    }

    for (var i = 0; i < length; ++i) {
      if (!this[i].hasUpperCaseCharacters) {
        return false;
      }
    }

    return true;
  }

  bool get hasLowerCaseCharacters => RegExp('[a-z]').hasMatch(this);

  bool get hasAllLowerCaseCharacters {
    if (isEmpty) {
      return false;
    }

    for (var i = 0; i < length; ++i) {
      if (!this[i].hasLowerCaseCharacters) {
        return false;
      }
    }

    return true;
  }

  bool get hasDigits => RegExp('[0-9]').hasMatch(this);

  bool get hasAllDigits {
    if (isEmpty) {
      return false;
    }

    for (var i = 0; i < length; ++i) {
      if (!this[i].hasDigits) {
        return false;
      }
    }

    return true;
  }

  bool get hasAllIdenticalCharacters {
    if (isEmpty) {
      return false;
    }

    for (var i = 0; i < length; ++i) {
      if (i + 1 < length && this[i] != this[i + 1]) {
        return false;
      }
    }

    return true;
  }

  bool get hasAllIdenticalAlphabets {
    if (isEmpty) {
      return false;
    }

    if (hasAllAlphabets) {
      for (var i = 0; i < length; ++i) {
        if (i + 1 < length && this[i] != this[i + 1]) {
          return false;
        }
      }

      return true;
    } else {
      return false;
    }
  }

  bool get hasAllIdenticalDigits {
    if (isEmpty) {
      return false;
    }

    if (hasAllDigits) {
      for (var i = 0; i < length; ++i) {
        if (i + 1 < length && this[i] != this[i + 1]) {
          return false;
        }
      }

      return true;
    } else {
      return false;
    }
  }

  bool get hasOnlyConsecutiveCharacters {
    if (isEmpty) {
      return false;
    }

    for (var i = 0; i < length; ++i) {
      if (i + 1 < length &&
          this[i].codeUnitAt(0) + 1 != this[i + 1].codeUnitAt(0)) {
        return false;
      }
    }

    return true;
  }

  bool get hasOnlyConsecutiveAlphabets {
    if (isEmpty) {
      return false;
    }

    if (hasAllAlphabets) {
      for (var i = 0; i < length; ++i) {
        if (i + 1 < length &&
            this[i].codeUnitAt(0) + 1 != this[i + 1].codeUnitAt(0)) {
          return false;
        }
      }

      return true;
    } else {
      return false;
    }
  }

  bool get hasOnlyConsecutiveDigits {
    if (isEmpty) {
      return false;
    }

    if (hasAllDigits) {
      for (var i = 0; i < length; ++i) {
        if (i + 1 < length &&
            this[i].codeUnitAt(0) + 1 != this[i + 1].codeUnitAt(0)) {
          return false;
        }
      }

      return true;
    } else {
      return false;
    }
  }
}
