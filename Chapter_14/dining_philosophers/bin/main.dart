import 'dart:isolate';
import 'dart:async';
import 'dart:math';

void main() {
  final philosopherReceives = List<ReceivePort>(num_philosophers);
  final philosopherSends = List<SendPort>(num_philosophers);
  final forksInUse = List<bool>(num_philosophers);

  for (var i = 0; i < num_philosophers; i++) {
    forksInUse[i] = false;
    philosopherReceives[i] = ReceivePort();

    philosopherReceives[i].listen((var data) {
      if (data is SendPort) {
        philosopherSends[i] = data;
      } else if (data == 'I want to eat!') {
        print('Philosopher $i wants to eat.');
        if (i == (num_philosophers - 1)) {
          if (forksInUse[0] == false && forksInUse[i] == false) {
            print('Telling philosopher $i to eat.');
            forksInUse[0] = true;
            forksInUse[i] = true;
            philosopherSends[i].send('Eat!');
          }
        } else {
          if (forksInUse[i] == false && forksInUse[i + 1] == false) {
            print('Telling philosopher $i to eat.');
            forksInUse[i] = true;
            forksInUse[i + 1] = true;
            philosopherSends[i].send('Eat!');
          }
        }
      } else if (data == 'Finished!') {
        forksInUse[i] = false;
        if (i == (num_philosophers - 1)) {
          forksInUse[0] = false;
        } else {
          forksInUse[i + 1] = false;
        }
        print('Philosopher $i finished eating.');
        philosopherReceives[i].close();
      }
    });

    Isolate.spawn(philosopher, philosopherReceives[i].sendPort);
  }
}


const int num_philosophers = 2;

/// Represents one of our philosopher Isolates
void philosopher(SendPort backToMain) {
  Timer askTimer;
  final incoming = ReceivePort();

  incoming.listen((var data) {
    // coming from main
    if (data == 'Eat!') {
      askTimer.cancel(); // stop asking to eat
      final r = Random();
      var secondsToEat = r.nextInt(10); // takes 0-9 seconds to eat
      Timer(Duration(seconds: secondsToEat), () {
        backToMain.send('Finished!'); // announce done
        incoming.close();
      });
    }
  });

  backToMain.send(incoming.sendPort); // provide a means of communication here
  askTimer = Timer.periodic(Duration(seconds: 1), (Timer t) {
    backToMain.send('I want to eat!'); // continuously request to eat
  });
}

