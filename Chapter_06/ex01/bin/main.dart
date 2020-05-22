void main() {
  var greetings = ['hello', 'hi', 'howdy', 'hey'];
  for (var i = 0; i < greetings.length; i++) {
    // notice the < operator here...
    print(greetings[i]);
  }
  for (var greeting in greetings) {
    // greeting will refer to each element of greetings
    print(greeting);
  }
}
