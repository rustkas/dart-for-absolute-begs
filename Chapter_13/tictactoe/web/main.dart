import 'dart:html';
import 'package:tictactoe/tictactoe.dart';

void main() {
  myCanvas = document.getElementById('myCanvas');
  myCanvas.onClick.listen(clickHappened);
  board.draw(myCanvas);
}
