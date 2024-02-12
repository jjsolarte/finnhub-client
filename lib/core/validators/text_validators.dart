class TextValidators {
  static String? textFieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingresa los datos solicitados';
    }
    return null;
  }
}
