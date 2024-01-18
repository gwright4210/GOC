SpriteManager _SM;

void setup() {
    size(1024, 768);
    _SM = new SpriteManager();
    //_SM.spawn(new Invader(250, 50));
    _SM.spawn(new MiniBoss(150, 150));
    //_SM.spawn(new Shooter(150, 100));
    _SM.spawn(new Invader(250, 50));
}

void draw() {
    background(0);
    _SM.manage();
}

void keyPressed() {
    _SM.player.keyDown();
}

void keyReleased() {
    _SM.player.keyUp();
}
