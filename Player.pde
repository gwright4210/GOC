class Player extends Sprite {
    //PImage playerArt;
    boolean left, right, up, down, chargeShot = false;
    long mark, smallmark, wait = 3000;
    long lazerdelay = 10000;
    long shotdelay = 300;
    int lives = 3;
   
    void healthbar(){
      int x = 10;
      for(int i = 0; i < lives; i++){
        rect(x, 8, 22, 22);
        x += 40;
      }
    }
    
    Player(float x, float y) {
        // super refers to the parent
        // ... I use it here as a constructor
        super(x, y, 40, 40); // in this case, Sprite
        team = 1;
        mark = millis();
        smallmark = millis();
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
        //image(playerArt, 0, height/2, playerArt.width/2, playerArt.height/2);
    }
 
    @Override
    void display() {
        fill(200, 0, 200);
        ellipse(pos.x, pos.y, size.x, size.y);
        healthbar();
    }

    @Override
    void handleCollision() {
       lives -= 1;
       if(lives < 0){
         _SM.destroy(this);
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
            case ' ':
            case 'f': smallshot(); break;
            case 'b':
            case 'B': bigshot(); break;
            case 'c':
            case 'C': clustershot(); break;
            case 'l':
            case 'L': lazer(); break;
            case 'o':
            case 'O': supersecretspawner(); break;
            case '0': setup(); break;
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
      if(millis() - mark > wait){
      PVector aimup = new PVector(0, -5); // up
        _SM.spawn(new Bullet(pos.x, pos.y, aimup, team));
      PVector aimright = new PVector(1, -5); // up
        _SM.spawn(new Bullet(pos.x, pos.y, aimright, team));
      PVector aimleft = new PVector(-1, -5); // up
        _SM.spawn(new Bullet(pos.x, pos.y, aimleft, team));
        mark = millis();
      }
    }
    
    void lazer() { //i still want to make it so it will go through anything
      if(millis() - mark > lazerdelay){
      PVector aim = new PVector(0, -80); // up
        _SM.spawn(new Lazer(pos.x, pos.y, aim, team));
        mark = millis();
      }
    }
    
    void supersecretspawner(){
       _SM.spawn(new Shooter(150, 150));
    }
}
