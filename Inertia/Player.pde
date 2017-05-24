class Player { //<>// //<>//
  int x, y;
  int gemsLeft;
  boolean isAlive;

  Player(int tempX, int tempY) {
    for (int i = 0; i < sizeX; i++) {   // nustatom, kiek yra deimantu
      for (int j = 0; j < sizeY; j++) {
        if (isGem(i, j)) {
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

  void move1() {    // judejimas kairen-zemyn
  movement: 
    while (true) {
      if (x > 0 && y < sizeY-1) {
        switch(lenta[x-1][y+1].type) {
        case 0:    // jei nieko nera
          x--;
          y++;
          break;
        case 1:   // jei deimantas
          x--; 
          y++; 
          lenta[x][y].type = 0; 
          gemsLeft--;
          break;
        case 2:  // jei siena
          break movement;
        case 3:  // jei STOP langelis
          x--; 
          y++; 
          break movement; 
        case 4:  // jei mina
          isAlive = false;
          x--; 
          y++; 
          break movement;
        default:
          break movement;
        }
      } else {
        break movement;
      }
    }
  }

  void move2() {
  movement: 
    while (true) {
      if (y < sizeY-1) {
        switch(lenta[x][y+1].type) {
        case 0:    // jei nieko nera
          y++;
          break;
        case 1:   // jei deimantas
          y++; 
          lenta[x][y].type = 0; 
          gemsLeft--;
          break;
        case 2:  // jei siena
          break movement;
        case 3:  // jei STOP langelis 
          y++; 
          break movement; 
        case 4:  // jei mina
          isAlive = false;
          y++;
          break movement;
        default:
          break movement;
        }
      } else {
        break movement;
      }
    }
  }

  void move3() {
  movement: 
    while (true) {
      if (x < sizeX - 1 && y < sizeY-1) {
        switch(lenta[x+1][y+1].type) {
        case 0:    // jei nieko nera
          x++;
          y++;
          break;
        case 1:   // jei deimantas
          x++;
          y++; 
          lenta[x][y].type = 0; 
          gemsLeft--;
          break;
        case 2:  // jei siena
          break movement;
        case 3:  // jei STOP langelis 
          x++;
          y++; 
          break movement; 
        case 4:  // jei mina
          x++;
          y++;
          isAlive = false;
          break movement;
        default:
          break movement;
        }
      } else {
        break movement;
      }
    }
  }

  void move4() {
  movement: 
    while (true) {
      if (x > 0) {
        switch(lenta[x-1][y].type) {
        case 0:    // jei nieko nera
          x--;
          break;
        case 1:   // jei deimantas
          x--; 
          lenta[x][y].type = 0; 
          gemsLeft--;
          break;
        case 2:  // jei siena
          break movement;
        case 3:  // jei STOP langelis 
          x--; 
          break movement; 
        case 4:  // jei mina
          x--;
          isAlive = false;
          break movement;
        default:
          break movement;
        }
      } else {
        break movement;
      }
    }
  }

  void move6() {
  movement: 
    while (true) {
      if (x < sizeX-1) {
        switch(lenta[x+1][y].type) {
        case 0:    // jei nieko nera
          x++;
          break;
        case 1:   // jei deimantas
          x++; 
          lenta[x][y].type = 0; 
          gemsLeft--;
          break;
        case 2:  // jei siena
          break movement;
        case 3:  // jei STOP langelis 
          x++; 
          break movement; 
        case 4:  // jei mina
          x++;
          isAlive = false;
          break movement;
        default:
          break movement;
        }
      } else {
        break movement;
      }
    }
  }

  void move7() {
  movement: 
    while (true) {
      if (x > 0 && y > 0) {
        switch(lenta[x-1][y-1].type) {
        case 0:    // jei nieko nera
          x--;
          y--;
          break;
        case 1:   // jei deimantas
          x--;
          y--; 
          lenta[x][y].type = 0; 
          gemsLeft--;
          break;
        case 2:  // jei siena
          break movement;
        case 3:  // jei STOP langelis 
          x--;
          y--; 
          break movement; 
        case 4:  // jei mina
          x--;
          y--;
          isAlive = false;
          break movement;
        default:
          break movement;
        }
      } else {
        break movement;
      }
    }
  }

  void move8() {
  movement: 
    while (true) {
      if (y > 0) {
        switch(lenta[x][y-1].type) {
        case 0:    // jei nieko nera
          y--;
          break;
        case 1:   // jei deimantas
          y--; 
          lenta[x][y].type = 0; 
          gemsLeft--;
          break;
        case 2:  // jei siena
          break movement;
        case 3:  // jei STOP langelis 
          y--; 
          break movement; 
        case 4:  // jei mina
          y--;
          isAlive = false;
          break movement;
        default:
          break movement;
        }
      } else {
        break movement;
      }
    }
  }

  void move9() {
  movement: 
    while (true) {
      if (x < sizeX-1 && y > 0) {
        switch(lenta[x+1][y-1].type) {
        case 0:    // jei nieko nera
          x++;
          y--;
          break;
        case 1:   // jei deimantas
          x++;
          y--; 
          lenta[x][y].type = 0; 
          gemsLeft--;
          break;
        case 2:  // jei siena
          break movement;
        case 3:  // jei STOP langelis 
          x++;
          y--; 
          break movement; 
        case 4:  // jei mina
          isAlive = false;
          x++;
          y--;
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