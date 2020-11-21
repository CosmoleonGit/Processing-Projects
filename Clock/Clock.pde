PGraphics clock;

void setup(){
  size(540, 540);
  strokeWeight(10);
  clock = createGraphics(width, height);
  clock.beginDraw();
  clock.strokeWeight(10);
  clock.background(255);
  clock.circle(width/2, height/2, 450);
  clock.strokeWeight(5);
  for (int i = 0; i < 12; i++){
    float x1 = width / 2 + (cos(radians(i * 30)) * 175);
    float y1 = height / 2 + (sin(radians(i * 30)) * 175);
    
    float x2 = width / 2 + (cos(radians(i * 30)) * 200);
    float y2 = height / 2 + (sin(radians(i * 30)) * 200);
    
    clock.line(x1, y1, x2, y2);
  }
  clock.endDraw();
  
  
}

float theta;

void draw(){
  image(clock, 0, 0);
  
  float mX = width / 2 + cos(radians(theta - 90)) * 200;
  float mY = height / 2 + sin(radians(theta - 90)) * 200;
  
  float hX = width / 2 + cos(radians(theta / 12 - 90)) * 150;
  float hY = height / 2 + sin(radians(theta / 12 - 90)) * 150;
  
  line(width/2, height/2, mX, mY);
  line(width/2, height/2, hX, hY);
  
  update();
}

void update(){
  theta = hour() * 360 + (360 * map(minute(), 0, 60, 0, 1)) + (6 * map(second(), 0, 60, 0, 1));
}
