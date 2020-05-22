import 'dart:html';
import 'dart:async'; // for Timer
import 'dart:math'; // for Random

void main() {
  myCanvas = document.getElementById('myCanvas');
  myCanvas.onClick.listen(clickHappened);
  pigImage = ImageElement();
  newRandomPig();
  // This Timer will call update() approximately 60 times a second
  Timer.periodic(Duration(milliseconds: 17), update);
}

const int pig_width = 100;
const int pig_height = 50;
const String pig_right = 'images/pig_right.png';
const String pig_left = 'images/pig_left.png';

Random rand = Random();

int pigX, pigY, score = 0, speed;
CanvasElement myCanvas;
ImageElement pigImage;

/// Called by a Timer 60 times per second
void update(Timer t) {
  pigX += speed; //update pig's location
  // get a new pig when the last one has gone off screen
  if (pigX < (-pig_width) || pigX > myCanvas.width) {
    newRandomPig();
  }
  draw();
}

/// Draw a background, the pig, and the score
void draw() {
  var myCanvasContext = myCanvas.context2D;
  //draw the background
  myCanvasContext.setFillColorRgb(0, 0, 255); // Blue
  myCanvasContext.fillRect(0, 0, 500, 500); // 0x, 0y, 500 width, 500 height
  //draw the score in black at the top right of the screen
  var scoreText = 'Score: $score';
  myCanvasContext.setFillColorRgb(0, 0, 0); // Black
  myCanvasContext.fillText(scoreText, myCanvas.width - 100, 30); // string, x, y
  //draw the pig
  myCanvasContext.drawImageScaled(pigImage, pigX, pigY, pig_width, pig_height);
}

/// Sets up a new pig at a random location
void newRandomPig() {
  // if it's 1 it will go right, otherwise left

  speed = rand.nextInt(1) + 5; // random speed 5 to 14 pixels/frame
  pigY = rand.nextInt(myCanvas.height - pig_height); // random y
  var leftOrRight = rand.nextInt(2);
  if (leftOrRight == 1) {
    // going from left to right
    pigX = 0;
    pigImage.src = pig_right;
  } else {
    //going from right to left
    pigX = myCanvas.width - pig_width;
    pigImage.src = pig_left;
    speed = -speed; // move left not right
  }
}

/// When the canvas is clicked, we need to check if the user hit a pig
void clickHappened(MouseEvent me) {
  //check if click was within the pig's space
  final clickX = me.offset.x;
  final clickY = me.offset.y;
  if (clickX > pigX &&
      clickX < pigX + pig_width &&
      clickY > pigY &&
      clickY < pigY + pig_height) {
    // we have a hit
    score++;
    newRandomPig();
  }
}
