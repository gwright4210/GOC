class ExtraLife extends Sprite {
    PImage img;  
    // constructor
    ExtraLife(float x, float y) {
        super(x, y, 50, 30, 3);
        //vel = new PVector(5, 0); // moving right
        enemies += 1;
    }
    
    @Override 
    void update() {
       
    }
    
    @Override
     void display() {
        img = loadImage("data/Player_Heart.gif");
        image(img, pos.x - 45, pos.y - 15, size.x , size.y);
     }
    
    @Override
     void handleCollision() {
        _SM.destroy(this);
        liveslost -= 2;
        lives += 2;
    }
}
