class BigBullet extends Sprite {
    int collisions, collisionsAllowed = 3;
    PImage img;
    long bulletTimer, bulletExpire = 1700;
    BigBullet(float x, float y, PVector velocity, int team) {
        super(x, y, 120, 40); // invoke parent constructor
        vel = velocity;
        this.team = team;
        bulletTimer = millis();
    }

    BigBullet(PVector pos, PVector vel, int team) {
        // constructor chaining
        this(pos.x, pos.y, vel, team); // invoke another own constructor
        // this refers to the above on line 3
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
        image(img, pos.x, pos.y, size.x, size.y);
     }
}
