int sizeX = 20; //<>//
int sizeY = 15;
int squareSize = 40;
int distanceFromEdge = 20;
color backgroundColor = color(200);
int posX, posY;

Langelis lenta[][] = new Langelis[sizeX][sizeY];
Player player;

void setup() {
  size(1, 1);
  surface.setResizable(true);                  // nustatom lango dydi
  surface.setSize(squareSize*sizeX+distanceFromEdge*2, squareSize*sizeY+distanceFromEdge*2);
  surface.setResizable(false);

  for (int i = 0; i < sizeX; i++) {   // generuojam lenta
    for (int j = 0; j < sizeY; j++) {
      lenta[i][j] = new Langelis(i, j);
    }
  }

  player = new Player();  // generuojam zaideja
}

void draw() {
  background(backgroundColor);

  if (player.isAlive) {   // jei gyvas
    for (int i = 0; i < sizeX; i++) {
      for (int j = 0; j < sizeY; j++) {
        lenta[i][j].draw();
      }
    }

    player.draw();

    fill(0);
    text(player.gemsLeft, distanceFromEdge-1, distanceFromEdge);
  } else {
    fill(0);
    text("Press R to restart", squareSize*2+distanceFromEdge, squareSize*2+distanceFromEdge);
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

boolean isStopSpot (int x, int y) {   // ar galima cia pradeti zaidima
  if (lenta[x][y].type == 3) {
    return true;
  }
  return false;
}

boolean isGem(int x, int y) {   // ar deimantas
  if (lenta[x][y].type == 1) {
    return true;
  }
  return false;
}