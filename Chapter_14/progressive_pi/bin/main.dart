import 'dart:isolate';

void calcPi(SendPort sp) {
  const iterations = 1000000000;  // the higher the more accurate
  var series = 1.0;
  var denominator = 3.0;
  var negate = -1.0;

  for (var i = 0; i < iterations; i++) {
    series += (negate * (1 / denominator));
    denominator += 2.0;
    negate *= -1.0;
    if (i / iterations == 0.25 || i / iterations == 0.50 || i / iterations == 0.75) {
      sp.send('${(i / iterations * 100)}% Complete');
    }
  }

  final pi = 4 * series;
  sp.send(pi);  // send the result back
}

void main() {
  final rp = ReceivePort();
  rp.listen((data) {  // data is what we receive from sp.send()
    if (data is String) {  // it's a progress report, not the result
      print(data);
    } else {
      print('Pi is $data');
      rp.close();  // we're done, close up shop
    }
  });
  Isolate.spawn(calcPi, rp.sendPort);  // start the Isolate
}
