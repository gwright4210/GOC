class BigBullet extends Sprite {
    int collisions, collisionsAllowed = 3;
    
    
    BigBullet(float x, float y, PVector velocity, int team) {
        super(x, y, 120, 40); // invoke parent constructor
        vel = velocity;
        this.team = team;
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
    }
}
