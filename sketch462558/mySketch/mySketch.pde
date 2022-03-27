/*
pulse circle
@date 2017/01/17
hi!
*/

  float inc = random(0.3);
  int r1 = 152;
  int g1 = 125;
  int b1 = 251;
  int r2 = 281;
  int g2 = 223;
  int b2 = 51;
  int direction = 1;
  boolean toggle = true;
  float speed;

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
  r1 = incrementColorLeft(r1, 0.5);
  g1 = incrementColorLeft(g1, 0.7);
  b1 = incrementColorLeft(b1, 0.4);
  r2 = incrementColorRight(r2, 0.5);
  g2 = incrementColorRight(g2, 0.9);
  b2 = incrementColorRight(b2, 0.6);
  
  for(float y = -radius + step/1; y <= radius - step/1; y += step){
    float wave = abs(pow(sin(y*0.003 + frameCount*0.05),10));
    float wy = y - map(wave,0,1, -step,step);
    float X = sqrt(sq(radius) - sq(y))* map(wave,0,1,1,1.1);
    float cRate = map(y,radius + step/2,-radius + step/2,0,1);
    stroke(lerpColor(color(abs(r1),abs(g1),abs(b1)),color(abs(r2),abs(g2),abs(b2)),cRate));
    beginShape();
    for(float x = -X; x <= X; x += 5){
        float z =  abs(x) * 1;
        float ff =  abs(wy) * 1;
        
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
 speed = pow(pmouseX - mouseX, 2) + pow(pmouseY - mouseY, 2);
 text(r2, 250, 250);
 text(g2, 250, 260);
 text(b2, 250, 270);
 
 text(r1, 200, 250);
 text(g1, 200, 260);
 text(b1, 200, 270);
  
}

void mousePressed() {
  toggle =! toggle;
}


int incrementColorRight(int colorNr, float rate) {
  if (toggle) {
    //if (random(1) < rate) {
      colorNr += speed * direction / 100;
    //} 
    
    if (abs(colorNr) >= 256) {
      direction = direction * -1;
    }
  }
  
  return colorNr;
}

int incrementColorLeft(int colorNr, float rate) {
  if (!toggle) {
    //if (random(1) < rate) {
      colorNr += speed * direction / 100;
    //} 
    
    if (abs(colorNr) >= 256) {
      direction = direction * -1;
    }
  }  
    
  return colorNr;
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