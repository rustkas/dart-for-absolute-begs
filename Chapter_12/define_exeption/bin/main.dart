void main() {
  var bar = Bar();
  try {
    bar.checkId(Person('Tommy', 25));
    bar.checkId(Person('Jimmy', 22));
    bar.checkId(Person('Sandra', 17));
  } catch (e) {
    print(e);
  }
  print(bar.currentPatrons);
}


class UnderageException implements Exception {
  String message; // for the programmer's reference
  UnderageException(this.message);
  @override
  String toString() {
    return message;
  }
}

class TommyException implements Exception {
  // look how simple it is!
  @override
  String toString() {
    return 'TommyException: Tommy is not allowed in here ever!';
  }
}

class Person {
  String name;
  int age;
  Person(this.name, this.age);
}

class Bar {
  List<Person> currentPatrons = <Person>[];
  void checkId(Person p) {
    if (p.name == 'Tommy') {
      throw TommyException();
    } else if (p.age < 21) {
      throw UnderageException(
          'UnderageException: ${p.name} is not old enough.');
    } else {
      currentPatrons.add(p);
    }
  }
}

