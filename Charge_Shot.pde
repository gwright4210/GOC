class ChargeShot extends Sprite {
    int collisions, collisionsAllowed = 3;
    float multiplier = 10;
    
    ChargeShot(float x, float y, PVector velocity, int team) {
        super(x, y, 10, 10); // invoke parent constructor
        vel = velocity;
        this.team = team;
    }

    ChargeShot(PVector pos, PVector vel, int team) {
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
