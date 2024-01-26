class Lazer extends Sprite {
    PImage img;
    long lazerTimer, lazerExpire = 2000;
    Lazer(float x, float y, PVector velocity, int team) {
        super(x, y, 100, 600, 1); // invoke parent constructor
        vel = velocity;
        this.team = team;
         lazerTimer = millis();
    }

    Lazer(PVector pos, PVector vel, int team) {
        // constructor chaining
        this(pos.x, pos.y, vel, team); // invoke another own constructor
        // this refers to the above on line 3
    }
    
     @Override
     void handleCollision() {
       
    }
    
    @Override
    void update() {
        pos.add(vel);
        if(millis() - lazerTimer > lazerExpire){
          _SM.destroy(this);
        }
    }
    
    @Override
     void display() {
        img = loadImage("data/Bullet.png");
        fill(200, 0, 200);
        image(img, pos.x - 50, pos.y - 300, size.x, size.y);
        //ellipse(pos.x, pos.y, size.x, size.y); // hitbox
     }
}
