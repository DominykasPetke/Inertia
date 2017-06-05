class Player { //<>//
  int x, y;
  int gemsLeft;
  boolean isAlive;

  Player(int tempX, int tempY) {
    for (int i = 0; i < sizeX; i++) {   // nustatom, kiek yra deimantu //<>//
      for (int j = 0; j < sizeY; j++) {
        if (lenta[i][j].type == 1) {
          gemsLeft++;
        }
      }
    }

    x = tempX;
    y = tempY;

    isAlive = true;     // pradzioje gyvi
  }

  void draw() {   // piesiam zaideja
    fill(0, 255, 0);
    ellipse((x+0.5)*squareSize+distanceFromEdge, (y+0.5)*squareSize+distanceFromEdge, squareSize/2, squareSize/2);
  }

  void move(int moveX, int moveY) {    // judejimas kairen-zemyn
  movement: 
    while (true) {
      if (x + moveX >= 0 && x + moveX < sizeX && y + moveY >= 0 && y + moveY < sizeY) {
        switch(lenta[x+moveX][y+moveY].type) {
        case 0:    // jei nieko nera
          x+=moveX;
          y+=moveY;
          break;
        case 1:   // jei deimantas
          x+=moveX; 
          y+=moveY; 
          lenta[x][y].type = 0; 
          gemsLeft--;
          break;
        case 2:  // jei siena
          break movement;
        case 3:  // jei STOP langelis
          x+=moveX; 
          y+=moveY;
          break movement; 
        case 4:  // jei mina
          isAlive = false;
          x+=moveX;
          y+=moveY;
          break movement;
        default:
          break movement;
        }
      } else {
        break movement;
      }
    }
  }
}