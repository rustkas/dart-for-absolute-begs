void main(List<String> arguments) {
  var pen = Pen();
  pen.color = 'blue';
  pen.write('Hey!');
  var pencil = Pencil();
  pencil.write('Yo!');
  pen.explode();
  print(pen is WritingInstrument); // prints true
  print(pencil is WritingInstrument); // prints true
//pencil.explode(); // illegal, pencil has no explode() method
  var wi = WritingInstrument();
  print(wi is Pen); // prints false
  print(wi is Pencil); // prints false
  print(wi is WritingInstrument); // prints true

  var myPencil = Pencil();
  var temp = myPencil.toString();
  print(myPencil);
  print(temp);

  var myPencil2 = Pencil();
  myPencil2.color = 'orange';
  print(myPencil2);
  var myPen2 = Pen();
  myPen2.explode();
  print(myPen2);
}

class WritingInstrument {
  int lifeRemaining = 100;
  String color = 'black';
  void write(String what) {
    if (lifeRemaining <= 0) {
      return;
    }
    print(what);
    lifeRemaining--;
  }

  @override
  String toString() {
    return 'I am a $color writing instrument'
        ' with $lifeRemaining percent of my life remaining.';
  }
}

class Pen extends WritingInstrument {
  void explode() {
    print('Ink everywhere!');
    lifeRemaining = 0;
  }
}

class Pencil extends WritingInstrument {
  int eraserLife = 100;
  void erase(String toErase) {
    if (eraserLife <= 0) {
      return;
    }
    print('Removed $toErase');
    eraserLife--;
  }
}
