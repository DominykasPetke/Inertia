class Langelis {
  int type;

  Langelis() {
    type = int(random(1, 5));
  }

  void draw(int x, int y) {
    switch (type) { 
    case 1:
      fill(255, 0, 0);
      break;
    case 2:
      fill(0, 255, 0);
      break;
    case 3:
      fill(0, 0, 255);
      break;
    case 4:
      fill(255, 255, 0);
      break;
    case 5:
      fill(255, 0, 255);
      break;
    default: 
      break;
    }
    rect(x, y, squareSize, squareSize);
  }
}