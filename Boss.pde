class Boss extends Invader {
    int lives = 3;
    long mark, wait = 200; // ms
    Boss(float x, float y) {
        super(x, y);
        mark = millis();
        enemies += 1;
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

    @Override
    void update() {
        super.update();
        PVector aim = new PVector(_SM.player.pos.x - this.pos.x, _SM.player.pos.y - this.pos.y);
        aim = aim.normalize().mult(8); // turn this into a single unit vector, then increase its magnitude
        healthbar();
        if(millis() - mark > wait) {
            mark = millis();
            _SM.spawn(new Bullet(pos, aim, team));
        }
        
    }
    @Override
    void handleCollision(){
      lives -= 1;
      if(lives <= 0){
        _SM.destroy(this);
        levels();
        enemies -= 1;
      }
    }
}
