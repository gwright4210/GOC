class Player extends Sprite {
    PImage img;
    PImage damage;
    PImage PlayerHeart;
    //int teamates, maxTeamates = 3;
    boolean left, right, up, down, charging = false;
    long mark, smallmark, chargetime, wait = 3000;
    long lazerdelay = 8000;
    long shotdelay = 300;
    long clusterdelay = 800;
    long chargeTime;
    long damageMark, damageTime = 600;
    int lives = 3 - liveslost;
    int turretMax = 1;
    boolean inDamage, basicShot = true;
   
    void healthbar(){
      int x = 10;
      PlayerHeart = loadImage("data/Player_Heart.gif");
      for(int i = 0; i < lives; i++){
        image(PlayerHeart,x, 8, 45, 45);
        //rect(x, 8, 22, 22);
        x += 45;
      }
    }
    
    
   
    
    Player(float x, float y) {
        // super refers to the parent
        // ... I use it here as a constructor
        super(x, y, 40, 40 , 1); // in this case, Sprite
        mark = millis();
        smallmark = millis();
        inDamage = false;
        //playerArt = loadImage("GOCSpriteSheet/Dude_Monster");   
    }

    @Override
    void update() {
        float speed = 1.2;
        if (left)  vel.add(new PVector( -speed, 0));
        if (right) vel.add(new PVector(speed, 0));
        if (up)    vel.add(new PVector(0, -speed));
        if (down)  vel.add(new PVector(0, speed));
        // update the position by velocity
        pos.add(vel);
        //fix bounds
        if(pos.x < 0 + size.x/2) pos.x = size.x/2;
        if(pos.x > width - size.x/2) pos.x = width - size.x/2;
        if(pos.y < 0 + size.y/2) pos.y = size.y/2;
        if(pos.y > height - size.y/2) pos.y = height-size.y/2;

        // always try to decelerate
        vel.mult(0.9);
    }
    
    void damage(){
      if(millis() - damageMark > damageTime){
        inDamage = false;
      }
    }
      
      
    
    
 
    @Override
    void display() {
        img = loadImage("data/GOC_Player.png");
        damage = loadImage("data/GOC_Player_Damage.png");
        fill(200, 0, 200);
        if(inDamage == false){
          image(img,pos.x - 35, pos.y - 35, size.x + 30, size.y + 30);
        }
        else{
          damage();
          image(damage ,pos.x - 30, pos.y - 35, size.x + 30, size.y + 30);
        }
        //ellipse(pos.x, pos.y, size.x, size.y);
        healthbar();
        displayLevel();
        
       
    }

    @Override
    void handleCollision() {
       liveslost += 1;
       lives -= 1;
       inDamage = true;
       damageMark = millis();
       if(lives <= 0){
         _SM = new SpriteManager();
         gameOver = true;
       }
    }

    void keyUp() {
        switch(key) { // key is a global value
            case 'a':
            case 'A': left = false; break;
            case 's':
            case 'S': down = false; break;
            case 'd':
            case 'D': right = false; break;
            case 'w':
            case 'W': up = false; break;  
            case 'c':
            case 'C': releaseCharge();
        }
    }
    void keyDown() {
        switch(key) { // key is a global value
            case 'a':
            case 'A': left = true; break;
            case 's':
            case 'S': down = true; break;
            case 'd':
            case 'D': right = true; break;
            case 'w':
            case 'W': up = true; break;
            case ' ': if(basicShot == true){ smallshot(); break;} else{ clustershot(); break;}
            case 'f': switchShot(); break;
            case 'b':
            case 'B': bigshot(); break;
            case 'c':
            case 'C': //chargeShot(); break;
            case 'l':
            case 'L': lazer(); break;
            case 'o':
            case 'O': supersecretspawner(); break;
            case '0': levelReset(); break;
            case 'T': 
            case 't': if(gameOver == true) gameReset(); break;
            case 'h':
            case 'H': if(gameStart == false) levels(); gameStart = true;  break;
            case 'j':
            case 'J': spawnTurret(); break;
        }
    }
   
    void smallshot() {
      if(millis() - smallmark > shotdelay){
      PVector aim = new PVector(0, -10); // up
        _SM.spawn(new Bullet(pos.x, pos.y, aim, team));
        smallmark = millis();
      }
      //long delay = 3000; // 3 seconds
      //if (millis() - mark < delay) {
    }
    
    void bigshot() {
      if(millis() - mark > wait){
      PVector aim = new PVector(0, -10); // up
        _SM.spawn(new BigBullet(pos.x, pos.y, aim, team));
        mark = millis();
      }
    }
    
    void clustershot(){
      if(millis() - mark > clusterdelay){
      PVector aimup = new PVector(0, -5); // up
        _SM.spawn(new Bullet(pos.x, pos.y, aimup, team));
      PVector aimright = new PVector(1, -5); // up
        _SM.spawn(new Bullet(pos.x, pos.y, aimright, team));
      PVector aimleft = new PVector(-1, -5); // up
        _SM.spawn(new Bullet(pos.x, pos.y, aimleft, team));
        mark = millis();
      }
    }
    
    void lazer() { 
      if(millis() - mark > lazerdelay){
      PVector aim = new PVector(0, -80); // up
        _SM.spawn(new Lazer(pos.x, pos.y, aim, team));
        mark = millis();
      }
    }
    
    void supersecretspawner(){
       _SM.spawn(new Shooter(150, 150));
    }
    
    void switchShot(){
      if(basicShot == true){
        basicShot = false;
      }
      else{
        basicShot = true;
      }
    }
    
    void chargeShot(){
      charging = true;
      chargetime = millis();
    }
    
    void releaseCharge(){
      if(charging == true){
         PVector aim = new PVector(0, -10); // up
          _SM.spawn(new ChargeShot(pos.x, pos.y, aim, team)); 
         charging = false;
         chargetime = 0;
      }
    }
    
    void levelReset(){
      liveslost = 0;
      level -= 1;
      gameOver = false;
      levels();
    }
    
    void spawnTurret(){
      if(turrets < turretMax){ 
        
         _SM.spawn(new Turret(pos.x, pos.y)); 
      }
    }
}
