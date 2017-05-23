class Langelis {
  int type;
  int x, y;

  Langelis(int x, int y) {
    type = int(random(0, 4.99));
    this.x = x;
    this.y = y;
  }

  void draw() {
    int posX = x*squareSize+distanceFromEdge;
    int posY = y*squareSize+distanceFromEdge;
    fill(255); 
    switch (type) { 
    case 0:  
      rect(posX, posY, squareSize, squareSize);
      break;
    case 1:
      rect(posX, posY, squareSize, squareSize);
      fill(100, 100, 160);
      ellipse(posX+squareSize/2, posY+squareSize/2, squareSize/2, squareSize/2);
      break;
    case 2:
      fill(0);
      rect(posX, posY, squareSize, squareSize);
      fill(160);
      rect(posX+2, posY+2, squareSize-4, squareSize-4);
      break;
    case 3:
      rect(posX, posY, squareSize, squareSize);
      noFill();
      ellipse(posX+squareSize/2, posY+squareSize/2, squareSize/2, squareSize/2);
      break;
    case 4:
      rect(posX, posY, squareSize, squareSize);
      fill(255, 0, 0);
      ellipse(posX+squareSize/2, posY+squareSize/2, squareSize/2, squareSize/2);
      break;
    default: 
      fill(0);
      break;
    }
  }
}