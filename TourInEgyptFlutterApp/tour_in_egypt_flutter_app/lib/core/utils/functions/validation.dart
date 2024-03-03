class Validation {
  static String? emailValidation(String? value) {
    if (value!.trim().isEmpty) {
      return 'Email mustn\'t be empty';
    } else {
      if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)) {
        return 'Enter Correct Email';
      }
      return null;
    }
  }

  static String? passwordValidation(String? value) {
    if (value!.isEmpty) {
      return 'Password mustn\'t be empty';
    } else {
      if (value.length < 8) {
        return 'Enter at least 8 characters.';
      }
      return null;
    }
  }
}
