int yval = 200;
int sx = 50; //end of second 'arm' with circle swinging on it
int sy = 0; //incrementing variable for length of second 'arm' (extends y length)
int tx = 50; //coordinate for line @ bottom of screen
int ty = 435; // coordinate for line @ bottom of screen 
int erads = 15; //radii of circles 
int timer = 255;
int stagetime = 0;
int stage = 0;
int counter = 0;
int start;
int count;

PFont font;
PImage intro;
PImage lose;
PImage win;

boolean isStuck = false;
boolean overButton = false;

float cord = (yval * .5); //line with fixed point @ top of screen
float theta = 0.0; //angular motion
float psi = 0.0; //angular motion
float scalar = 1.0;

void setup() {
  size(320, 480);
  //colorMode(HSB, 360, 100, 100);
  smooth();

  font = loadFont("Helvetica-24.vlw");
  
  lose = loadImage("lose.png");
  intro = loadImage("title.png");
  win = loadImage("win.png");

  ellipseMode(RADIUS);
}

void draw() {
  
  //println(counter);

  textFont(font); 
  background(225);

  translate(width/2, 0);
  if ((mousePressed == true)&&(mouseButton == LEFT)){
    cord += 2;
  }
  else if (!(mousePressed == true)&&(cord >= 100)){
    cord -= 2;
  }
  
 if (stage == 0){
  firstPage();
}else if (stage == 1){
  stage1();
}else if (stage == 2){
  stage2();
}else if (stage == 3){
  stage3();
}else if (stage == 4){
  stage4();
}else if (stage == 5){
  stage5();
}else if (stage == 6){
  finalStage();
}else if ((stage == 6)&&(counter >= 660)){
  endPage();
}else if (stage == 7){
  winPage();
}
 
if(stage == 6){
  counter++;
}
//  wreckingArm();
//  target();
}


boolean circleCircleIntersect(float cx1, float cy1, float cr1, float cx2, float cy2, float cr2) { 
  if (dist(cx1, cy1, cx2, cy2) < (cr1 + cr2)) { 
    return true; 
  } 
  else { 
    return false; 
  } 
}


