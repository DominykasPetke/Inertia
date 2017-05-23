class Player {
  int x, y;

  Player() {
    int[][] coords = new int[sizeX*sizeY][2];
    int count = 0;

    for (int i = 0; i < sizeX; i++) {
      for (int j = 0; j < sizeY; j++) {
        if (isValidPosition(i, j)) {
          coords[count] = new int[]{i, j};
          count++;
        }
      }
    }

    int choice = int(random(count));
    this.x = coords[choice][0];
    this.y = coords[choice][1];
  }

  boolean isValidPosition (int x, int y) {
    if (lenta[x][y].type == 3) {
      return true;
    }
    return false;
  }

  void draw() {
    int posX = x*squareSize+distanceFromEdge;
    int posY = y*squareSize+distanceFromEdge;
    fill(0, 255, 0);
    ellipse(posX+squareSize/2, posY+squareSize/2, squareSize/2, squareSize/2);
  }
}