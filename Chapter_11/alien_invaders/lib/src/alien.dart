import 'sprite.dart';

class Alien extends Sprite {
  static const int alien_width = 80, alien_height = 40;
  static const String image_name = 'images/ufo.png';
  int frameCount = 0;

  Alien(int x, int y) : super(alien_width, alien_height, x, y, image_name);

  /// Move every second or so (assuming 60 frames per second)
  @override
  void update() {
    frameCount++;
    if (frameCount % 60 == 0) {
      move(0, 1); // move one down
    }
  }
}
