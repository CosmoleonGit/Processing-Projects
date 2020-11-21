final int horizontal = 96;
final int vertical = 72;

boolean[][] tiles = new boolean[horizontal][vertical];

final int tileSize = 8;

boolean showGrid = true;

void setup(){
  frameRate(24);
  
  surface.setTitle("Conway's Game of Life");
  size(768, 576);
}

void resetGrid(){
  for (int x = 0; x < horizontal; x++){
    for (int y = 0; y < vertical; y++){
      tiles[x][y] = false;
    }
  }
}

final int chanceOfLiving = 25;

void randomizeGrid(){
  for (int x = 0; x < horizontal; x++){
    for (int y = 0; y < vertical; y++){
      float r = random(100);
      
      tiles[x][y] = r < chanceOfLiving;
    }
  }
}

void draw(){
  doEvents();
  drawGraphics();
}

void keyPressed(){
  if (key == ' '){
    nextIteration();
  } else if (key == 'n'){
    resetGrid();
  } else if (key == 'r'){
    randomizeGrid();
  } else if (key == 'g'){
    showGrid = !showGrid;
  } else if (key == '1'){
    for (int x = 46; x < 49; x++){
      for (int y = 0; y < vertical; y++){
        tiles[x][y] = true;
      }
    }
    
    for (int x = 0; x < horizontal; x++){
      for (int y = 34; y < 37; y++){
        tiles[x][y] = true;
      }
    }
  }
}

void doEvents(){
  int mX = mouseX / tileSize;
  int mY = mouseY / tileSize;
  
  if (mousePressed && inBounds(mX, mY)) {
    if (mouseButton == LEFT){
      tiles[mX][mY] = true;
    } else if (mouseButton == RIGHT){
      tiles[mX][mY] = false;
    }
  }
}

void nextIteration(){
  boolean tempGrid[][] = new boolean[horizontal][vertical];
  
  for (int x = 0; x < horizontal; x++){
    for (int y = 0; y < vertical; y++){
      tempGrid[x][y] = tiles[x][y];
    }
  }
  
  for (int x = 0; x < horizontal; x++){
    for (int y = 0; y < vertical; y++){
      
      if (surroundingTiles(x, y) == 3){
        tempGrid[x][y] = true;
      } else if (surroundingTiles(x, y) != 2){
        tempGrid[x][y] = false;
      }
    }
  }
  
  for (int x = 0; x < horizontal; x++){
    for (int y = 0; y < vertical; y++){
      tiles[x][y] = tempGrid[x][y];
    }
  }
}

boolean inBounds(int x, int y){
  return (x >= 0 && x < horizontal && y >= 0 && y < vertical);
}

PVector screenWrap(int x, int y){
  int newX = x;
  int newY = y;
  
  if (x >= horizontal){
    newX = 0;
  } else if (x < 0){
    newX = horizontal - 1;
  }
  
  if (y >= vertical){
    newY = 0;
  } else if (y < 0){
    newY = vertical - 1;
  }
  
  return new PVector(newX, newY);
}

int surroundingTiles(int x, int y){
  int surroundingTiles = 0;
      
  surroundingTiles += getTile(x + 1, y) ? 1 : 0;
  surroundingTiles += getTile(x, y + 1) ? 1 : 0;
  surroundingTiles += getTile(x - 1, y) ? 1 : 0;
  surroundingTiles += getTile(x, y - 1) ? 1 : 0;
  surroundingTiles += getTile(x + 1, y + 1) ? 1 : 0;
  surroundingTiles += getTile(x - 1, y + 1) ? 1 : 0;
  surroundingTiles += getTile(x + 1, y - 1) ? 1 : 0;
  surroundingTiles += getTile(x - 1, y - 1) ? 1 : 0;
      
  return surroundingTiles;
}

boolean getTile(int x, int y){
  PVector newPos = screenWrap(x, y);
  return (tiles[(int)newPos.x][(int)newPos.y]);
}

void drawGraphics(){
  background(0);
  
  for (int x = 0; x < horizontal; x++){
    for (int y = 0; y < vertical; y++){
      if (tiles[x][y]){
        fill(0, 255, 0);
      } else {
        fill(35);
      }
      
      if (showGrid){
        stroke(0);
      } else {
        noStroke();
      }
      
      rect(x * tileSize, y * tileSize, tileSize, tileSize);
    }
  }
}
