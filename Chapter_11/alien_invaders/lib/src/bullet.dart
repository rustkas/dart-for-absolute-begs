import 'sprite.dart';

class Bullet extends Sprite {
  static const int bullet_width = 15, bullet_height = 15;
  static const String image_name = 'images/bullet.png';
  bool down;

  Bullet(int x, int y, this.down) : super(bullet_width, bullet_height, x, y, image_name);

  /// Move down or up 1 every frame
  @override
  void update() {
    if (down) {
      move(0, 1);
    } else {
      move(0, -1);
    }
  }

  /// is the bullet within the space of [s]?
  bool checkCollision(Sprite s) {
    if (boundingBox.intersection(s.boundingBox) != null) {
      return true;
    }
    return false;
  }
}
