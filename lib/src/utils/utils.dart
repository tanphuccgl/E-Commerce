class XUtils {
  static String isValidEmail(String email, bool pureEmail) {
    email = email.trim();
    String message = "";
    if (pureEmail == false) {
      message = "";
    } else {
      bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);
      if (emailValid == false) {
        message = "Invalid email";
      }
      if (email.isEmpty) {
        message = "Please enter valid email";
      }
    }

    return message;
  }

  static String isValidPassword(String password, bool purePassword) {
    password = password.trim();
    String message = "";
    if (purePassword == false) {
      message = "";
    } else {
      if (password.length < 6 || password.length > 10) {
        message = "Password from 6 - 10 characters";
      }
      if (password.isEmpty) {
        message = "Please enter vaild password";
      }
    }

    return message;
  }

  static String isValidName(String name, bool pureName) {
    String message = "";
    if (pureName == false) {
      message = "";
    } else {
      if (name.contains(RegExp(r'^[a-z A-Z,.\-]+$'))) {
        message = "";
      } else {
        message = "Name cannot contain special characters or numbers";
      }
      if (name.isEmpty) {
        message = 'Please enter valid name';
      }
    }

    return message;
  }

  static bool isValidLogin(
      {required String email,
      required bool pureEmail,
      required String password,
      required purePassword}) {
    if (isValidEmail(email, pureEmail) == "" &&
        isValidPassword(password, purePassword) == "" &&
        purePassword == true &&
        pureEmail == true) {
      return true;
    } else {
      return false;
    }
  }

  static bool isValidSignUp(
      {required String email,
      required bool pureEmail,
      required String password,
      required bool purePassword,
      required String name,
      required bool pureName}) {
    if (isValidEmail(email, pureEmail) == "" &&
        pureEmail == true &&
        isValidPassword(password, purePassword) == "" &&
        purePassword == true &&
        pureName == true &&
        isValidName(name, pureName) == "") {
      return true;
    } else {
      return false;
    }
  }
}
