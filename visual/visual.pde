int counter = 0;
float size = 5.0;


void setup(){
  size(200, 200);
  background(255, 0, 255);
  frameRate(10);
  size = width/30;
  //fullScreen();
}

void draw(){
  if(counter % 10 == 0) {
    fill(255, 0, 255);
    rect(0, 0, width, height);
  }
  float x = random(width);
  float y = random(height);
  fill(255, 255, 0);
  noStroke();
  ellipse(x, y, size, size);
  counter++;
}
