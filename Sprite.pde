class Sprite {
    PVector pos, vel, size;
    int team;
    
    Sprite(float x, float y, float w, float h, int t) {
        pos = new PVector(x, y);
        vel = new PVector(0, 0);
        size = new PVector(w, h);
        team = t;
    }
    
    void update() {
      if (gameOver == true) {
        showGameOverScreen();
      }
    }
    
    void enemies(){
      int x = 400;
      for(int i = 0; i < enemies; i++){
        fill(255, 0, 0);
        rect(x, 8, 40, 22);
        x += 40;
      }
    }
    
    
    void display() {
        fill(255);
        ellipse(pos.x, pos.y, size.x, size.y);
       
        
    }
    
    void handleCollision(Sprite other) {
      handleCollision();
    }
    
    void handleCollision() {
        _SM.destroy(this);
    }
}
