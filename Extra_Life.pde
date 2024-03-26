class ExtraLife extends Powerup {
    PImage img;  
    // constructor
    ExtraLife(float x, float y) {
        super(x, y, 50, 30, 2);
        //vel = new PVector(5, 0); // moving right
        
    }
    
    @Override 
    void update() {
       
    }
    
    @Override
     void display() {
        img = loadImage("data/Player_Heart.gif");
        image(img, pos.x - 45, pos.y - 15, size.x + 5 , size.y + 10);
     }
    
    @Override
     void handleCollision() {
        _SM.destroy(this);
    }
}
