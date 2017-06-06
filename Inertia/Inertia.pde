import controlP5.*; //<>// //<>//

ControlP5 cp5;

int sizeX;
int sizeY;
int squareSize;
int distanceFromEdge;
color backgroundColor = color(200);
boolean isGenerated = false;

Langelis lenta[][];
Player player;

void setup() {
  size(470, 170);

  PFont font = createFont("arial", 12);

  cp5 = new ControlP5(this);

  color textfieldBackground = color(30, 144, 250);
  cp5.addTextfield("ssizeX").setPosition(020, 20).setSize(100, 30).setFont(font).setColor(color(255)).setAutoClear(false).setValue("20").setColorBackground(textfieldBackground).setCaptionLabel("Lentos dydis\ni sona\n(min. 5)");
  cp5.addTextfield("ssizeY").setPosition(130, 20).setSize(100, 30).setFont(font).setColor(color(255)).setAutoClear(false).setValue("15").setColorBackground(textfieldBackground).setCaptionLabel("Lentos dydis\ni auksti\n(min. 5)");
  cp5.addTextfield("sizeSq").setPosition(240, 20).setSize(100, 30).setFont(font).setColor(color(255)).setAutoClear(false).setValue("40").setColorBackground(textfieldBackground).setCaptionLabel("Langelio\ndydis\n(min. 25)");
  cp5.addTextfield("sizeDi").setPosition(350, 20).setSize(100, 30).setFont(font).setColor(color(255)).setAutoClear(false).setValue("20").setColorBackground(textfieldBackground).setCaptionLabel("Lentos atstumas\nnuo lango\nkrasto\n(min. 10)");
  cp5.addButton("confirm").setPosition(185, 120).setFont(createFont("arial", 16)).setSize(100, 30).setColorBackground(color(72, 61, 139)).setCaptionLabel("Testi").activateBy(ControlP5.RELEASE);
  textFont(font);
}

public void confirm() {  // kai paspaudziu mygtuka
  int newSizeX = parseInt(cp5.get(Textfield.class, "ssizeX").getText());
  int newSizeY = parseInt(cp5.get(Textfield.class, "ssizeY").getText());
  int newSquareSize = parseInt(cp5.get(Textfield.class, "sizeSq").getText());
  int newDistanceFromEdge = parseInt(cp5.get(Textfield.class, "sizeDi").getText());

  if (newSizeX > 4 && newSizeY > 4 && newSquareSize > 24 && newDistanceFromEdge > 9) {  // jei yra bent minimalios reiksmes
    sizeX = newSizeX;
    sizeY = newSizeY;
    squareSize = newSquareSize;
    distanceFromEdge = newDistanceFromEdge;

    surface.setResizable(true);                  // nustatom lango dydi
    surface.setSize(squareSize*sizeX+distanceFromEdge*2, squareSize*sizeY+distanceFromEdge*2);
    surface.setResizable(false);

    cp5.hide();   // paslepiam GUI

    generateLevel();  // generuojam lygi
  }
}

void draw() {
  if (isGenerated) {
    background(backgroundColor);

    for (int i = 0; i < sizeX; i++) {
      for (int j = 0; j < sizeY; j++) {
        lenta[i][j].draw();
      }
    }

    player.draw();
    fill(0);
    textSize(distanceFromEdge*0.75);
    text("Gems left: " + player.gemsLeft, distanceFromEdge, distanceFromEdge-1);
    text("Moves taken: " + player.moves, distanceFromEdge, height-distanceFromEdge*0.25);

    if (!player.isAlive) {   // jei negyvas
      text("Press R to restart", width-distanceFromEdge-120/(20/distanceFromEdge), distanceFromEdge-1);
      fill(255, 0, 0);
      textSize(squareSize*1.33);
      text("X", player.x*squareSize+distanceFromEdge, (player.y+1)*squareSize+distanceFromEdge);
    } else if (player.gemsLeft == 0) {   // jei laimejom
      background(0, 255, 0);
      text("You win!", distanceFromEdge+squareSize, distanceFromEdge-1);
      text("Press R to restart", distanceFromEdge+squareSize, distanceFromEdge+squareSize);
    }
  }
}

void keyPressed () {  // numpad PLS
  if (isGenerated) {
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
      generateLevel();
      break; 
    case 'r': 
      generateLevel(); 
      break;
    default: 
      break;
    }
  }
}