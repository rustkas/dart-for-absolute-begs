class Population {
  String name;
  int pop;
  Population(this.name, this.pop);
  Population operator &(Population other) =>
      Population(name + ' & ' + other.name, pop + other.pop);
  Population operator +(int newPeople) {
    pop += newPeople;
    return Population(name, pop);
  }

  @override
  String toString() {
    return '$name has a population of $pop';
  }
}
