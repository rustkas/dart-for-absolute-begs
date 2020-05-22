import 'dart:html';
import 'package:wordsearch/wordsearch.dart';

void main() {
  // setup event handlers for buttons
  document.getElementById('create').onClick.listen(createWordSearch);
  document
      .getElementById('print')
      .onClick
      .listen((MouseEvent me) => window.print());
  document.getElementById('hide').onClick.listen((MouseEvent me) {
    final controlSection =
        (document.getElementById('input_section') as DivElement);
    controlSection.hidden = !controlSection.hidden; // just flip it
  });
}
