SpriteManager _SM;
int turrets, liveslost, level, enemies, lives = 3;
long timerstart, timer = 3000;
String leveldisplay = "Level " + level;
Boolean gameOver = false;
int levelCount = 7;
Boolean TurretUpgrade = false, gameStart = false;

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
   tutorialScreen();
    
   
}

void draw() {
    background(0);
    _SM.manage();
    
    if(gameOver == true){
      showGameOverScreen();
    }
    if(gameStart == false){
      showControls();
    }
}

void showControls(){
  fill(255); // set the text color to white
  textSize(25); // set the text size
  textAlign(LEFT);
  text("Controls - WASD", 20, 500); 
  text("Shoot - Spacebar", 20, 540);
  text("Switch between fire types - F", 20, 580);
  text("BIG SHOT - I", 20, 620);
  text("Lazer - L", 20, 660);
  text("Spawn Turret  - J", 20, 700);
  text("Shoot Bomb  - K", 20, 740);
  text("Press H to start game", 400, 360);
}

void tutorialScreen(){
  _SM = new SpriteManager();
}

void gameReset(){
  lives = 3;
  liveslost = 0;
  level = 0;
  gameOver = false;
  gameStart = false;
  tutorialScreen();
}

void showGameOverScreen() {
  
  fill(255); // set the text color to white
  textSize(32); // set the text size
  textAlign(CENTER, CENTER); // align the text to the center
  text("Game Over", width / 2, height / 2); // display the text in the center of the screen
  textSize(25); // set the text size // align the text to the center
  text("Press T to reset game", width / 2, (height / 2) + 80); // display the text in the center of the screen and a little down
}

void keyPressed() {
    _SM.player.keyDown();
}

void keyReleased() {
    _SM.player.keyUp();
}

void levelOne(){
   
   
   
   
   _SM.spawn(new Shooter(100, 85));
   _SM.spawn(new Shooter(380, 85));
   _SM.spawn(new Invader(240, 150));
  
}
void levelTwo(){
   //enemies = 5;
   
   _SM.spawn(new Shooter(100, 70));
   _SM.spawn(new Shooter(300, 250));
   _SM.spawn(new Shooter(500, 160));
   
}
void levelThree(){
   //enemies = 1;
   
   _SM.spawn(new MiniBoss(310, 150));
   _SM.spawn(new TurretBuff(200, 500));
   
}

void levelFour(){
   //enemies = 5; //enemy has 5 lives, thus counts as 5 enemies
   
   _SM.spawn(new DoubleBoss(310, 150));
   
}

void levelFive(){
  // enemies = 2; // has 2 lives
 
   _SM.spawn(new Boss(310, 150));
   
}

void levelSix(){
   
   
   _SM.spawn(new Dialga(100, 85));
   _SM.spawn(new LazerBuff(500, 500));
   
   /*
   _SM.spawn(new Shooter(100, 85));
   _SM.spawn(new Shooter(380, 85));
   _SM.spawn(new Invader(240, 150));
  */
}

void levelSeven(){
   //enemies = 1;
   
   _SM.spawn(new FinalBoss(310, 150));
   
}

void endscreen(){
   
}

void displayLevel(){
  leveldisplay = "Level " + level;
  if(level > levelCount && liveslost == 0){
    leveldisplay = "Perfect Game!";
    textSize(80);
    text(leveldisplay, 300, 150);
  }
  if(level > levelCount && liveslost >= 1){
    leveldisplay = "You Won!";
    textSize(80);
    text(leveldisplay, 340, 150);
  }
  else{
    textSize(25);
    text(leveldisplay, 925, 25);
  }
}

void playerReset(){
  level = 0;
  levels();
  
}

void levels(){
  enemies = 0;
  turrets = 0;
   _SM = new SpriteManager();
  level += 1;
  while(1 == 1){
    if(level == 1){
      levelOne();
      break;
    }
    if(level == 2){
        levelTwo();
        break;
    }
    if(level == 3){
        levelThree();
        break;
    }
    if(level == 4){
        levelFour();
        break;
    }
    if(level == 5){
        levelFive();
        break;
    }
    if(level == 6){
        levelSix();
        break;
    }
    if(level == 7){
        levelSeven();
        break;
    }
    if(level > 7){
      endscreen();
      break;
    }
  }
}

void levelSelect(int l){
  turrets = 0;
   _SM = new SpriteManager();
  level = l;
  while(1 == 1){
    if(level == 1){
      levelOne();
      break;
    }
    if(level == 2){
        levelTwo();
        break;
    }
    if(level == 3){
        levelThree();
        break;
    }
    if(level == 4){
        levelFour();
        break;
    }
    if(level == 5){
        levelFive();
        break;
    }
    if(level == 6){
        levelSix();
        break;
    }
    if(level == 7){
        levelSeven();
        break;
    }
    if(level > 7){
      endscreen();
      break;
    }
  }
}
