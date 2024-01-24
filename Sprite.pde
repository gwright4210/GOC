class Sprite {
    PVector pos, vel, size;
    int team = 2;
    
    Sprite(float x, float y, float w, float h) {
        pos = new PVector(x, y);
        vel = new PVector(0, 0);
        size = new PVector(w, h);
    }
    
    void update() {
      if (gameOver == true) {
        showGameOverScreen();
      }
    }
    
    void enemies(){
      int x = 400;
      for(int i = 0; i < enemies; i++){
        fill(255);
        rect(x, 8, 22, 22);
        x += 40;
      }
    }
    
    
    void display() {
        fill(255);
        ellipse(pos.x, pos.y, size.x, size.y);
       
        
    }
    
    void handleCollision() {
        _SM.destroy(this);
    }
}
