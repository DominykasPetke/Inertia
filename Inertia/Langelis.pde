class Langelis {
  int type;

  Langelis() {
    type = int(random(0, 4.99));
  }
  
  void draw(int x, int y) {
    fill(254); 
    rect(x, y, squareSize, squareSize);
    switch (type) { 
    case 0:
      fill(255, 0, 0);   
      ellipse(x+squareSize/2, y+squareSize/2, squareSize/2-squareSize/50, squareSize/2-squareSize/50);
      break;
    case 1:
      fill(0, 255, 0);
      break;
    case 2:
      fill(0, 0, 255);
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
