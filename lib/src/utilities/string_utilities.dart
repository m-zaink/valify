extension StringX on String {
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

  bool get hasAllZeroes {
    if (isEmpty) {
      return false;
    }

    for (var i = 0; i < length; ++i) {
      if (this[i] != '0') {
        return false;
      }
    }

    return true;
  }

  bool get hasEmojies {
    if (isEmpty) {
      return false;
    }

    final emojiRegExp = RegExp(
      '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])',
    );

    return emojiRegExp.hasMatch(this);
  }

  int get upperCaseCharactersCount {
    var upperCaseCharactersCount = 0;

    for (var i = 0; i < length; ++i) {
      if (this[i].hasAllUpperCaseCharacters) {
        ++upperCaseCharactersCount;
      }
    }

    return upperCaseCharactersCount;
  }

  int get lowerCaseCharactersCount {
    var lowerCaseCharactersCount = 0;

    for (var i = 0; i < length; ++i) {
      if (this[i].hasAllLowerCaseCharacters) {
        ++lowerCaseCharactersCount;
      }
    }

    return lowerCaseCharactersCount;
  }

  int get digitsCount {
    var digitsCount = 0;

    for (var i = 0; i < length; ++i) {
      if (this[i].hasAllDigits) {
        ++digitsCount;
      }
    }

    return digitsCount;
  }

  /// Removes all the extra 'spaces' in the enclosing string.
  String get condensed {
    final condensingRegExp = RegExp('[\\s\n]+');

    return replaceAll(condensingRegExp, ' ');
  }

  /// Removes all the 'spaces' in the enclosing string.
  String get extraCondensed {
    return replaceAll(' ', '');
  }
}
