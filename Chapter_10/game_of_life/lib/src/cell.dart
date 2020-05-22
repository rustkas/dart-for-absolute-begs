import 'dart:html';
class Cell {
  bool alive = false;
  bool aliveNextGeneration = false;
  Point location;
  
  static const int width = 20;
  static const int height = 20;
  
  Cell(this.location);
  
  /// Each Cell can draws itself
  void draw(CanvasRenderingContext2D c2d) {
    if (alive) {  // fill living cells blue
      c2d.setFillColorRgb(0, 0, 255);  // blue
    } else {  // fill dead cells white
      c2d.setFillColorRgb(255, 255, 255);  // white
    }
    c2d.fillRect(location.x * width, location.y * height, width, height);
    
    //have a black outline
    c2d.setStrokeColorRgb(0, 0, 0);  // black
    c2d.strokeRect(location.x * width, location.y * height, width, height);
  }
}
