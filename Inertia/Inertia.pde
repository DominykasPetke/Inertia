int sizeX = 20;
int sizeY = 15;
int squareSize = 40;
int distanceFromEdge = 20;
color backgroundColor = color(200);

Langelis lenta[][] = new Langelis[sizeX][sizeY];
Player player;

void setup() {
  size(1, 1);
  surface.setResizable(true);                  // nustatom lango dydi
  surface.setSize(squareSize*sizeX+distanceFromEdge*2, squareSize*sizeY+distanceFromEdge*2);
  surface.setResizable(false);
  boolean tryAgain = true;

  while (tryAgain) {
    int[][] possibleStartSpots = new int [sizeX*sizeY][];
    int spotsCount = 0;
    for (int i = 0; i < sizeX; i++) {   // generuojam lenta
      for (int j = 0; j < sizeY; j++) {
        lenta[i][j] = new Langelis(i, j);
        if (lenta[i][j].type == 3) {
          possibleStartSpots[spotsCount] = new int []{i, j};
          spotsCount++;
        }
      }
    }

    int[][] legalStartSpots = new int [spotsCount][];
    int legalSpotsCount = 0;

    for (int i = 0; i < spotsCount; i++) {
      if (isStartSpot(possibleStartSpots[i][0], possibleStartSpots[i][1])) {
        legalStartSpots[legalSpotsCount] = possibleStartSpots[i];
        legalSpotsCount++;
      }
    }

    if (legalSpotsCount > 0) {
      tryAgain = false;
      int choice = int(random(legalSpotsCount));
      player = new Player(legalStartSpots[choice][0], legalStartSpots[choice][1]);  // generuojam zaideja
    }
  }
}

void draw() {
  background(backgroundColor);

  for (int i = 0; i < sizeX; i++) {
    for (int j = 0; j < sizeY; j++) {
      lenta[i][j].draw();
    }
  }
  
  player.draw();
  fill(0);
  textSize(12);
  text(player.gemsLeft, distanceFromEdge, distanceFromEdge-1);
  
  if (!player.isAlive) {   // jei negyvas
    text("Press R to restart", distanceFromEdge+squareSize, distanceFromEdge-1);
    fill(255, 0, 0);
    textSize(squareSize*1.3);
    text("X", player.x*squareSize+distanceFromEdge, (player.y+1)*squareSize+distanceFromEdge);
  }
}

void keyPressed () {  // numpad PLS
  switch(key) {
  case '1': 
    player.move1();
    break;
  case '2': 
    player.move2();
    break;
  case '3': 
    player.move3();
    break;
  case '4': 
    player.move4();
    break;
  case '6': 
    player.move6();
    break;
  case '7': 
    player.move7();
    break;
  case '8': 
    player.move8();
    break;
  case '9': 
    player.move9();
    break;
  case 'R': 
    setup();
    break; 
  case 'r': 
    setup(); 
    break;
  default: 
    break;
  }
}

boolean isGem(int x, int y) {   // ar deimantas
  if (lenta[x][y].type == 1) {
    return true;
  }
  return false;
}
