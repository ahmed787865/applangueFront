
extension StringExtension on String {
  bool isValidNumber() {
    return RegExp(
      r'[2-4]\d{7}',
    ).hasMatch(this);
  }
}