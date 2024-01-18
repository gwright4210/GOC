class Boss extends Sprite {
     // constructor
    Boss(float x, float y) {
        super(x, y, 100, 40);
        vel = new PVector(5, 0); // moving right
    }
    
    @Override // change directions left and right
      void updatedirection() {
        pos.add(vel);
        
        if (pos.x < 0 || pos.x > width) {
            vel.x *= -1;
        }
    }
    long mark, wait = 200; // ms
    mark = millis();
    }

    @Override
    void updateaim() {
        super.update();
        PVector aim = new PVector(_SM.player.pos.x - this.pos.x, _SM.player.pos.y - this.pos.y);
        aim = aim.normalize().mult(8); // turn this into a single unit vector, then increase its magnitude

        if(millis() - mark > wait) {
            mark = millis();
            _SM.spawn(new Bullet(pos, aim, team));
        }
    }
}
