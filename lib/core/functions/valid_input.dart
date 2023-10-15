validInput(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return "Can not be embty";
  }
  if (val.length < min) {
    return "Can not be lesst han $min";
  }
  if (val.length > max) {
    return "Can not be larger than $max";
  }
  if (type == "fullname") {
    if (!isUsernameValid(val)) {
      return "not valid username";
    }
  }
  if (type == "email") {
    if (!isEmailValid(val)) {
      return "not valid email";
    }
  }
}

bool isEmailValid(String input) {
  final emailPattern = RegExp(
    r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
  );

  return emailPattern.hasMatch(input);
}

bool isUsernameValid(String input) {
  final usernamePattern = RegExp(r'^[a-zA-Z0-9_]{4,20}$');
  return usernamePattern.hasMatch(input);
}
