import 'dart:html';
//import 'dart:async';

void main() {
  
  final f = HttpRequest.getString('../pandp.txt');
  f.then((String s) {
    print(s);
    DivElement div = document.createElement('div');
    document.childNodes.add(div);
    div.appendText(s);
  print('-----------------------------------------------');
  print('This should come out before Pride and Prejudice.');
  });


}
