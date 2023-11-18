String getPersianNumber(String number) {
  const en = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const fa = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];

  for (var element in en) {
    number = number.replaceAll(element, fa[en.indexOf(element)]);
  }
  return number;
}
String getEnglishNumber(String number) {
  const en = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const fa = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];

  for (var element in fa) {
    number = number.replaceAll(element, en[fa.indexOf(element)]);
  }
  return number;
}