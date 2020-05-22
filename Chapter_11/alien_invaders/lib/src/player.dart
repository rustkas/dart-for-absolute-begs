import 'sprite.dart';

class Player extends Sprite {
  static const int player_width = 73, player_height = 80;
  static const String image_name = 'images/ship.png';

  Player(int x, int y) : super(player_width, player_height, x, y, image_name);

  @override
  void update() {
    // doesn't do anything, player updates from keyboard events
    return;
  }
}
