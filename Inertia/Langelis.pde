class Langelis {
  int type;

  Langelis() {
    type = int(random(0, 4.99));
  }
  
  void draw(int x, int y) {
    fill(254); 
    switch (type) { 
    case 0:  
      rect(x, y, squareSize, squareSize);
      break;
    case 1:
      rect(x, y, squareSize, squareSize);
      fill(100, 100, 160);
      ellipse(x+squareSize/2, y+squareSize/2, squareSize/2, squareSize/2);
      break;
    case 2:
      fill(0);
      rect(x, y, squareSize, squareSize);
      fill(160);
      rect(x+2, y+2, squareSize-4, squareSize-4);
      break;
    case 3:
      fill(255, 255, 0);
      break;
    case 4:
      fill(255, 0, 255);
      break;
    default: 
    fill(0);
      break;
    }

  }
}
