int sizeX = 20; //<>//
int sizeY = 15;
int squareSize = 40;
int distanceFromEdge = 15;
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
  textSize(distanceFromEdge);
  text(player.gemsLeft, distanceFromEdge, distanceFromEdge-1);

  if (!player.isAlive) {   // jei negyvas
    text("Press R to restart", distanceFromEdge+squareSize, distanceFromEdge-1);
    fill(255, 0, 0);
    textSize(squareSize*1.33);
    text("X", player.x*squareSize+distanceFromEdge, (player.y+1)*squareSize+distanceFromEdge);
  } else if (player.gemsLeft == 0) {
    background(0, 255, 0);
    text("You win!", distanceFromEdge+squareSize, distanceFromEdge-1);
    text("Press R to restart", distanceFromEdge+squareSize, distanceFromEdge+squareSize);
  }
}

void keyPressed () {  // numpad PLS
  switch(key) {
  case '1': 
    if (player.isAlive && player.gemsLeft != 0) {
      player.move(-1, 1);
    }
    break;
  case '2': 
    if (player.isAlive && player.gemsLeft != 0) {
      player.move(0, 1);
    }
    break;
  case '3': 
    if (player.isAlive && player.gemsLeft != 0) {
      player.move(1, 1);
    }
    break;
  case '4':
    if (player.isAlive && player.gemsLeft != 0) {
      player.move(-1, 0);
    }
    break;
  case '6': 
    if (player.isAlive && player.gemsLeft != 0) {
      player.move(1, 0);
    }
    break;
  case '7': 
    if (player.isAlive && player.gemsLeft != 0) {
      player.move(-1, -1);
    }
    break;
  case '8': 
    if (player.isAlive && player.gemsLeft != 0) {
      player.move(0, -1);
    }
    break;
  case '9': 
    if (player.isAlive && player.gemsLeft != 0) {
      player.move(1, -1);
    }
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