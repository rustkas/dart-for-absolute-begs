import 'dart:isolate';
import 'dart:math';

Future<void> main() async {
  const iterations = 100000;

  final receivePort = ReceivePort();

  await Isolate.spawn(calculation, receivePort.sendPort);

  receivePort.listen((results) async {
    if (results is SendPort) {
      results.send(iterations);
    } else if (results is Map) {
      var matches = results['matches'];

      print(
          'There were at least two people with the same birthday ${format((matches / iterations) * 100)}% of the time.');
      receivePort.close();
    }
  });
}

void calculation(SendPort sendPort) {
  final receivePort = ReceivePort();
  sendPort.send(receivePort.sendPort);

  receivePort.listen((iterations) {
    List<DateTime> birthdays;
    var matches = 0;

    for (var i = 0; i < iterations; i++) {
      birthdays = generateBirthdays(); // new list of birthdays each iteration
      if (containsDuplicates(birthdays)) {
        matches++;
      }
    }
    sendPort.send({'matches': matches});
  });
}

/// Returns a List with 23 randomly
/// generated birthdays in it
List<DateTime> generateBirthdays() {
  var birthdays = <DateTime>[];
  final r = Random();
  const year = 1987;
  const num_months = 12;
  const num_days = 28; // For simplicity we limit to 28
  const birthdays_to_generate = 23;

  for (var i = 0; i < birthdays_to_generate; i++) {
    final randMonth = r.nextInt(num_months) + 1; // random number 1-12
    final randDay = r.nextInt(num_days) + 1; // random number 1-28
    birthdays.add(DateTime(year, randMonth, randDay));
  }
  return birthdays;
}

/// Returns true if [l] has duplicate elements
/// Otherwise returns false
bool containsDuplicates(List l) {
  for (var i = 0; i < l.length; i++) {
    if (l.skip(i + 1).contains(l[i])) {
      // check if rest of l contains i
      return true;
    }
  }
  return false;
}

String format(double n) {
  var fraction = n - n.toInt();
  if (fraction == 0.0) {
    return n.toString();
  }
  var twoDigitFraction = (fraction * 100).truncateToDouble().toInt();
  return '${n.toInt()}.$twoDigitFraction';
}
