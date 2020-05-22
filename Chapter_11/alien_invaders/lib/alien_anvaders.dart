import 'dart:async';
import 'dart:html';
import 'dart:math';

import 'src/alien.dart';
import 'src/bullet.dart';
import 'src/player.dart';

export 'src/alien.dart';
export 'src/bullet.dart';
export 'src/player.dart';
export 'src/sprite.dart';



CanvasElement myCanvas;
Player player;
List<Alien> aliens;
List<Bullet> alienBullets;
List<Bullet> playerBullets;
ImageElement background;
Timer t;

const int canvas_width = 500;
const int canvas_height = 500;
const String background_file = 'images/background.png';

final rand = Random();
/// Called by a Timer 60 times per second
/// Calls update() on all sprites, calls draw()
/// Creates alien bullets and checks for collisions
void update(Timer t) {
  // update everything
  player.update();
  for (var alien in aliens) {
    alien.update();
    // randomly fire a bullet
    
    var randomNumber = rand.nextInt(2000);
    if (randomNumber == 100) {
      alienBullets.add(Bullet(alien.x + Alien.alien_width ~/ 2 - Bullet.bullet_width ~/ 2, alien.y + Alien.alien_height, true));
    }
  }

  final deleteBullets = <Bullet>[];
  for (var bullet in alienBullets) {
    bullet.update();
    if (bullet.y > canvas_height) {  // is bullet off screen?
      deleteBullets.add(bullet);
      continue;
    }
    // check if bullets hit player
    if (bullet.checkCollision(player)) {
      t.cancel();  // stop the game, player is hit
      window.alert('Game Over!');
      deleteBullets.add(bullet);
    }
  }
  
  for (var bullet in deleteBullets) {
    alienBullets.remove(bullet);
  }
  
  deleteBullets.clear();
  final deleteAliens = <Alien>[];
  for (var bullet in playerBullets) {
    bullet.update();
    if (bullet.y < 0) {  // is bullet off screen
      deleteBullets.add(bullet);
      continue;
    }
    // check if bullet hits alien
    for (var alien in aliens) {
      if (bullet.checkCollision(alien)) {
        deleteBullets.add(bullet);
        deleteAliens.add(alien);
      }
    }
  }
  
  for (var bullet in deleteBullets) {
    playerBullets.remove(bullet);
  }

  for (var alien in deleteAliens) {
    aliens.remove(alien);
    if (aliens.isEmpty) {
      t.cancel();  // stop the game, all aliens dead
      window.alert('You Win!');
    }
  }
  
  // draw everything
  draw();
}

/// Draw the background and all of the sprites
void draw() {
  var c2D = myCanvas.context2D;
  // draw the background
  c2D.drawImage(background, 0, 0);
  // draw all the sprites
  player.draw(c2D);
  for (var alien in aliens) {
    alien.draw(c2D);
  }
  for (var bullet in alienBullets) {
    bullet.draw(c2D);
  }
  for (var bullet in playerBullets) {
    bullet.draw(c2D);
  }
}

/// Initialize all of the sprites
/// place the player and the aliens on the screen
void restart() {
  player = Player(canvas_width ~/ 2, canvas_height - Player.player_height);
  aliens = <Alien>[];
  alienBullets = <Bullet>[];
  playerBullets = <Bullet>[];
  // probably don't want to hardcode this for Exercise 3; create the aliens
  const num_rows = 3;
  const num_columns = 5;
  for (var i = 0; i < num_rows; i++) {
    final y = i * (Alien.alien_height + 10);  // 10 is for spacing
    for (var j = 0; j < num_columns; j++) {
      final x = (canvas_width ~/ num_columns) * j + 10;  // ~/ is integer division
      aliens.add(Alien(x,y));
    }
  }
  
  background = ImageElement(src: background_file);
}


