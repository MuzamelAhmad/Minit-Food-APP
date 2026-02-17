import 'package:mini_food_app/SRC/Presentation/Common/app_titles.dart';

class Validator {
  // Email validation
  static String? Function(String?) get email => (String? value) {
    if (value == null || value.isEmpty) {
      return Titles.emptyEmail;
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
      caseSensitive: false,
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }

    return null;
  };

  // Password validation
  static String? Function(String?) get password => (String? value) {
    if (value == null || value.isEmpty) return 'Password is required';

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }

    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }

    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }

    return null;
  };

  // Confirm password validation
  static String? Function(String?) confirmPassword(String originalPassword) {
    return (String? value) {
      if (value == null || value.isEmpty) return 'Please confirm your password';

      if (value != originalPassword) {
        return 'Passwords do not match';
      }
      return null;
    };
  }

  // Name validation
  static String? Function(String?) get name => (String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }

    if (value.length < 2) {
      return 'Name must be at least 2 characters';
    }

    if (value.length > 50) {
      return 'Name must be less than 50 characters';
    }

    return null;
  };

  // Phone number validation
  static String? Function(String?) get phone => (String? value) {
    if (value == null || value.isEmpty) return 'Phone number is required';

    // Remove any non-digit characters
    final cleaned = value.replaceAll(RegExp(r'[^\d]'), '');

    if (cleaned.length != 10) {
      return 'Enter a valid 10-digit phone number';
    }

    return null;
  };

  // Custom length validation - returns a function
  static String? Function(String?) length({int min = 0, int max = 255}) {
    return (String? value) {
      if (value == null || value.isEmpty) return 'This field is required';

      if (value.length < min) {
        return 'Must be at least $min characters';
      }

      if (value.length > max) {
        return 'Must be less than $max characters';
      }

      return null;
    };
  }

  // Numeric validation
  static String? Function(String?) get numeric => (String? value) {
    if (value == null || value.isEmpty) return 'This field is required';

    if (double.tryParse(value) == null) {
      return 'Please enter a valid number';
    }

    return null;
  };
}

// class Validation {
//   static String? validateEmail(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Email is required';
//     }
//
//     final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
//     if (!emailRegex.hasMatch(value)) {
//       return 'Please enter a valid email address';
//     }
//
//     return null;
//   }
//
//   static String? validatePassword(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Password is required';
//     }
//
//     if (value.length < 6) {
//       return 'Password must be at least 6 characters';
//     }
//
//     if (!value.contains(RegExp(r'[A-Z]'))) {
//       return 'Password must contain at least one uppercase letter';
//     }
//
//     if (!value.contains(RegExp(r'[0-9]'))) {
//       return 'Password must contain at least one number';
//     }
//
//     return null;
//   }
//
//   static String? validateName(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Name is required';
//     }
//
//     if (value.length < 2) {
//       return 'Name must be at least 2 characters';
//     }
//
//     if (value.length > 50) {
//       return 'Name must be less than 50 characters';
//     }
//
//     return null;
//   }
//
//   static String? validatePhone(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Phone number is required';
//     }
//
//     final phoneRegex = RegExp(r'^[0-9]{10}$');
//     if (!phoneRegex.hasMatch(value)) {
//       return 'Please enter a valid 10-digit phone number';
//     }
//
//     return null;
//   }
//
//   static String? validateRequired(String? value, String fieldName) {
//     if (value == null || value.isEmpty) {
//       return '$fieldName is required';
//     }
//     return null;
//   }
// }
