class Dialga extends Sprite {
    PImage img;  
    boolean dashed = false;
    // constructor
    int lives = 3;
    float stompTimer;
    long mark, wait = 3000; // ms
    float distance;
    Dialga(float x, float y) {
        super(x, y, 100, 40, 2);
        enemies += 1;
        mark = millis();
    }
    
    void healthbar(){
      int x = 200;
      for(int i = 0; i < lives; i++){
        fill(0, 0, 255);
        rect(x, 8, 45, 22);
        x += 40;
        
       //text("Distance: ", 20, 660);
       //text(distance, 120, 660);
      }
    }
    
    void stomp(){
      if(millis() - stompTimer > 3000){
       PVector aim = new PVector(0, 10); // down
        _SM.spawn(new Bomb(pos.x, pos.y, aim, team, 1));
        stompTimer = millis();
      }
    }
    
    void dash(float speed){
      float getPlayerX = _SM.player.pos.x;
      float getPlayerY = _SM.player.pos.y;
      distance = Math.abs((_SM.player.pos.x - this.pos.x)) + Math.abs((_SM.player.pos.y - this.pos.y))/2;
      if(distance > 150){
          for(int i = 0; i < 100; i++){
            PVector aim = new PVector(getPlayerX - this.pos.x, getPlayerY - this.pos.y);
            if(speed > 0){
              aim = aim.normalize().mult(speed/100);
            }
            if(speed <= 0){
            aim = aim.normalize().mult(.1);}
            pos.add(aim);
          }
       }
      else{
        stomp();
      }
    }
    
    
    
    //44  // turn this into a single unit vector, then increase its magnitude
    
    @Override 
    void update() {
        super.update();
        healthbar();
          if(millis() - mark > 100) {
            mark = millis();
            dash(0);
          }
    }
    
    @Override
     void display() {
        img = loadImage("data/jeremybossfr.jpg");
        image(img, pos.x - 45, pos.y - 15, size.x + 10, size.y + 10);
        enemies();
     }
    
    @Override
     void handleCollision() {
        lives -= 1;
      
      if(lives <= 0){
        _SM.destroy(this);
        levels();
        enemies -= 1;
      }
    }
}
