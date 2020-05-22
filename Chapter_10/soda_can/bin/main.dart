void main() {
  SodaCan.price = 2.00; // all soda cans cost 2.00
  SodaCan();
  print(SodaCan.calculateCostPerMilliliter()); // prints 2.00 / 350
// myCola.calculateCostPerMilliliter(); // illegal, method can't be accessed by instances
// myCola.price = 1.50; // illegal, price can only be accessed through the class name
// SodaCan.drink(); // illegal, instance method can't be used statically
}

class SodaCan {
  static double price = 1.00;
  static double capacity = 350.0;
  bool dented = false;
  void drink() => print('Mmm refreshing.');
  static double calculateCostPerMilliliter() {
    return price / capacity;
  }
}
