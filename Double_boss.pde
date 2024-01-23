class DoubleBoss extends Invader {
    int lives = 2;
    float ydeath, xdeath;
    long deathtime, mark, wait = 300; // ms
    long spawnTimer, spawnDelay = 5000;
    DoubleBoss(float x, float y) {
        super(x, y);
        mark = millis();
        enemies += lives - 1;
        spawnTimer = millis();
    }    
    
    void healthbar(){
      int x = 200;
      for(int i = 0; i < lives; i++){
        rect(x, 8, 22, 22);
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
      enemies -= 1;
      if(lives <= 0){
         xdeath = pos.x;
         ydeath = pos.y;
        _SM.destroy(this);
        _SM.spawn(new MiniBoss(xdeath + 100, ydeath));
        _SM.spawn(new MiniBoss(xdeath - 100, ydeath));
       
      }
    }
}
