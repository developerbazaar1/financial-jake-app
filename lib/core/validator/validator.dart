class Validator {
  static String? isEmailValid({required String? value}) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter email";
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return "Please enter valid email";
    } else {
      return null;
    }
  }

  static String? isNameValid({required String? value}) {
    if (value == null || value.trim().toString().isEmpty) {
      return "Please enter name";
    } else if (!RegExp(r'^[a-z A-Z,.\-]+$').hasMatch(value)) {
      return "Please enter valid name";
    } else if (value.trim().length > 20) {
      return "Name length less than twenty";
    } else {
      return null;
    }
  }

  static String? isNumberValid({required String? value}) {
  //  String pattern = r'^\+[1-9]\d{1,14}$';
    String pattern = r'^[6-9]\d{9}$';
    RegExp regExp = new RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Please enter phone number';
    } else if (!regExp.hasMatch(value)) {
      return 'Enter valid phone number';
    }
    return null;
  }
  // static String? isNumberValid({required String? value}) {
  //   if (value == null || value.trim().toString().isEmpty) {
  //     return "Please enter number";
  //   } else if (value.trim().length < 10 || value.trim().length > 12) {
  //     return "Please enter valid number";
  //   } else {
  //     return null;
  //   }
  // }

  static String? isPasswordValid({required String? value}) {
    if (value == null || value.trim().toString().isEmpty) {
      return "Please enter password";
    } else if (value.trim().length < 8) {
      return "Please enter at least 8 characters";
    } else {
      return null;
    }
  }

  static String? isValid({required String? value, required String title}) {
    if (value == null || value.trim().toString().isEmpty) {
      return "Please enter $title";
    } else {
      return null;
    }
  }

  // VALIDATE EMAIL
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    }
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return !regex.hasMatch(value) ? 'Enter a valid email address' : null;
  }

  // VALIDATE PASSWORD
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    } else if (value.length < 8) {
      return "Password must be at least 8 characters long";
    } else if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    } else if (!RegExp(r'(?=.*[a-z])').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    } else if (!RegExp(r'(?=.*[0-9])').hasMatch(value)) {
      return 'Password must contain at least one number';
    } else if (!RegExp(r'(?=.*[@#$%^&+=])').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  // VALIDATE CONTACT NUMBER
  static String? validateContactNo(String? value) {
    if (value!.isEmpty || value.length < 10 || value.length > 20) {
      return "Please enter valid contact no";
    }
    return null;
  }

  // VALIDATE CONFIRM PASSWORD
  static String? validateConfirmPassword({
    required String? value,
    required String valController,
  }) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != valController) {
      return 'Passwords do not match';
    }
    return null;
  }

  // VALIDATE NULL VALUE
  static String? nullValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Field cannot be empty";
    }
    return null;
  }
}
