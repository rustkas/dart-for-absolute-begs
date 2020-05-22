
void main() {
  var myShouter1 = Shouter<int>(23, 34);
  myShouter1.shout();
  var myShouter2 = Shouter<String>(12, 'hello');
  myShouter2.shout();
}

class Shouter<T> {
  int numberOfTimes;
  T thingToShout;
  Shouter(this.numberOfTimes, this.thingToShout);
  void shout() {
    for (var i = 0; i < numberOfTimes; i++) {
      print(thingToShout);
    }
  }
}
