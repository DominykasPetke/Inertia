int autoSolve(Player start) { //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
  int size = sizeX*sizeY*player.gemsLeft*2;
  Player[] queue = new Player[size];
  int[] from = new int [size];
  int[] direction = new int [size];
  int members = 1;
  int current = 0;
  queue[0] = new Player(start);

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

  boolean[][] isCollected = new boolean[size][gemCount];

  while (members > current) {
    if (queue[current].gemsLeft == 0) {
      while (from[current] > 0) {
        current = from[current];
      }

      for (int i = 0; i < gemCount; i++) {
        lenta[gemList[i][0]][gemList[i][1]].type = 1;
      }

      return direction[current];
    }

    for (int i = 1; i < 10; i++) {
      Player orig = new Player(queue[current]);

      switch(i) {
      case 1: 
        queue[current].move(-1, 1);
        break;
      case 2: 
        queue[current].move(0, 1);
        break;
      case 3: 
        queue[current].move(1, 1);
        break;
      case 4: 
        queue[current].move(-1, 0);
        break;
      case 5: 
        i++;
        queue[current].move(1, 0);
        break;
      case 7: 
        queue[current].move(-1, -1);
        break;
      case 8: 
        queue[current].move(0, -1);
        break;
      case 9:
        queue[current].move(1, -1);
        break;
      default: 
        break;
      }

      if (queue[current].isAlive) {
        int where = whereInQueue(queue[current], queue, members, current);

        if (where > -1) {
          if (where > current) {
            if ((queue[where].gemsLeft > queue[current].gemsLeft) || (queue[where].gemsLeft == queue[current].gemsLeft && queue[where].moves > queue[current].moves)) {
              queue[where] = new Player(queue[current]);
              from[where] = current;
              direction[where] = i;

              while (where - 1 != current && queue[where-1].gemsLeft > queue[where].gemsLeft || queue[where-1].moves > queue[where].moves) {
                moveBack(queue[where], queue, where);
                moveBack(from[where], from, where);
                moveBack(direction[where], direction, where);
                moveBack(isCollected[where], isCollected, where);
                where--;
              }

              for (int j = 0; j < gemCount; j++) {
                if (lenta[gemList[j][0]][gemList[j][1]].type != 1) {
                  isCollected[where][j] = true;
                }
              }
            }
          } else if (where < current) {
            queue[members] = new Player(queue[current]);
            from[members] = current;
            direction[members] = i;

            int curPos = members;

            while (queue[curPos-1].gemsLeft > queue[curPos].gemsLeft) {
              moveBack(queue[curPos], queue, curPos);
              moveBack(from[curPos], from, curPos);
              moveBack(direction[curPos], direction, curPos);
              moveBack(isCollected[curPos], isCollected, curPos);
              curPos--;
            }

            while (queue[curPos-1].gemsLeft >= queue[curPos].gemsLeft && queue[curPos-1].moves > queue[curPos].moves) {
              moveBack(queue[curPos], queue, curPos);
              moveBack(from[curPos], from, curPos);
              moveBack(direction[curPos], direction, curPos);
              moveBack(isCollected[curPos], isCollected, curPos);
              curPos--;
            }

            for (int j = 0; j < gemCount; j++) {
              if (lenta[gemList[j][0]][gemList[j][1]].type != 1) {
                isCollected[curPos][j] = true;
              }
            }

            members++;
          }
        } else if (queue[current].x != orig.x || queue[current].y != orig.y) {
          queue[members] = new Player(queue[current]);
          from[members] = current;
          direction[members] = i;

          int curPos = members;

          while (curPos - 1 != current && (queue[curPos-1].gemsLeft > queue[curPos].gemsLeft || queue[curPos-1].moves > queue[curPos].moves)) {
            moveBack(queue[curPos], queue, curPos);
            moveBack(from[curPos], from, curPos);
            moveBack(direction[curPos], direction, curPos);
            moveBack(isCollected[curPos], isCollected, curPos);
            curPos--;
          }

          for (int j = 0; j < gemCount; j++) { //<>//
            if (lenta[gemList[j][0]][gemList[j][1]].type != 1) {
              isCollected[curPos][j] = true;
            }
          }

          members++;
        }
      }

      for (int j = 0; j < gemCount; j++) {
        if (isCollected[current][j]) {
          lenta[gemList[j][0]][gemList[j][1]].type = 0;
        } else { 
          lenta[gemList[j][0]][gemList[j][1]].type = 1;
        }
      }

      queue[current] = new Player(orig);
    }
    current++;
  }

  for (int i = 0; i < gemCount; i++) {
    lenta[gemList[i][0]][gemList[i][1]].type = 1;
  }

  return -1;
}

int whereInQueue(Player what, Player[] where, int amount, int exclude) {
  for (int i = amount-1; i > -1; i--) {
    if (i != exclude && what.x == where[i].x && what.y == where[i].y) {
      return i;
    }
  }
  return -1;
}

void moveBack(int what, int where[], int pos) {
  pos--;
  int temp = where[pos];
  where[pos] = what;
  where[pos+1] = temp;
}

void moveBack(boolean[] what, boolean where[][], int pos) {
  pos--;
  boolean temp[] = where[pos];
  where[pos] = what;
  where[pos+1] = temp;
}

void moveBack(Player what, Player where[], int pos) {
  pos--;
  Player temp = new Player (where[pos]);
  where[pos] = new Player (what);
  where[pos+1] = new Player (temp);
}