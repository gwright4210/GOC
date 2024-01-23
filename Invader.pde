class Invader extends Sprite {
    PImage img;  
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
     void display() {
        img = loadImage("data/GOC_Enemy.png");
        
        fill(200, 0, 200);
        image(img, pos.x - 45, pos.y - 15, size.x - 5, size.y - 5);
         enemies();
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
