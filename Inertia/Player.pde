class Player { //<>//
  int startX, startY;
  int x, y;
  int gemsLeft;
  boolean isAlive;

  Player() {
    int[][] coords = new int[sizeX*sizeY][2];
    int count = 0;

    for (int i = 0; i < sizeX; i++) {
      for (int j = 0; j < sizeY; j++) {
        if (isValidPosition(i, j)) {
          coords[count] = new int[]{i, j};
          count++;
        }
        if (isGem(i, j)) {
          gemsLeft++;
        }
      }
    }

    int choice = int(random(count));
    x = coords[choice][0];
    y = coords[choice][1];

    startX = x;
    startY = y;

    isAlive = true;
  }

  boolean isValidPosition (int x, int y) {
    if (lenta[x][y].type == 3) {
      return true;
    }
    return false;
  }

  boolean isGem(int x, int y) {
    if (lenta[x][y].type == 1) {
      return true;
    }
    return false;
  }

  void draw() {
    fill(0, 255, 0);
    ellipse((x+0.5)*squareSize+distanceFromEdge, (y+0.5)*squareSize+distanceFromEdge, squareSize/2, squareSize/2);
  }

  void move1() {
  movement: 
    while (true) {
      if (x > 0 && y < sizeY-1) {
        switch(lenta[x-1][y+1].type) {
        case 0: 
          x--;
          y++;
          break;
        case 1: 
          x--; 
          y++; 
          lenta[x][y].type = 0; 
          gemsLeft--;
          break;
        case 2: 
          break movement;
        case 3: 
          x--; 
          y++; 
          break movement; 
        case 4: 
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
  }
  void move3() {
  }
  void move4() {
  }
  void move6() {
  }
  void move7() {
  }
  void move8() {
  }
  void move9() {
  }
}