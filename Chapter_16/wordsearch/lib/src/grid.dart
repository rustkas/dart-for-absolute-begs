import 'dart:html';
import 'dart:math';

import 'cell.dart';

class Grid {
  final int numCellsWide;
  final int numCellsTall;
  CanvasElement wordSearchCanvas;
  Map<Point, Cell> cells = {};

  Grid(this.wordSearchCanvas, this.numCellsWide, this.numCellsTall) {
    var r = Random();
    const ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    // initialize  all the cells
    for (var x = 0; x < numCellsWide; x++) {
      for (var y = 0; y < numCellsTall; y++) {
        var location = Point(x, y);
        // fill initially with random letters
        var randLoc = r.nextInt(ALPHABET.length);
        cells[location] = Cell(location, ALPHABET[randLoc]);
      }
    }
  }

  /// draw the whole grid once
  void drawOnce() {
    var c2d = wordSearchCanvas.context2D;
    c2d.clearRect(0, 0, numCellsWide * Cell.WIDTH, numCellsTall * Cell.HEIGHT);
    for (var cell in cells.values) {
      cell.draw(c2d);
    }
  }
}
