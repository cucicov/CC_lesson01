/*
pulse circle
@date 2017/01/17
*/

  float inc = random(0.3);
  int r1 = 152;
  int g1 = 125;
  int b1 = 251;
  int r2 = int(random(256));
  int g2 = int(random(256));
  int b2 = int(random(256));
  int direction = 1;

void setup(){
  size(640,640,P3D);
  noFill();
  strokeWeight(2);
}

void draw(){
  background(200,200,200);
  strokeWeight(0.5);
  translate(width/2,height/2);
  float radius = 150;
  float step = 50;
  r1 = incrementColor(r1, 0.5);
  g1 = incrementColor(g1, 0.7);
  b1 = incrementColor(b1, 0.4);
  r2 = incrementColor(r2, 0.5);
  g2 = incrementColor(g2, 0.9);
  b2 = incrementColor(b2, 0.6);
  
  for(float y = -radius + step/1; y <= radius - step/1; y += step){
    float wave = abs(pow(sin(y*0.003 + frameCount*0.05),10));
    float wy = y - map(wave,0,1, -step,step);
    float X = sqrt(sq(radius) - sq(y))* map(wave,0,1,1,1.1);
    float cRate = map(y,radius + step/2,-radius + step/2,0,1);
    stroke(lerpColor(color(r1,g1,b1),color(r2,g2,b2),cRate));
    beginShape();
    for(float x = -X; x <= X; x += 5){
        float z =  abs(x) * inc;
        float ff =  abs(wy) * inc;
        
        vertex(x, z, wy);
        vertex(wy, x);
        vertex(wy, z, x);
        vertex(wy, z, wy);
        vertex(x, ff, wy);
        vertex(x,wy, z);
      }
    endShape();
  }
    if (random(1) < 0.1) {
      inc = inc + 0.2;
    } else if (random(1) > 0.9) {
      inc = inc - 0.2;
    }
  
}

int incrementColor(int colorNr, float rate) {
  if (random(1) < rate) {
    colorNr += direction;
  } 
  
  if (abs(colorNr) >= 256) {
    direction = direction * -1;
  }
  
  return colorNr;
}