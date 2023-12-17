String replaceNullWithEmpty(String? value) {
  if (value == null || value == 'null') {
    return '';
  }
  return value;
}

String? replaceEmptyWithNull(String? value) {
  if (value == '') {
    return null;
  }
  return value;
}
