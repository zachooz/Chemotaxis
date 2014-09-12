Bacteria BacteriaHolder[] = new Bacteria[10];
Food BacteriaFood = new Food();
void setup(){
  size(500,500);
  build();
  background(0,0,0);
  frameRate(100);
}

class Food{
	int x;
	int y;
	int theSize;
	Food(){
		x = (int) (Math.random()*500);
		y= (int) (Math.random()*500);
		theSize = 10;
	}
	void drawFood(){
		noStroke();
		fill(#ffa500);
		rect(x,y,theSize,theSize);
	}
}

public class Bacteria{
  int x;
  int y;
  int newPointX;
  int newPointY;
  int speed;
  int direction;
  int theSize;
  int rgb[] =  new int[3];
  Bacteria(){
	theSize = 10;
    x=(int) (Math.random()*500);
    y=(int) (Math.random()*500);
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
		  if(newPointX < x &&  BacteriaFood.x > x){
			newPointX+=20;
		  }
		  if(newPointY < y &&  BacteriaFood.y > y){
			newPointY+=20;
		  }
		  if(newPointX > x &&  BacteriaFood.x < x){
			newPointX-=20;
		  }
		  if(newPointY > y &&  BacteriaFood.y < y){
			newPointY-=20;
		  }
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
		if(x - theSize/2 < BacteriaFood.x + BacteriaFood.theSize && x + theSize/2 > BacteriaFood.x && y - theSize/2 < BacteriaFood.y + BacteriaFood.theSize && y + theSize/2 > BacteriaFood.y){
			eat();
		}
		stroke(rgb[0],rgb[1], rgb[2]);
		ellipse(x, y, theSize, theSize);
	}

	void eat(){
		BacteriaFood = new Food();
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
  BacteriaFood.drawFood();
}
