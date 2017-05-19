int sizeX = 8;
int sizeY = 6;
int squareSize = 30;
int distaceFromEdge = 30;

Langelis lenta[][] = new Langelis[sizeX][sizeY];

void setup() {
  size(1024, 600);
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
      lenta[i][j].draw(i*squareSize+distaceFromEdge, j*squareSize+distaceFromEdge);
    }
  }
}