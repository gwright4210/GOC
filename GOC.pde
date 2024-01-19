SpriteManager _SM;


void setup() {
    
    /* Controls
    WASD
    Regular shot: space bar or f
    Shotgun/Cluster: c 3 second cooldown
    Lazer: l 12 second cooldown
    BIG BULLET: b 3 second cooldown
    Spawn Invader: o
    */
    
    size(1024, 768);
    _SM = new SpriteManager();
    //_SM.spawn(new Invader(250, 50));
    _SM.spawn(new Invader(150, 150));
    //_SM.spawn(new Invader(150, 100));
    //_SM.spawn(new Invader(250, 50));
   
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
