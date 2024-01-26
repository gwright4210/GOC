class BigBullet extends Sprite {
    int collisions, collisionsAllowed = 3;
    PImage img;
    long bulletTimer, bulletExpire = 2000;
    BigBullet(float x, float y, PVector velocity, int team) {
        super(x, y, 120, 40, 1); // invoke parent constructor
        vel = velocity;
        this.team = team;
        bulletTimer = millis();
    }

    BigBullet(PVector pos, PVector vel, int team) {
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
