void main() {
  var beersOnTheWall = 99;
  while (beersOnTheWall > 0) {
    print('$beersOnTheWall bottles of beers on the wall, $beersOnTheWall'
        ' bottles of beer. Take one down, pass it around, ${beersOnTheWall - 1}'
        ' bottles of beer on the wall.');
    beersOnTheWall--;
  }
}
