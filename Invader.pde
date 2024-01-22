class Invader extends Sprite {
    
    // constructor
    Invader(float x, float y) {
        super(x, y, 100, 40);
        vel = new PVector(5, 0); // moving right
        enemies += 1;
    }
    
    @Override // change directions left and right
    void update() {
        pos.add(vel);
        if (pos.x < 0 || pos.x > width) {
            vel.x *= -1;
        }
    }
    
    @Override
     void handleCollision() {
        _SM.destroy(this);
        enemies -= 1; 
        if(enemies < 1){
          levels();
        }
    }
}
