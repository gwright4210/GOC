SpriteManager _SM;
int liveslost, level, enemies;
long timerstart, timer = 3000;
String leveldisplay = "Level " + level;

void setup() {
    
    /* Controls
    WASD
    Regular shot: space bar
    Shotgun/Cluster: space bar
    Use F to switch between regular and shotgun shots
    Lazer: L 10 second cooldown
    BIG BULLET: B 3 second cooldown
    Spawne Invader: O
    level reset: 0
    */
    
   size(1024, 768);
   levels();
    //_SM.spawn(new Invader(250, 50));
    //_SM.spawn(new DoubleBoss(150, 150));
    //_SM.spawn(new Shooter(150, 100));
    //_SM.spawn(new Shooter(250, 50));
    
    
   
}

void draw() {
    background(0);
    _SM.manage();
}

void keyPressed() {
    _SM.player.keyDown();
}

void keyReleased() {
    _SM.player.keyUp();
}

void levelOne(){
   enemies = 0;
   
   _SM.spawn(new Shooter(100, 85));
   _SM.spawn(new Shooter(240, 85));
   _SM.spawn(new Shooter(380, 85));
   _SM.spawn(new Invader(170, 150));
   _SM.spawn(new Invader(310, 150));
}
void levelTwo(){
   //enemies = 5;
   enemies = 0;
   _SM.spawn(new Shooter(100, 85));
   _SM.spawn(new Shooter(240, 85));
   _SM.spawn(new Shooter(380, 85));
   _SM.spawn(new Shooter(170, 150));
   _SM.spawn(new Shooter(310, 150));
}
void levelThree(){
   //enemies = 1;
   enemies = 0;
   _SM.spawn(new MiniBoss(310, 150));
   
}

void levelFour(){
   //enemies = 5; //enemy has 5 lives, thus counts as 5 enemies
   enemies = 0;
   _SM.spawn(new DoubleBoss(310, 150));
   
}

void levelFive(){
  // enemies = 2; // has 2 lives
   enemies = 0;
   _SM.spawn(new Boss(310, 150));
   
}

void levelSix(){
   //enemies = 1;
   enemies = 0;
   _SM.spawn(new FinalBoss(310, 150));
   
}

void endscreen(){
   //enemies = 1;
   enemies = 0;
  
   
   
  
   
}
   

void displayLevel(){
  leveldisplay = "Level " + level;
  if(level > 6){
    leveldisplay = "You Won!";
    textSize(80);
    text(leveldisplay, 360, 150);
  }
  else{
    textSize(25);
    text(leveldisplay, 925, 25);
  }
}

void levels(){
   _SM = new SpriteManager();
  timerstart = millis();
  level += 1;
  while(1 == 1){// && millis() - timerstart > timer){
    if(level == 1){
      levelOne();
      break;
    }
    if(level == 2){// && millis() - timerstart > timer){
        levelTwo();
        break;
    }
    if(level == 3){// && millis() - timerstart > timer){
        levelThree();
        break;
    }
    if(level == 4){// && millis() - timerstart > timer){
        levelFour();
        break;
    }
    if(level == 5){// && millis() - timerstart > timer){
        levelFive();
        break;
    }
    if(level == 6){// && millis() - timerstart > timer){
        levelSix();
        break;
    }
    if(level > 6){
      endscreen();
      break;
    }
  }
}
