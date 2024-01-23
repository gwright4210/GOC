class Boss extends Invader {
    int lives = 3;
    long mark, wait = 200; // ms
    Boss(float x, float y) {
        super(x, y);
        mark = millis();
        enemies += lives - 1;
    }

    @Override
    void update() {
        super.update();
        PVector aim = new PVector(_SM.player.pos.x - this.pos.x, _SM.player.pos.y - this.pos.y);
        aim = aim.normalize().mult(8); // turn this into a single unit vector, then increase its magnitude

        if(millis() - mark > wait) {
            mark = millis();
            _SM.spawn(new Bullet(pos, aim, team));
        }
        
    }
    @Override
    void handleCollision(){
      lives -= 1;
      enemies -= 1;
      if(lives <= 0){
        _SM.destroy(this);
        levels();
      }
    }
}
