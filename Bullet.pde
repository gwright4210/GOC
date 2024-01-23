class Bullet extends Sprite {
    PImage img;  
    long bulletTimer, bulletExpire = 1700;
  
    Bullet(float x, float y, PVector velocity, int team) {
        super(x, y, 10, 10); // invoke parent constructor
        vel = velocity;
        this.team = team;
        bulletTimer = millis();
    }

    Bullet(PVector pos, PVector vel, int team) {
        // constructor chaining
        this(pos.x, pos.y, vel, team); // invoke another own constructor
        // this refers to the above on line 3
    }
   
  
    @Override
     void display() {
        img = loadImage("data/Bullet.png");
        fill(200, 0, 200);
        image(img, pos.x, pos.y, size.x, size.y);
     }
    
    
    
    @Override
    void update() {
        pos.add(vel);
        if(millis() - bulletTimer > bulletExpire){
          _SM.destroy(this);
        }
    }
}
