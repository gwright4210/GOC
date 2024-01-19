class Player extends Sprite {
    boolean left, right, up, down, chargeShot = false;
    long mark, wait = 3000;
   
   
    
    Player(float x, float y) {
        // super refers to the parent
        // ... I use it here as a constructor
        super(x, y, 40, 40); // in this case, Sprite
        team = 1;
        mark = millis();
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
    
  

    @Override
    void display() {
        fill(200, 0, 200);
        ellipse(pos.x, pos.y, size.x, size.y);
    }

    @Override
    void handleCollision() {
        // don't die.
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
        }
    }
   
    void smallshot() {
      PVector aim = new PVector(0, -10); // up
        _SM.spawn(new Bullet(pos.x, pos.y, aim, team));
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
    void lazer() { //incomplete
      if(millis() - mark > wait){
      PVector aim = new PVector(0, -10); // up
        _SM.spawn(new BigBullet(pos.x, pos.y, aim, team));
        mark = millis();
      }
    }
    
}
