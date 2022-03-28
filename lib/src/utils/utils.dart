import 'package:e_commerce/src/utils/regex/regex.dart';
import 'package:intl/intl.dart';

class XUtils {
  static String formatPrice(double price) {
    String value = price.toString().replaceAll(XRegex.priceRegex, '');
    return value;
  }

  static String isValidEmail(String email) {
    email = email.trim();
    String message = "";

    bool emailValid = XRegex.emailRegex.hasMatch(email);
    if (emailValid == false) {
      message = "Invalid email";
    }
    if (email.isEmpty) {
      message = "Please enter valid email";
    }

    return message;
  }

  static String isValidPassword(String password) {
    password = password.trim();
    String message = "";

    if (password.length < 6 || password.length > 10) {
      message = "Password from 6 - 10 characters";
    }
    if (password.isEmpty) {
      message = "Please enter vaild password";
    }

    return message;
  }

  static String isValidName(String name) {
    String message = "";
    if (!name.contains(XRegex.nameVietnameseRegex)) {
      message = "Name cannot contain special characters or numbers";
    }
    if (name.isEmpty) {
      message = 'Please enter valid name';
    }

    return message;
  }

  static String isValidBirthDay(String day) {
    String message = "";
    if (day.isEmpty) {
      message = 'Please enter valid birth day';
    }

    return message;
  }

  static String dateTimeReview() {
    var date = DateTime.now();
    return DateFormat("MMMM d,yyyy").format(date);
  }
}
