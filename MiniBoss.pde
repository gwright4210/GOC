class MiniBoss extends Invader {

    long mark, wait = 1200; // ms
    MiniBoss(float x, float y) {
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
            _SM.spawn(new BigBullet(pos, aim, team));
        }
    }
}
