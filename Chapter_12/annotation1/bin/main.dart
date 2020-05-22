@owner('David')
void main() {
  importantFunc1();
}

class owner {
  final String name;
  const owner(this.name);
}

@owner('John')
void importantFunc1() {
  return;
}


