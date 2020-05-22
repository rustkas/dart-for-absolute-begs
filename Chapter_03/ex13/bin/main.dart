void main() {
  for (var beersOnTheWall = 99; beersOnTheWall > 0; beersOnTheWall--) {
    print('$beersOnTheWall bottles of beers on the wall, $beersOnTheWall'
        ' bottles of beer. Take one down, pass it around, ${beersOnTheWall - 1}'
        ' bottles of beer on the wall.');
  }
}
