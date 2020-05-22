library wordsearch;

import 'dart:html';


import 'src/cell.dart';
import 'src/grid.dart';
import 'src/search_word.dart';
import 'src/word_search_constraint.dart';
import 'package:constrained_sps/constrained.dart';


export 'src/cell.dart';
export 'src/grid.dart';
export 'src/search_word.dart';
export 'src/word_search_constraint.dart';

/// Get parameters for grid from user and create Grid
void createWordSearch(MouseEvent event) {
  var widthText = (document.getElementById('grid_width') as InputElement).value;
  var heightText = (document.getElementById('grid_height') as InputElement).value;

  int gridWidth, gridHeight;
  try {
    gridWidth = int.parse(widthText);
    gridHeight = int.parse(heightText);
  } on FormatException {
    window.alert('Grid\'s dimensions must be defined with integers.');
    return;
  }
  
  if (gridWidth < 1 || gridHeight < 1) {
    window.alert('The grid must be at least 1 cell long in each dimension.');
    return;
  }

  var inputWordList = (document.getElementById('word_list') as TextAreaElement).value;
  if (inputWordList.trim() == '') {
    window.alert('Word List can\'t be blank.');
    return;
  }
  
  var words = inputWordList.split(',');

  populateGrid(words, gridWidth, gridHeight);  // try to fill in a grid with the words
}

/// Perform a bakcktracking search using constraineD to determine
/// how all of the words can fit in the grid.
void populateGrid(List<String> words, int width, int height) {
  // prepare words for search
  var searchWords = <SearchWord>[];
  var domains = <SearchWord, List<List<Point>>>{};
  var sumOfWordLengths = 0;
  for (String word in words) {
    var sw = SearchWord(word.trim());
    searchWords.add(sw);
    var tempDomain = sw.getDomain(width, height);
    if (tempDomain.isEmpty) {
      window.alert('The word $word could not fit on the grid.');
      return;
    }

    sumOfWordLengths += sw.word.length;
    tempDomain.shuffle(); // dont' want boring solutions first
    domains[sw] = tempDomain;
  }

  if (sumOfWordLengths > width * height) {
    window.alert('There\'s not enough room on the grid for those words.');
    return;
  }

  // perform the search
  var wordSearchCSP = CSP(searchWords, domains);
  wordSearchCSP.addListConstraint(WordSearchConstraint(searchWords));
  backtrackingSearch(wordSearchCSP, {}).then((solution) {

    if (solution == null) {
      window.alert('Could not fit words on grid.');
    } else {
      // create display for grid
      var wordSearchCanvas = CanvasElement();
      wordSearchCanvas.width = width * Cell.WIDTH;
      wordSearchCanvas.height = height * Cell.HEIGHT;
      var wordSearchGrid = Grid(wordSearchCanvas, width, height);

      // get search results and fill in grid
      for (SearchWord sw in solution.keys) {
        for (var i = 0; i < sw.word.length; i++) {
          wordSearchGrid.cells[solution[sw][i]].letter = sw.word[i];
        }
      }

      showGrid(wordSearchCanvas, wordSearchGrid, words);
    }
  });
}

/// Show a window containing the grid, the word list, and a print button
void showGrid(CanvasElement wordSearchCanvas, Grid wordSearchGrid, List<String> words) {
  // clear the output container draw main grid
  DivElement gridContainer = document.getElementById('output_section');
  gridContainer.innerHtml = '';
  gridContainer.append(wordSearchCanvas);
  wordSearchGrid.drawOnce();

  // add word list
  var listElement = UListElement();
  gridContainer.append(listElement);
  for (var word in words) {
    var itemElement = LIElement();
    listElement.append(itemElement);
    itemElement.text = word.trim().toUpperCase();
  }
}
