SpriteManager _SM;
int liveslost, level, enemies, lives = 3;
long timerstart, timer = 3000;
String leveldisplay = "Level " + level;
Boolean gameOver = false;

Boolean gameStart = false;

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
    //_SM.spawn(new Invader(250, 50));
    //_SM.spawn(new DoubleBoss(150, 150));
    //_SM.spawn(new Shooter(150, 100));
    //_SM.spawn(new Shooter(250, 50));
    
    
   
}

void draw() {
    background(0);
    _SM.manage();
    // your existing draw code here
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
  text("Controls - WASD", 20, 580); 
  text("Shoot - Spacebar", 20, 620);
  text("Switch between fire types - F", 20, 660);
  text("BIG SHOT - B", 20, 700);
  text("Lazer - L", 20, 740);
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
  levels();
}

void showGameOverScreen() {
  
  fill(255); // set the text color to white
  textSize(32); // set the text size
  textAlign(CENTER, CENTER); // align the text to the center
  text("Game Over", width / 2, height / 2); // display the text in the center of the screen
  textSize(25); // set the text size // align the text to the center
  text("Press T to reset game", width / 2, (height / 2) + 80); // display the text in the center of the screen
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
   _SM.spawn(new Shooter(380, 85));
   _SM.spawn(new Invader(240, 150));
  
}
void levelTwo(){
   //enemies = 5;
   enemies = 0;
   _SM.spawn(new Shooter(100, 70));
   _SM.spawn(new Shooter(300, 250));
   _SM.spawn(new Shooter(500, 160));
   
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

void playerReset(){
  level = 0;
  levels();
  
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
