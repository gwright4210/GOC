class DoubleBoss extends Invader {
    int lives = 2;
    float ydeath, xdeath;
    long deathtime, mark, wait = 300; // ms
    long spawnTimer, spawnDelay = 5000;
    DoubleBoss(float x, float y) {
        super(x, y);
        mark = millis();
        spawnTimer = millis();
    }    
    
    void healthbar(){
      int x = 200;
      for(int i = 0; i < lives; i++){
        fill(0, 0, 255);
        rect(x, 8, 45, 22);
        x += 40;
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
        if(millis() - spawnTimer > spawnDelay) {
            spawnTimer = millis();
            _SM.spawn(new Invader(pos.x, pos.y + 100));
        }
    }
    
    @Override
    void handleCollision(){
      lives -= 1;
      if(lives <= 0){
         enemies -= 1;
         xdeath = pos.x;
         ydeath = pos.y;
        _SM.destroy(this);
        if(xdeath < 150){
          _SM.spawn(new MiniBoss(xdeath + 100, ydeath));
          _SM.spawn(new MiniBoss(xdeath + 200, ydeath));
        }
        if(xdeath > 950){
          _SM.spawn(new MiniBoss(xdeath - 100, ydeath));
          _SM.spawn(new MiniBoss(xdeath - 200, ydeath));
        }
        else{
          _SM.spawn(new MiniBoss(xdeath + 100, ydeath));
          _SM.spawn(new MiniBoss(xdeath - 100, ydeath));
        }
      }
    }
}
