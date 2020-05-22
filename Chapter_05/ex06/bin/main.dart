void main(List<String> arguments) {
  addOn('Hello', '!', 2);
}

String addOn(String original, String additional, int times) {
  if (times <= 0) {
    // exit condition to end "recursive loop"
    return original;
  }
  return addOn(original + additional, additional, times - 1); // recursive call
}
