class Player extends Sprite {
    PImage img;
    PImage damage;
    PImage PlayerHeart, LazerBuff;
    boolean left, right, up, down, inDamage, basicShot = true ;
    long mark, smallmark, wait = 3000;
    long lazerdelay = 8000;
    long shotdelay = 300;
    long clusterdelay = 800;
    long damageMark, damageTime = 600;
    int turretMax = 1;
    boolean devAccess = false;
    boolean bossDead = false;
    boolean buff = false;
    long buffTimer, buffMark;
    int activePowerups = 0;
    
    

    void healthbar(){
      int x = 10;
      int y = 10;
      PlayerHeart = loadImage("data/Player_Heart.gif");
      LazerBuff = loadImage("data/lazerPowerup.png");
      for(int i = 0; i < lives; i++){
        image(PlayerHeart,x, 8, 45, 45);
        x += 45;
      }
      for(int z = 0; z < activePowerups; z++){
        image(LazerBuff, y, 50, 45, 45);
        y += 45;
      }
     
    }
    
    Player(float x, float y) {
        // super refers to the parent
        // ... I use it here as a constructor
        super(x, y, 40, 40 , 1); // in this case, Sprite
        mark = millis();
        smallmark = millis();
        inDamage = false;
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
        
        //Update for PowerUps
        if(millis() - buffMark > buffTimer){
          buff = false;
        }
        if(buff == false){
          lazerdelay = 8000;
          activePowerups = 0;
        }
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
        //ellipse(pos.x, pos.y, size.x, size.y); //turn on to see hitbox
        healthbar();
        displayLevel();
    }
    
    @Override
    void handleCollision(Sprite other) {
      if(other instanceof TurretBuff){
        TurretUpgrade = true;
      }
      else if(other instanceof ExtraLife) {
        lives += 1;
      }
      else if(other instanceof LazerBuff){
        lazerBuff(15000);
      }
      else {
        print("Player.handleCollision(other).else");
        handleCollision();
      }
    }

    @Override
    void handleCollision() {
       if(gameStart == true){
         liveslost += 1;
         lives -= 1;
         inDamage = true;
         damageMark = millis();
         if(lives <= 0){
           _SM = new SpriteManager();
           gameOver = true;
         }
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
            case 'i':
            case 'I': bigshot(); break;
            case 'l':
            case 'L': lazer(); break;
            case '0': levelReset(); break;
            case 'T': 
            case 't': if(gameOver == true) gameReset(); break;
            case 'h':
            case 'H': if(gameStart == false) levels(); gameStart = true;  break;
            case 'j':
            case 'J': spawnTurret(); break;
            case 'k':
            case 'K': bomb(); break;
            case '1': levelSelect(1); break;
            case '2': levelSelect(2); break;
            case '3': levelSelect(3); break;
            case '4': levelSelect(4); break;
            case '5': levelSelect(5); break;
            case '6': levelSelect(6); break;
            case '7': levelSelect(7); break;
            //case '6': if(devAccess == true) levelSelect(6); break;
            //case '7': if(bossDead == true) levelSelect(7); break;
        }
    }
    
    
   
    void smallshot() {
      if(millis() - smallmark > shotdelay){
      PVector aim = new PVector(0, -10); // up
        _SM.spawn(new Bullet(pos.x, pos.y, aim, team));
        smallmark = millis();
      }
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
      PVector aimright = new PVector(1, -5); // right
        _SM.spawn(new Bullet(pos.x, pos.y, aimright, team));
      PVector aimleft = new PVector(-1, -5); // left
        _SM.spawn(new Bullet(pos.x, pos.y, aimleft, team));
        mark = millis();
      }
    }
    
    void lazer() { 
      if(millis() - mark > lazerdelay){
      PVector aim = new PVector(0, -80); // up & fast
        _SM.spawn(new Lazer(pos.x, pos.y, aim, team));
        mark = millis();
      }
    }
    
    
    void switchShot(){
      if(basicShot == true){
        basicShot = false;
      }
      else{
        basicShot = true;
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
        if(TurretUpgrade == true){
         _SM.spawn(new TurretUpgrade(pos.x, pos.y)); 
        }
        if(TurretUpgrade == false){
         _SM.spawn(new Turret(pos.x, pos.y)); 
        }
      }
    }
    
     void bomb() {
      if(millis() - mark > wait){
      PVector aim = new PVector(0, -10); // up
        _SM.spawn(new Bomb(pos.x, pos.y - 70, aim, 3, 300));
        mark = millis();
      }
    }
    
    //powerUp
    void lazerBuff(long dur){
      buff = true;
      buffMark = millis();
      lazerdelay = 3000;
      buffTimer = dur;
      activePowerups += 1;
    }
    
}
