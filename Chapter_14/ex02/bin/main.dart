import 'dart:io';

void main() {
  final file = File('../pandp.txt');
  file.readAsString().then((String fileContent) {
    print(fileContent);
    return File('../pandp.txt').readAsString();
  }).then((String fileContent) => print(fileContent));
}
