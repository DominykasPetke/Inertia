void generateLevel() {
  boolean tryAgain = true;
  lenta = new Langelis[sizeX][sizeY];

  while (tryAgain) {
    for (int i = 0; i < sizeX; i++) {   // generuojam lenta
      for (int j = 0; j < sizeY; j++) {
        lenta[i][j] = new Langelis(i, j);
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
      player = new Player(legalStartSpots[choice][0], legalStartSpots[choice][1]);  // generuojam zaideja
      if (player.gemsLeft > 0) {
        tryAgain = false;
      }
    }
  }
  
  isGenerated = true;
}