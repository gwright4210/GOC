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
        
       text("Distance: ", 20, 660);
       text(distance, 20, 660);
      }
      
      
    }
    
    void stomp(){
      if(millis() - stompTimer > 3000){
       PVector aim = new PVector(0, 10); // down
        _SM.spawn(new Bomb(pos.x, pos.y, aim, team, 1));
        stompTimer = millis();
      }
    }
    
    void dash(int speed){
      PVector aim = new PVector(_SM.player.pos.x - this.pos.x, _SM.player.pos.y - this.pos.y);
      aim = aim.normalize().mult(speed); // turn this into a single unit vector, then increase its magnitude
      distance = (_SM.player.pos.x - this.pos.x) + (_SM.player.pos.y - this.pos.y)/2;
      if(distance > 50){
        pos.add(aim);
      }
      else{
        stomp();
      }
    }
    
    
    
    @Override 
    void update() {
        super.update();
        healthbar();
          if(millis() - mark > 100) {
            mark = millis();
            dash(15);
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
