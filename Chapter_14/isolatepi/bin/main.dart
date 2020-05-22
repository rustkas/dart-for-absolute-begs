import 'dart:isolate';

void calcPi(SendPort sp) {
  const iterations = 1000000000; // the higher the more accurate
  var series = 1.0;
  var denominator = 3.0;
  var negate = -1.0;

  for (var i = 0; i < iterations; i++) {
    series += (negate * (1 / denominator));
    denominator += 2.0;
    negate *= -1.0;
  }

  final pi = 4 * series;
  sp.send(pi); // send the result back
}

void main() {
  final now = DateTime.now();
  final rp = ReceivePort();
  rp.listen((data) {
    // data is what we receive from sp.send()
    print('Pi is $data');
    print('Duraction of calculation is '
        '${DateTime.now().difference(now).inSeconds} sec.');
    rp.close(); // we're done, close up shop
  });
  Isolate.spawn(calcPi, rp.sendPort); // start the Isolate
}
