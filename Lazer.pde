class Lazer extends Sprite {
    PImage img;
    
    Lazer(float x, float y, PVector velocity, int team) {
        super(x, y, 100, 600); // invoke parent constructor
        vel = velocity;
        this.team = team;
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
    }
    
    @Override
     void display() {
        img = loadImage("data/Bullet.png");
        fill(200, 0, 200);
        image(img, pos.x, pos.y, size.x, size.y);
     }
}
