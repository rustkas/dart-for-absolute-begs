import 'dart:io';

void main() {
  final file = File('../pandp.txt');
  file.readAsString().then((String fileContent) => print(fileContent));
}
