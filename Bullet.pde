class Bullet extends Sprite {
    PImage img;  
    long bulletTimer, bulletExpire = 3200;
  
    Bullet(float x, float y, PVector velocity, int team) {
        super(x, y, 10, 10, 1); // invoke parent constructor
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
        //ellipse(pos.x, pos.y, size.x, size.y);
        image(img, pos.x - 5, pos.y - 3, size.x, size.y);
     }
    
    
    
    @Override
    void update() {
        pos.add(vel);
        if(millis() - bulletTimer > bulletExpire){
          _SM.destroy(this);
        }
    }
}
