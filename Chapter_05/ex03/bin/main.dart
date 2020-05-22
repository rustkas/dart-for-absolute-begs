
void main() {
  repeat('Dog'); // legal
  repeat('Dog', repetitions: 2, exclamation: '!'); // legal
  repeat('Dog', repetitions: 2); // legal
  repeat('Dog', exclamation: '!'); // legal, even without repetitions
  repeat('Dog', exclamation: '!', repetitions: 2); // legal, even out of order
}

void repeat(String word, {int repetitions = 1, String exclamation = ''}) {
  for (var i = 0; i < repetitions; i++) {
    print(word + exclamation); // the + operator can concatenate strings
  }
}
