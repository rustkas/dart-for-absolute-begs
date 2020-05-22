import 'dart:async';
import 'dart:html';
import 'cell.dart';

class Grid {
  static const int num_cells_wide = 25;
  static const int num_cells_tall = 25;
  CanvasElement lifeCanvas;
  Map<Point, Cell> cells = <Point, Cell>{};
  
  Grid(this.lifeCanvas) {
    // initialize  all the cells
    for (var x = 0; x < num_cells_wide; x++) {
      for (var y = 0; y < num_cells_tall; y++) {
        var location = Point(x, y);
        cells[location] = Cell(location);
      }
    }
  }
  
  /// Get a cell at a given location by looking it up
  /// in the cells Map. If its coordinates are off the end of the
  /// grid, we wrap around to the other side of the grid.
  Cell getCell(int x, int y) {
    // wrap around in x direction
    if (x < 0) {
      x = num_cells_wide - 1;
    } else if (x >= num_cells_wide) {
      x = 0;
    }
    // wrap around in y direction
    if (y < 0) {
      y = num_cells_tall - 1;
    } else if (y >= num_cells_tall) {
      y = 0;
    }
    
    return cells[Point(x, y)];
  }
  
  /// Switch the status of the cell at the location x, y
  void flip(int x, int y) {
    var cell = cells[Point(x ~/ Cell.width, y ~/ Cell.height)];
    cell.alive = !cell.alive;
    cell.draw(lifeCanvas.context2D);
  }
  
  /// Check the eight cells around [cell] to see if they're alive
  /// count how many of them are
  int aliveNeighbors(Cell cell) {
    int x = cell.location.x, y = cell.location.y;
    int newX, newY;
    var numAlive = 0;
    // top left cell
    newX = x - 1;
    newY = y - 1;
    if (getCell(newX, newY).alive) {
      numAlive++;
    }
    // top cell
    newX = x;
    newY = y - 1;
    if (getCell(newX, newY).alive) {
      numAlive++;
    }
    // top right cell
    newX = x + 1;
    newY = y - 1;
    if (getCell(newX, newY).alive) {
      numAlive++;
    }
    // left cell
    newX = x - 1;
    newY = y;
    if (getCell(newX, newY).alive) {
      numAlive++;
    }
    // right cell
    newX = x + 1;
    newY = y;
    if (getCell(newX, newY).alive) {
      numAlive++;
    }
    // bottom left cell
    newX = x - 1;
    newY = y + 1;
    if (getCell(newX, newY).alive) {
      numAlive++;
    }
    // bottom cell
    newX = x;
    newY = y + 1;
    if (getCell(newX, newY).alive) {
      numAlive++;
    }
    // bottom right cell
    newX = x + 1;
    newY = y + 1;
    if (getCell(newX, newY).alive) {
      numAlive++;
    }
    return numAlive;
  }
  
  /// draw the whole grid once - useful before any play takes place
  void drawOnce() {
    final c2d = lifeCanvas.context2D;
    for (var cell in cells.values) {
      cell.draw(c2d);
    }
  }
  
  /// figure out what the next generation should look like
  /// then flip everyone over into the next generation and redraw
  void update(Timer t) {
    // loop through all cells and calculate who's alive next generation
    for (var cell in cells.values) {
      var livingNeighbors = aliveNeighbors(cell);
      cell.aliveNextGeneration = false;  // our default stance
      if (cell.alive) {
        if (livingNeighbors == 3 || livingNeighbors == 2) {
          cell.aliveNextGeneration = true;
        }
      } else {
        if (livingNeighbors == 3) {
          cell.aliveNextGeneration = true;
        }
      }
    }
    
    // flip the values for the next generation into the current values
    // effectively moving into the next generation and draw everyone
    var c2d = lifeCanvas.context2D;
    for (var cell in cells.values) {
      cell.alive = cell.aliveNextGeneration;
      cell.draw(c2d);
    }// for
  }// update
}
