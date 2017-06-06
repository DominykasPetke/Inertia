void generateLevel() { //<>//
  boolean tryAgain = true;
  lenta = new Langelis[sizeX][sizeY];

  while (tryAgain) {
    boolean noGem = true;
    while (noGem) {
      for (int i = 0; i < sizeX; i++) {   // generuojam lenta
        for (int j = 0; j < sizeY; j++) {
          lenta[i][j] = new Langelis(i, j);
        }
      }

      player = new Player (0, 0);
      if (player.gemsLeft > 0) {
        noGem = false;
      }
    }

    int[][] legalStartSpots = new int [sizeX*sizeY][];
    int legalSpotsCount = 0;

    for (int i = 0; i < sizeX; i++) {
      for (int j = 0; j < sizeY; j++) {
        if (isStartSpot(i, j)) {
          legalStartSpots[legalSpotsCount] = new int[] {i, j};
          legalSpotsCount++;
        }
      }
    }

    if (legalSpotsCount > 0) {
      int choice = int(random(legalSpotsCount));
      player.x = legalStartSpots[choice][0];  // generuojam zaideja
      player.y = legalStartSpots[choice][1];
      tryAgain = false;
    }
  }

  isGenerated = true;
}

boolean isStartSpot (int x, int y) {   // ar galima cia pradeti zaidima
  if (lenta[x][y].type != 3) {
    return false;
  }

  int gemCount = 0;
  int[][] gemList = new int[sizeX*sizeY][];

  for (int i = 0; i < sizeX; i++) {
    for (int j = 0; j < sizeY; j++) {
      if (lenta[i][j].type == 1) {
        gemList[gemCount] = new int[] {i, j};
        gemCount++;
      }
    }
  }

  boolean[] isReachable = new boolean[gemCount];

  int[][] queue = new int [sizeX*sizeY][];
  int members = 1;
  int current = 0;
  queue[0] = new int [] {x, y};

  while (members > current) {
    for (int i = 1; i < 9; i++) {
      Player klonas = new Player (queue[current][0], queue[current][1]);

      switch(i) {
      case 1: 
        klonas.move(-1, 1);
        break;
      case 2: 
        klonas.move(0, 1);
        break;
      case 3: 
        klonas.move(1, 1);
        break;
      case 4: 
        klonas.move(-1, 0);
        break;
      case 5: 
        klonas.move(1, 0);
        break;
      case 6: 
        klonas.move(-1, -1);
        break;
      case 7: 
        klonas.move(0, -1);
        break;
      case 8:
        klonas.move(1, -1);
        break;
      default: 
        break;
      }

      if (klonas.isAlive) {
        for (int j = 0; j < gemCount; j++) {
          if (lenta[gemList[j][0]][gemList[j][1]].type != 1) {
            isReachable[j] = true;
          }
        }

        if (!isInMatrix(klonas.x, klonas.y, queue, members) && (queue[current][0] != klonas.x || queue[current][1] != klonas.y)) {
          queue[members] = new int[] {klonas.x, klonas.y};
          members++;
        }
      }

      for (int j = 0; j < gemCount; j++) {
        lenta[gemList[j][0]][gemList[j][1]].type = 1;
      }
    }

    current++;
  }

  for (int i = 0; i < gemCount; i++) {
    if (!isReachable[i]) {
      return false;
    }
  }

  return true;
}

boolean isInMatrix(int x, int y, int where[][], int members) {
  for (int i = 0; i < members; i++) {
    if (x == where[i][0] && y == where[i][1]) {
      return true;
    }
  }
  return false;
}