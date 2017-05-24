boolean isStartSpot (int x, int y) {   // ar galima cia pradeti zaidima //<>//
  Langelis original[][] = new Langelis[sizeX][sizeY]; //<>//

  cloneMatrix(lenta, original);

  int[][] gemList = new int[sizeX*sizeY][];
  int gemCount = 0;

  for (int i = 0; i < sizeX; i++) {
    for (int j = 0; j < sizeY; j++) {
      if (isGem(i, j)) {
        gemList[gemCount] = new int[] {
          i, j
        };
        gemCount++;
      }
    }
  }

  boolean[] isReachable = new boolean[gemCount];

  int[][] queue = new int [sizeX*sizeY][];
  int members = 1;
  int membersUsed = 0;
  queue[0] = new int [] {x, y};

  while (members > membersUsed) { //<>//
    for (int i = 1; i < 10; i++) {
      Player klonas = new Player (queue[membersUsed][0], queue[membersUsed][1]);
      if (i == 5) {
        i = 6;
      }

      switch(i) {
      case 1: 
        klonas.move1();
        break;
      case 2: 
        klonas.move2();
        break;
      case 3: 
        klonas.move3();
        break;
      case 4: 
        klonas.move4();
        break;
      case 6: 
        klonas.move6();
        break;
      case 7: 
        klonas.move7();
        break;
      case 8: 
        klonas.move8();
        break;
      case 9:
        klonas.move9();
        break;
      default: 
        break;
      }

      if (klonas.isAlive) {
        for (int j = 0; j < gemCount; j++) {
          if (lenta[gemList[j][0]][gemList[j][1]].type != 1) {
            lenta[gemList[j][0]][gemList[j][1]].type = 1;
            isReachable[j] = true;
          }
        }

        if (!isInMatrix(klonas.x, klonas.y, queue, members) && (queue[membersUsed][0] != klonas.x || queue[membersUsed][1] != klonas.y)) { //<>//
          queue[members] = new int[] {klonas.x, klonas.y};
          members++;
        }
      }
    }

    membersUsed++;
  }

  cloneMatrix(original, lenta);
  for (int i = 0; i < gemCount; i++) {
    if (!isReachable[i]) {
      return false;
    }
  }

  return true;
}

void cloneMatrix (Langelis from[][], Langelis to[][]) {
  if (from != to) {
    for (int i = 0; i < sizeX; i++) {
      for (int j = 0; j < sizeY; j++) {
        to[i][j] = from[i][j];
      }
    }
  }
}

boolean isInMatrix(int x, int y, int where[][], int members) {
  for (int i = 0; i < members; i++) { //<>//
    if (x == where[i][0] && y == where[i][1]) {
      return true;
    }
  }
  return false;
}