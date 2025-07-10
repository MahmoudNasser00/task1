String? emailValidator(String? value) {
  if (value == null || value.isEmpty || !value.contains("@")) {
    return "Enter a valid email";
  }
  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.length < 6) {
    return "Password must be at least 6 characters";
  }
  return null;
}
