class Dialga extends Sprite {
    PImage img;  
    boolean dashed = false;
    // constructor
    int lives = 3;
    long mark, wait = 3000; // ms
    Dialga(float x, float y) {
        super(x, y, 100, 40, 2);
        enemies += 1;
    }
    
    void healthbar(){
      int x = 200;
      for(int i = 0; i < lives; i++){
        fill(0, 0, 255);
        rect(x, 8, 45, 22);
        x += 40;
      }
    }
    
    void dash(){
      dashed = false;
      while(dashed == false){
        for(int i = 0; i < 100; i++){
          if(pos.x == aimx && pos.y = aimy){
            dashed = true;
          }
          else{ 
            pos.add(aim);
          }
        }
      
    }
    
    @Override 
    void update() {
        super.update();
        healthbar();
        float aimx = _SM.player.pos.x;
        float aimy = _SM.player.pos.y;
        PVector aim = new PVector(_SM.player.pos.x - this.pos.x, _SM.player.pos.y - this.pos.y);
        aim = aim.normalize().mult(8); // turn this into a single unit vector, then increase its magnitude
          if(millis() - mark > 100) {
            mark = millis();
            dash();
          }
    }
    
    @Override
     void display() {
        img = loadImage("data/dialgamaster.gif");
        image(img, pos.x - 45, pos.y - 15, size.x - 5, size.y - 5);
        enemies();
     }
    
    @Override
     void handleCollision() {
        lives -= 1;
      enemies -= 1;
      if(lives <= 0){
        _SM.destroy(this);
        levels();
      }
    }
}
