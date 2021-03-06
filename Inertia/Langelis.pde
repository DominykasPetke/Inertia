class Langelis {
  int type;
  int x, y;

  Langelis(int tempX, int tempY) {
    type = int(random(5));
    x = tempX;
    y = tempY;
  }

  void draw() {
    int posX = x*squareSize+distanceFromEdge;
    int posY = y*squareSize+distanceFromEdge;
    int halfSize = squareSize/2;
    fill(255);

    switch (type) { 
    case 0:  // tuscias laukelis
      rect(posX, posY, squareSize, squareSize);
      break;
    case 1:   // deimantas
      rect(posX, posY, squareSize, squareSize);
      fill(0, 180, 250);
      quad(posX+halfSize, posY+6, posX+10, posY+halfSize, posX+halfSize, posY+halfSize+halfSize-6, posX+halfSize+halfSize-10, posY+halfSize);
      break;
    case 2:  // siena
      fill(0);
      rect(posX, posY, squareSize, squareSize);
      fill(160);
      rect(posX+2, posY+2, squareSize-4, squareSize-4);
      break;
    case 3:  // "STOP"
      rect(posX, posY, squareSize, squareSize);
      noFill();
      ellipse(posX+halfSize, posY+halfSize, halfSize, halfSize);
      break;
    case 4: // mina
      rect(posX, posY, squareSize, squareSize);
      fill(0, 0, 0);
      ellipse(posX+halfSize, posY+halfSize, halfSize, halfSize);
      break;
    default:  // nieko
      break;
    }
  }
}