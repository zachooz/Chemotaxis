Bacteria BacteriaHolder[] = new Bacteria[10];

void setup(){
  size(500,500);
  build();
  background(0,0,0);
  frameRate(100);
}

public class Bacteria{
  int x;
  int y;
  int newPointX;
  int newPointY;
  int speed;
  int direction;
  int rgb[] =  new int[3];
  Bacteria(){
    x=(int) (Math.random()*width);
    y=(int) (Math.random()*height);
    newPointX = x + (int) (Math.random()*101 -50);
    newPointY = y + (int) (Math.random()*101 -40);
    speed = 1;
    direction = (int) (Math.random()*21 -10);
    for(int i = 0; i<rgb.length-1; i++){
      rgb[i] = (int) (Math.random() *256);
    }
  }
  void move(){
    if(newPointX==x || newPointY==y){
      newPointX = x + (int) (Math.random()*101 -50);
      newPointY = y + (int) (Math.random()*101 -50);
      direction = (int) (Math.random()*21 -10);
    }
    if(direction>0){
      if(newPointX>x && x+1<= 500){
        x+=1;
      } else if(newPointX<x && x-1>=0){
        x-=1;
      } else {
        newPointX = x + (int) (Math.random()*101 -50);
        newPointY = y + (int) (Math.random()*101 -50);
        direction = (int) (Math.random()*21 -10);
        move();
      }
    } else {
      if(newPointY>y && y+1<= 500){
        y+=1;
      } else if(newPointY<y && y-1>=0){
        y-=1;
      } else {
        newPointX = x + (int) (Math.random()*101 -50);
        newPointY = y + (int) (Math.random()*101 -50);
        direction = (int) (Math.random()*21 -10);
        move();
      }
    }
    stroke(rgb[0],rgb[1], rgb[2]);
    ellipse(x, y, 10, 10);
  }
}
void build(){
  for(int i = 0; i<BacteriaHolder.length-1;i++){
    BacteriaHolder[i] = new Bacteria();
  }
}

void draw(){
  fill(0,0,0,40);
  rect(-10 ,-10 , 1000, 1000);
  for(int i = 0; i<BacteriaHolder.length-1;i++){
    BacteriaHolder[i].move();
  }
}
