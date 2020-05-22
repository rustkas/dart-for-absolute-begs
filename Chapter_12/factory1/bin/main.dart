void main() {
  final t = Ticket(17);
  print(t is ChildTicket); // prints true
}

class Ticket {
  int age;
  factory Ticket(int age) {
    if (age >= 18) {
      return AdultTicket(age);
    } else {
      return ChildTicket(age);
    }
  }
  Ticket._withAge(this.age);
}

class AdultTicket extends Ticket {
  AdultTicket(int age) : super._withAge(age);
}

class ChildTicket extends Ticket {
  ChildTicket(int age) : super._withAge(age);
}
