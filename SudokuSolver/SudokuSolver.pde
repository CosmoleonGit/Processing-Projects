final int scl = 48;

int[][] numbers;

int sX, sY;

void setup() {
  reset();
  textAlign(CENTER, CENTER);
  textSize(24);
}

void reset() {
  numbers = new int[9][9];
  sX = -1; 
  sY = -1;
}

void settings() {
  size(scl * 9, scl * 9);
}

void draw() {
  doEvents();
  drawGraphics();
}

void doEvents() {
  if (mousePressed) {
    sX = mouseX / scl;
    sY = mouseY / scl;
  }
}

boolean isPossible(int x, int y, int n) {
  for (int j = 0; j < 9; j++) {
    if (numbers[j][y] == n) return false;
  }

  for (int k = 0; k < 9; k++) {
    if (numbers[x][k] == n) return false;
  }

  int boxX = (int)(x / 3) * 3;
  int boxY = (int)(y / 3) * 3;
  
  
  for (int j = boxX; j < boxX + 3; j++) {
    for (int k = boxY; k < boxY + 3; k++) {
      if (numbers[j][k] == n) return false;
    }
  }
  

  return true;
}

void keyPressed() {
  if (sX != -1 && (int)keyCode >= 48 && (int)keyCode < 58) {
    numbers[sX][sY] = (int)keyCode - 48;
  }

  if (keyCode == ' ') {
    
    for (int x = 0; x < 9; x++) {
      for (int y = 0; y < 9; y++) {
        solveNumber(x, y);
      }
    }
  } else if (keyCode == RIGHT){
    sX++;
  } else if (keyCode == LEFT){
    sX--;
  } else if (keyCode == DOWN){
    sY++;
  } else if (keyCode == UP){
    sY--;
  }
  
  if (sX > 8) sX = 8;
  else if (sX < 0) sX = 0;
  
  if (sY > 8) sY = 8;
  else if (sY < 0) sY = 0;
  
  if (keyCode == 'R'){
    reset();
  }
  
  
}

void solveNumber(int x, int y) {  
  if (numbers[x][y] != 0) return;
  
  int p = -1;

  for (int n = 1; n <= 9; n++) {
    boolean iP = isPossible(x, y, n);

    if (iP) {
      if (p != -1) {
        p = -1;
        break;
      }

      p = n;
    }
  }

  if (p != -1) numbers[x][y] = p;
}

void drawGraphics() {

  strokeWeight(1);

  for (int x = 0; x < 9; x++) {
    for (int y = 0; y < 9; y++) {
      if (sX == x && sY == y) {
        fill(100, 255, 255);
      } else {
        fill(255);
      }

      rect(x * scl, y * scl, scl, scl);

      fill(0);
      if (numbers[x][y] != 0) text(numbers[x][y], (x + 0.5) * scl, (y + 0.5) * scl);
    }
  }

  noFill();
  strokeWeight(2);

  for (int x = 0; x < 3; x++) {
    for (int y = 0; y < 3; y++) {
      rect(x * scl * 3, y * scl * 3, scl * 3, scl * 3);
    }
  }
}
