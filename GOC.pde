SpriteManager _SM;
int liveslost, level, enemies;
long timerstart, timer = 3000;
String leveldisplay = "Level " + level;

void setup() {
    
    /* Controls
    WASD
    Regular shot: space bar or f
    Shotgun/Cluster: c 3 second cooldown
    Lazer: l 12 second cooldown
    BIG BULLET: b 3 second cooldown
    Spawner: o
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
   enemies = 5;
   
   _SM.spawn(new Shooter(100, 85));
   _SM.spawn(new Shooter(240, 85));
   _SM.spawn(new Shooter(380, 85));
   _SM.spawn(new Invader(170, 150));
   
   _SM.spawn(new Invader(310, 150));
}
void levelTwo(){
   enemies = 5;
   _SM.spawn(new Shooter(100, 85));
   _SM.spawn(new Shooter(240, 85));
   _SM.spawn(new Shooter(380, 85));
   _SM.spawn(new Shooter(170, 150));
   _SM.spawn(new Shooter(310, 150));
}
void levelThree(){
   enemies = 1;
   
   _SM.spawn(new MiniBoss(310, 150));
   
}

void levelFour(){
   enemies = 5;
   
   _SM.spawn(new DoubleBoss(310, 150));
   
}

void levelFive(){
   enemies = 2;
   
   _SM.spawn(new Boss(310, 150));
   
}

void levelSix(){
   enemies = 1;
   
   _SM.spawn(new FinalBoss(310, 150));
   
}
   

void displayLevel(){
  textSize(25);
  text(leveldisplay, 925, 25);
}

void levels(){
   _SM = new SpriteManager();
  timerstart = millis();
  level += 1;
  while(1 == 1){// && millis() - timerstart > timer){
    if(level == 1){
      displayLevel();
      levelOne();
      break;
    }
    if(level == 2){// && millis() - timerstart > timer){
        displayLevel();
        level += 1;
        levelTwo();
        break;
    }
    if(level == 3){// && millis() - timerstart > timer){
        displayLevel();
        level += 1;
         _SM = new SpriteManager();
        levelThree();
        break;
    }
    if(level == 4){// && millis() - timerstart > timer){
        displayLevel();
        level += 1;
        levelFour();
        break;
    }
    if(level == 5){// && millis() - timerstart > timer){
        displayLevel();
        level += 1;
        levelFive();
        break;
    }
    if(level == 6){// && millis() - timerstart > timer){
        displayLevel();
        level += 1;
        levelSix();
        break;
    }
  }
}
