class Boomerang extends Sprite {
    //PImage img;  
    long bulletTimer, bulletExpire = 6000;
    float curvestart = -5;
    float curve = 0;
    PVector aim = new PVector(getCurve(), -1);
    float x = millis();
    Boomerang(float x, float y, int team) {
        super(x, y, 10, 10, 1); // invoke parent constructor
        
        //vel = velocity;
        this.team = team;
        bulletTimer = millis();
    }

    Boomerang(PVector pos, PVector vel, int team) {
        // constructor chaining
        this(pos.x, pos.y, team); // invoke another own constructor
        // this refers to the above on line 3
    }
    
    float getCurve(){
      float xaxis = x / 1000;
        curvestart = (xaxis * -5);
      return curvestart;
    }
    
    float getYCurve(){
       curve = 1;
      return curve;
    }
   
  
    @Override
     void display() {
        //img = loadImage("data/Bullet.png");
        fill(200, 0, 200);
        ellipse(pos.x, pos.y, size.x, size.y); //hitbox
        //image(img, pos.x - 5, pos.y - 3, size.x, size.y);
     }
    
    
    
    @Override
    void update() {
      pos.add(getCurve(), 0);
      
       
       //pos.add(curve);
      //x2a2+y2b2=1
      // pos in x 
        //size.add(curve);makes it like a ballon
        //vel.add(curve);
     
        //pos.add(vel);
        
       
        
        
        
        if(millis() - bulletTimer > bulletExpire){
          _SM.destroy(this);
        }
    }
}
