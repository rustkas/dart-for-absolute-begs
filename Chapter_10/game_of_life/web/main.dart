import 'dart:html';
//import 'dart:math';  // for Point
import 'dart:async'; // for Timer

import 'package:game_of_life/game_of_life.dart';

void main() {
  var lifeCanvas = document.getElementById('lifeCanvas');
  // setup grid
  grid = Grid(lifeCanvas);
  grid.drawOnce();
  lifeCanvas.onClick.listen(clickHappened);
  document.getElementById('startStop').onClick.listen(startStopTimer);
}

Timer timer;
Grid grid;

/// When the canvas is clicked, we need to flip a cell
void clickHappened(MouseEvent me) {
  int clickX = me.offset.x;
  int clickY = me.offset.y;
  grid.flip(clickX, clickY);
}

/// Start or stop the Timer from calling update on grid
void startStopTimer(MouseEvent me) {
  if (timer == null) {
    timer = Timer.periodic(Duration(seconds: 1), grid.update);
    document.getElementById('startStop').text = 'Stop';
  } else {
    timer.cancel();
    timer = null;
    document.getElementById('startStop').text = 'Start';
  }
}
