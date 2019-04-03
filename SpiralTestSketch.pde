float horizon;
float horConstraint;
float maxHor;
float minHor;

PVector sunLoc = new PVector();
float sunSpeed;
float sunSize;

int skyColorR = 141;
int skyColorG = 244;
int skyColorB = 210;
int watColorR;
int watColorG;
int watColorB;
int sunColorR;
int sunColorG;
int sunColorB;

int frameClock = 0;
int intervalClock;



void setup() {
  size(1000, 1000); 
  //fullScreen(0);
  background (0);
  horizon = (height/3) * 2;
  horConstraint = height / 24;

  sunSpeed = height/480;
  sunSize = width/4;
  sunLoc.x = width/2;
  sunLoc.y = height/2;
  maxHor = horizon + horConstraint;
  minHor = horizon - horConstraint;
}

void draw() {
  strokeWeight(0);
  fill(skyColorR, skyColorG, skyColorB);
  rect(0, 0, width, height);

  skyColorR = round(map((sunLoc.y), height, 0, 0, 141));
  skyColorG = round(map((sunLoc.y), height, 0, 0, 244));
  skyColorB = round(map((sunLoc.y), height, 0, 0, 210));
  sunColorR = round(map((sunLoc.y), 0, height, 247, 179));
  sunColorG = round(map((sunLoc.y), 0, height, 222, 77));
  sunColorB = round(map((sunLoc.y), 0, height, 85, 37));
  watColorR = round(map(sunLoc.y, 0, height, 0, 63));
  watColorG = round(map(sunLoc.y, 0, height, 105, 40));
  watColorB = round(map(sunLoc.y, 0, height, 148, 74));

  sunLoc.y = sunLoc.y + sunSpeed;
  sunLoc.y = constrain(sunLoc.y, 0, height);

  if (sunLoc.y <= 0) {
    sunSpeed = sunSpeed * -1;
  } else if (sunLoc.y >= height) {
    sunSpeed = sunSpeed * -1;
  }




  horizon = horizon + random(-2, 2);
  horizon = constrain(horizon, minHor, maxHor);
  fill(watColorR, watColorG, watColorB);
  rect(0, horizon, width, height);
  
  intervalClock = round(frameClock/10);
  print(intervalClock + "");
  frameClock++;
  if(intervalClock == 0){
    sunLoc.x = width * 0.25;
  }else if((intervalClock == 1) || (intervalClock == 3)){
    sunLoc.x = width * 0.5;
  }else if(intervalClock == 2){
    sunLoc.x = width * 0.75;
  
}else if(intervalClock == 4){
   frameClock = 0; 
  }
    fill(sunColorR, sunColorG, sunColorB);
  ellipse(sunLoc.x, sunLoc.y, sunSize, sunSize);
}
