void main(List<String> arguments) {
  print('${NewBorn('David')}');
  NewBorn('David').printTimeStamp();
}

class TimeStamp {
  DateTime creationTime = DateTime.now();
  void printTimeStamp() {
    print(creationTime);
  }
}

class NewBorn extends Patient with TimeStamp {
  NewBorn(String name) : super(name);
}

class Patient {
  final _name;
  Patient(this._name);

  @override
  String toString() {
    return '$_name';
  }
}
