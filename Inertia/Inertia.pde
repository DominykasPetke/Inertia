int sizeX = 16;
int sizeY = 26;
int squareSize = 20;
int distanceFromEdge = 10;

Langelis lenta[][] = new Langelis[sizeX][sizeY];

void setup() {
  size(1,1);
  surface.setResizable(true);
  surface.setSize(squareSize*sizeX+distanceFromEdge*2, squareSize*sizeY+distanceFromEdge*2);
  surface.setResizable(false);
  for (int i = 0; i < sizeX; i++) {
    for (int j = 0; j < sizeY; j++) {
      lenta[i][j] = new Langelis();
    }
  }
}
void draw() {
  background(198);
  for (int i = 0; i < sizeX; i++) {
    for (int j = 0; j < sizeY; j++) {
      lenta[i][j].draw(i*squareSize+distanceFromEdge, j*squareSize+distanceFromEdge);
    }
  }
}