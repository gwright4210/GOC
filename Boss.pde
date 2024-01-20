class Boss extends Invader {
    int collisions, collisionsAllowed = 2;
    long mark, wait = 50; // ms
    Boss(float x, float y) {
        super(x, y);
        mark = millis();
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
      collisions += 1;
      enemies -= 1;
      if(collisions > collisionsAllowed){
        _SM.destroy(this);
        levels();
      }
    }
}
