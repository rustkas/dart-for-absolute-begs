import 'dart:async'; // for Timer
import 'dart:html';

import 'package:alien_invaders/alien_anvaders.dart';

void main() {
  myCanvas = document.getElementById('myCanvas');
  window.onKeyPress.listen((KeyboardEvent e) {
    // manipulate player with key presses
    final lastPressed = String.fromCharCodes([e.charCode]);
    switch (lastPressed) {
      case 'z': // move player left
        if (player.x > 0) {
          player.move(-5, 0);
        }
        break;
      case 'x': // move player right
        if (player.x < canvas_width - Player.player_width) {
          player.move(5, 0);
        }
        break;
      case ' ': // player fires
        playerBullets.add(Bullet(
            player.x + Player.player_width ~/ 2 - Bullet.bullet_width ~/ 2,
            player.y - Bullet.bullet_height,
            false));
        break;
    }
  });
  restart();
  // this Timer will call update() approximately 60 times a second
  Timer.periodic(const Duration(milliseconds: 17), update);
}
