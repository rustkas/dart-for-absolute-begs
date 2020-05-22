void main() {
  talkAbout('Hello', exclame);
  talkAbout('TicToc\t', manyTalk);
}

void talkAbout(String toShout, Function(String) shoutFunc) {
  print(shoutFunc(toShout));
}

String exclame(String toExclame) => '$toExclame!';
String manyTalk(String toMany) {
  var allTogether = '';
  for (var i = 0; i < 5; i++) {
    allTogether =
        allTogether + toMany; // keep concatenating onto the end of allTogether
  }
  return allTogether;
}
