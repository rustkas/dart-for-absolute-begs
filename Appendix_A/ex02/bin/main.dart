// const WHEELS_ON_CAR = 4;
// const List MY_FAVORITE_FLAVORS = ['Apple', 'Orange', 'Grape'];

const wheels_on_car = 4;
const List my_favorite_flavors = ['Apple', 'Orange', 'Grape'];

void main(List<String> arguments) {
  var fruits = 'apple,cherry,orange'
      .split(','); // fruits is ['apple', 'cherry', 'orange']
  print(fruits);

  print(my_favorite_flavors.toSet());
}
