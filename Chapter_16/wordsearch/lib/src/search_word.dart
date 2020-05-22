import 'dart:html';

class SearchWord {
  String word;
  SearchWord(this.word);

  /// Returns all possible positioning of [word] within
  /// a [width] x [height] grid
  List<List<Point>> getDomain(int width, int height) {
    var domain = <List<Point>>[];

    // go through every place in the grid
    for (var x = 0; x < width; x++) {
      for (var y = 0; y < height; y++) {
        // forward
        if (x + word.length <= width) {
          var newPlacement = [];
          for (var i = 0; i < word.length; i++) {
            newPlacement.add(Point(x + i, y));
          }
          domain.add(newPlacement);
        }
        // backwards
        if (x - word.length >= -1) {
          // 0 counts as a place
          var newPlacement = [];
          for (var i = 0; i < word.length; i++) {
            newPlacement.add(Point(x - i, y));
          }
          domain.add(newPlacement);
        }
        // down
        if (y + word.length <= height) {
          var newPlacement = [];
          for (var i = 0; i < word.length; i++) {
            newPlacement.add(Point(x, y + i));
          }
          domain.add(newPlacement);
        }
        // up
        if (y - word.length >= -1) {
          // 0 counts as a place
          var newPlacement = [];
          for (var i = 0; i < word.length; i++) {
            newPlacement.add(Point(x, y - i));
          }
          domain.add(newPlacement);
        }
        // forward up diagonal
        if ((x + word.length <= width) && (y + word.length <= height)) {
          var newPlacement = [];
          for (var i = 0; i < word.length; i++) {
            newPlacement.add(Point(x + i, y + i));
          }
          domain.add(newPlacement);
        }
        // backwards down diagonal
        if ((x - word.length >= -1) && (y - word.length >= -1)) {
          var newPlacement = [];
          for (var i = 0; i < word.length; i++) {
            newPlacement.add(Point(x - i, y - i));
          }
          domain.add(newPlacement);
        }
        // forward down diagonal
        if ((x + word.length <= width) && (y - word.length >= -1)) {
          var newPlacement = [];
          for (var i = 0; i < word.length; i++) {
            newPlacement.add(Point(x + i, y - i));
          }
          domain.add(newPlacement);
        }
        // backwards up diagonal
        if ((x - word.length >= -1) && (y + word.length <= height)) {
          var newPlacement = [];
          for (var i = 0; i < word.length; i++) {
            newPlacement.add(Point(x - i, y + i));
          }
          domain.add(newPlacement);
        }
      }
    }

    return domain;
  }
}
