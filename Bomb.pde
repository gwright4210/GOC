class Bomb extends Sprite {
    int collisions, collisionsAllowed = 3;
    PImage img;
    long bulletTimer, bulletExpire = 400;
    Bomb(float x, float y, PVector velocity, int team, long bulletExpire) {
        super(x, y, 120, 40, 1); // invoke parent constructor
        vel = velocity;
        this.team = team;
        this.bulletExpire = bulletExpire;
        bulletTimer = millis();
    }

    Bomb(PVector pos, PVector vel, int team, long bulletExpire) {
        // constructor chaining
        this(pos.x, pos.y, vel, team, bulletExpire); // invoke another own constructor
    }
    
    @Override
    void handleCollision(){
      collisions += 1;
      if(collisionsAllowed < collisions){
        _SM.destroy(this);
      }
      
    }
    
    @Override
    void update() {
        pos.add(vel);
        if(millis() - bulletTimer > bulletExpire){
          _SM.destroy(this);
          
          // x&y axis
          PVector aimup = new PVector(0, -5); // up
          _SM.spawn(new Bullet(pos.x, pos.y, aimup, team));
          
          PVector right180 = new PVector(5, 0); // 
          _SM.spawn(new Bullet(pos.x, pos.y, right180, team));
          
          PVector down = new PVector(0, 5); // 
          _SM.spawn(new Bullet(pos.x, pos.y, down, team));
        
          PVector left180 = new PVector(-5, 0); // 
          _SM.spawn(new Bullet(pos.x, pos.y, left180, team));
          
          
          // quadrant one
           PVector right20 = new PVector(2, -4.5); // right
          _SM.spawn(new Bullet(pos.x, pos.y, right20, team));
          
           PVector right45 = new PVector(4, -2); // 
          _SM.spawn(new Bullet(pos.x, pos.y, right45, team));
          
          PVector right65 = new PVector(3, -3.25); // 
          _SM.spawn(new Bullet(pos.x, pos.y, right65, team));
          

          // quadrant two
          PVector left120 = new PVector(-3, -3.25); // left180
          _SM.spawn(new Bullet(pos.x, pos.y, left120, team));
          
          
          PVector left135 = new PVector(-4, -2); // 
          _SM.spawn(new Bullet(pos.x, pos.y, left135, team));
          
          PVector left160 = new PVector(-2, -4.5); // right
          _SM.spawn(new Bullet(pos.x, pos.y, left160, team));
          
          
          // quadrant three
          PVector left210 = new PVector(-3, 3.25); // left180
          _SM.spawn(new Bullet(pos.x, pos.y, left210, team));
          
          
          PVector left225 = new PVector(-4, 2); // 
          _SM.spawn(new Bullet(pos.x, pos.y, left225, team));
          
          PVector left240 = new PVector(-2, 4.5); // right
          _SM.spawn(new Bullet(pos.x, pos.y, left240, team));
     
          
          // quadrant four
           PVector right300 = new PVector(2, 4.5); // right
          _SM.spawn(new Bullet(pos.x, pos.y, right300, team));
          
           PVector right315 = new PVector(4, 2); // 
          _SM.spawn(new Bullet(pos.x, pos.y, right315, team));
          
          PVector right330 = new PVector(3, 3.25); // 
          _SM.spawn(new Bullet(pos.x, pos.y, right330, team));
         

        }
    }
    
    @Override
     void display() {
        img = loadImage("data/Bullet.png");
        fill(200, 0, 200);
        //ellipse(pos.x, pos.y, size.x, size.y); //hitbox
        image(img, pos.x - 58, pos.y - 18, size.x, size.y);
     }
}
