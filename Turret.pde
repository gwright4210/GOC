class Turret extends Sprite {
    PImage img;  
    long mark, wait = 1000;
    // constructor
    Turret(float x, float y) {
        super(x, y, 100, 40, 1);
        turrets += 1;
    }
    
   
    
    
    @Override
     void display() {
        img = loadImage("data/GOC_Player.png");
        image(img, pos.x - 45, pos.y - 15, size.x - 5, size.y - 5);
     }
     
     @Override
     void update() {
        super.update();
        PVector aim = new PVector(0, -10);
        
        if(millis() - mark > wait) {
            mark = millis();
            _SM.spawn(new Bullet(pos, aim, team));
        }
    }
    
    
    
    @Override
     void handleCollision() {
        _SM.destroy(this);
        turrets -= 1;
    }
}
