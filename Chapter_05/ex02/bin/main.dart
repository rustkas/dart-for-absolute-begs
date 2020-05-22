void main(List<String> arguments) {
  repeat('Hello');
  repeat('Ok', 2);
  repeat('Dog'); // legal
  //repeat('Dog', 2, '!'); // legal
  repeat('Dog', 2); // legal
  //repeat('Dog', '!'); // ILLEGAL
  //repeat('Dog', '!', 2); // ILLEGAL
}

void repeat(String word, [int repetitions = 1]) {
  for (var i = 0; i < repetitions; i++) {
    print(word);
  }
}
