void main() {
  String exclame(String toExclame) => '$toExclame!';
  String manyTalk(String toMany) {
    var allTogether = '';
    for (var i = 0; i < 6; i++) {
      allTogether += toMany; // keep concatenating toMany onto the end of itself
    }
    return allTogether;
  }

  talkAbout('Hello', exclame);
  talkAbout('TicToc\t', manyTalk);
  talkAbout('WoW', (String s) => s.toLowerCase()); // a function with no title!?
}

void talkAbout(String toShout, Function(String) shoutFunc) {
  print(shoutFunc(toShout));
}
