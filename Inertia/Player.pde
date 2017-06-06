class Player {
  int x, y;
  int gemsLeft;
  boolean isAlive;

  Player(int tempX, int tempY) {
    for (int i = 0; i < sizeX; i++) {   // nustatom, kiek yra deimantu
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

  void move(int moveX, int moveY) {    // judejimas
  movement: 
    while (true) {
      int newX = x + moveX;
      int newY = y + moveY;
      if (newX >= 0 && newX < sizeX && newY >= 0 && newY < sizeY) {
        switch(lenta[newX][newY].type) {
        case 0:    // jei nieko nera
          x = newX;
          y = newY;
          break;
        case 1:   // jei deimantas
          x = newX; 
          y = newY; 
          lenta[x][y].type = 0; 
          gemsLeft--;
          break;
        case 2:  // jei siena
          break movement;
        case 3:  // jei STOP langelis
          x = newX; 
          y = newY;
          break movement; 
        case 4:  // jei mina
          isAlive = false;
          x = newX;
          y = newY;
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