// validators.dart

class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a valid email address';
    }
    // Add your custom email validation logic here
    // Return null if validation passes, or an error message if it fails
    return null;
  }

  static String? validateUsername(String? value) {
    // Add your custom username validation logic here
    if (value == null || value.isEmpty) {
      return 'Username is required';
    } else if (value.length < 3) {
      return 'Username must be at least 3 characters long';
    } else if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
      return 'Invalid characters in username';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    // Add your custom password validation logic here
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    // You can add more password criteria based on your requirements
    return null;
  }

  static String? validateConfirmPassword(
      String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Confirm password is required';
    } else if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    // Assuming a simple validation for a 10-digit phone number
    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Please enter a valid 10-digit phone number';
    }

    return null;
  }
  // Add more validation functions as needed
}
