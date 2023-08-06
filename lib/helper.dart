String getErrorMessage(String errorText) {
  List<String> result = errorText.split('] ');
  return result.last;
}