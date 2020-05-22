void main() {
  var favoriteAnimal = 'tiger';
  print_favoriteAnimal(favoriteAnimal);
  favoriteAnimal = 'dog';
  print_favoriteAnimal(favoriteAnimal);
  favoriteAnimal = 'cow';
  print_favoriteAnimal(favoriteAnimal);
  favoriteAnimal = 'cat';
  print_favoriteAnimal(favoriteAnimal);

  var digit = 0;
  print_digit(digit);
  digit = 0;
  final list1 = [1, 3, 5, 7, 9];
  for (var i = 0; i < list1.length; i++) {
    print_digit(list1[i]);
  }
  final list2 = [2, 4, 6, 8];
  for (var i = 0; i < list2.length; i++) {
    print_digit(list2[i]);
  }
  print_digit(10);
}

/// Print digit description
void print_digit(int digit) {
  switch (digit) {
    case 0:
      print('Zero');
      break;
    case 1:
    case 3:
    case 5:
    case 7:
    case 9:
      print('$digit is odd');
      break;
    case 2:
    case 4:
    case 6:
    case 8:
      print('$digit is even');
      break;
    default:
      print('$digit is out of score');
  }
}

void print_favoriteAnimal(String favoriteAnimal) {
  switch (favoriteAnimal) {
    case 'dog': // if favoriteAnimal is equal to 'dog' do the following
      print('Bark!');
      break; //we need one of these at the end of every case but default
    case 'cow':
      print('Moo!');
      break;
    case 'cat':
      print('Meow!');
      break;
    default:
      print('Your animal is a new species to me!');
  }
}
