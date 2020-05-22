import 'package:test/test.dart';

void main() {
  group('Compare strings', () {
    var testCases = [
      ['Dog', 'Dog!'],
      ['', '!'],
      ['H e l l o ', 'H e l l o !'],
      ['dog', 'dog?']
    ];
    for (List testCase in testCases) {
      test('exclaim() test: ' + testCase[0], () {
        //expect(testCase[0], equals(testCase[1]));
      });
    }
  });
  // test('Compare strings', () {
  //   var testCases = [
  //     ['Dog', 'Dog!'],
  //     ['', '!'],
  //     ['H e l l o ', 'H e l l o !'],
  //     ['dog', 'dog?']
  //   ];
  //   for (List testCase in testCases) {
  //     test('exclaim() test' + testCase[0], () {
  //       expect(testCase[0], equals(testCase[1]));
  //     });
  //   }
  // });
}
