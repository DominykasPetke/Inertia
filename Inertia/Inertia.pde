int sizeX = 8;
int sizeY = 6;
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

  for (int i = 0; i < sizeX; i++) {
    for (int j = 0; j < sizeY; j++) {
      lenta[i][j] = new Langelis(i, j);
    }
  }
  
  player = new Player();
}

void draw() {
  background(backgroundColor);

  for (int i = 0; i < sizeX; i++) {
    for (int j = 0; j < sizeY; j++) {
      lenta[i][j].draw();
    }
  }
  
  player.draw();
}