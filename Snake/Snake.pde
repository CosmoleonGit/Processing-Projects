final int dX = 30, dY = 30, scl = 24;

ArrayList<Point> snake = new ArrayList<Point>();
Point fruit;

int direction;

int interval;
final int maxInterval = 8;

boolean inBounds(Point point){
  return point.x >= 0 && point.x < dX && point.y >= 0 && point.y < dY;
}

void setup(){
  frame.toFront();
  frame.requestFocusInWindow();
  
  loadSettings();
}

void settings(){
  size(dX * scl, dY * scl);
}

void loadSettings(){
  snake.clear();
  
  snake.add(new Point(1, 0));
  snake.add(new Point(0, 0));
  
  placeFruit();
  
  direction = 0;
}

void placeFruit(){
  int x = -1;
  int y = -1;
  
  while((x == -1 & y == -1) || touchingSnake(new Point(x, y))){
    x = (int)random(0, dX);
    y = (int)random(0, dY);
  }
  
  fruit = new Point(x, y);
}

void draw(){
  doEvents();
  drawGraphics();
}

void doEvents(){
  if (interval == 0){
    Point currentHead = snake.get(0);
    Point newHead = null;
    
    if (direction == 0){
      newHead = new Point(currentHead.x + 1, currentHead.y);
    } else if (direction == 1){
      newHead = new Point(currentHead.x, currentHead.y - 1);
    } else if (direction == 2){
      newHead = new Point(currentHead.x - 1, currentHead.y);
    } else if (direction == 3){
      newHead = new Point(currentHead.x, currentHead.y + 1);
    }
    
    if (inBounds(newHead) && !touchingSnake(newHead)){
      snake.add(0, newHead);
      if (!touchingSnake(fruit)){
        snake.remove(snake.size() - 1);
      } else {
        placeFruit();
      }
      
    } else {
      loadSettings();
    }
  }
  
  interval++;
  if (interval == maxInterval) interval = 0;
}

void keyPressed(){
  
  
  if ((key == 'w' || keyCode == UP) && direction != 3){
    direction = 1;
  } else if ((key == 'a' || keyCode == LEFT) && direction != 0){
    direction = 2;
  } else if ((key == 's' || keyCode == DOWN) && direction != 1){
    direction = 3;
  } else if ((key == 'd' || keyCode == RIGHT) && direction != 2){
    direction = 0;
  }
}

void drawGraphics(){
  for (int x = 0; x < dX; x++){
    for (int y = 0; y < dY; y++){
      if (touchingSnake(new Point(x, y))){
        fill(0, 255, 0);
      } else {
        fill(255);
      }
      
      if (fruit.equals(new Point(x, y))) fill(255, 0, 0);
      
      rect(x * scl, y * scl, scl, scl);
    }
  }
}

class Point {
  Point(int x, int y){
    this.x = x;
    this.y = y;
  }
  
  int x;
  int y;
  
  boolean equals(Point point){
    return point.x == x && point.y == y;
  }
}

boolean touchingSnake(Point point){
  for (Point part : snake){
    if (part.equals(point)) return true;
  }
  
  return false;
}
