class Bomb extends Sprite {
    int collisions, collisionsAllowed = 3;
    PImage img;
    long bulletTimer, bulletExpire = 400;
    Bomb(float x, float y, PVector velocity, int team) {
        super(x, y, 120, 40, 1); // invoke parent constructor
        vel = velocity;
        this.team = team;
        bulletTimer = millis();
    }

    Bomb(PVector pos, PVector vel, int team) {
        // constructor chaining
        this(pos.x, pos.y, vel, team); // invoke another own constructor
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
          PVector aimup = new PVector(0, -5); // up
          _SM.spawn(new Bullet(pos.x, pos.y, aimup, team));
          PVector aimright = new PVector(1, -5); // right
          _SM.spawn(new Bullet(pos.x, pos.y, aimright, team));
          PVector aimleft = new PVector(-1, -5); // left
          _SM.spawn(new Bullet(pos.x, pos.y, aimleft, team));
          PVector right180 = new PVector(3, -5); // right 180
          _SM.spawn(new Bullet(pos.x, pos.y, right180, team));
          PVector left180 = new PVector(-3, -5); // left180
          _SM.spawn(new Bullet(pos.x, pos.y, left180, team));
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
