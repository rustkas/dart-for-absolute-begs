import 'dart:io';

void main() {
  var secretCode = getROT13Map();
  stdout.write('Enter the text you want to encrypt: ');
  var original = stdin.readLineSync();  // user input
  var changed = '';
  for (var character in original.split('')) {  // get list of characters
    if (secretCode.containsKey(character)) {  // containsKey() checks if key exists
      changed += secretCode[character];
    } else {
      changed += character;
    }
  }
  print('Result is $changed');
}
// dart bin/main.dart

/// returns a Map that maps letters to other letters
/// 13 places away in the English alphabet
Map<String, String> getROT13Map() {
  const alphabet = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'];
  const change = 13;  // how many places to move letters
  var code = <String, String>{};
  
  for (var i = 0; i < alphabet.length; i++) {
    if (i < change){  // move first 13 letters 13 places forward A=N
      code[alphabet[i]] = alphabet[i + change];
      code[alphabet[i].toUpperCase()] = alphabet[i + change].toUpperCase();
    } else {  // last 13 letters go 13 places back N=A
      code[alphabet[i]] = alphabet[i - change];
      code[alphabet[i].toUpperCase()] = alphabet[i - change].toUpperCase();
    }
  }
  return code;
}

