class ChargeShot extends Sprite{
    int collisions, collisionsAllowed = 3;
    float charge, Basecharge = 10;
    float chargeTime = 0;
    
    ChargeShot(float x, float y, PVector velocity, int team) {
        super(x, y, 10, 10, 1); // invoke parent constructor
        size.x = getCharge();
        size.y = getCharge();
        vel = velocity;
        this.team = team;
        disposeCharge();
    }

    ChargeShot(PVector pos, PVector vel, int team) {
        // constructor chaining
        this(pos.x, pos.y, vel, team); // invoke another own constructor
        // this refers to the above on line 3
    }
    
    float getCharge(){
      charge = ((millis() - chargeTime) / 200) + 0;
      chargeTime = 0;
      return charge;
    }
    
    void disposeCharge(){
      charge = 0;
      chargeTime = 0;
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
