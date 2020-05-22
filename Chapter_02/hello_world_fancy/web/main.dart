import 'dart:html';

void main() {
  InputElement nameBox;
  var name;
  final Element text = document.getElementsByTagName('h1')[0];

  void sayHello(MouseEvent event) {
    nameBox ??= document.getElementById('name_box');
    name ??= document.getElementById('name');

    name.text = nameBox.value + '!';
    nameBox.value = '';
    text.text = 'Hello, ';
    text.children.add(name);
    print(text.text);
  }

  
  document.getElementById('button').onClick.listen(sayHello);
}

//do :
// pub upgrade
// webdev serve
// localhost:8080
