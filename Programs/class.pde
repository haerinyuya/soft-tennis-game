ArrayList<BALL> ball_c = new ArrayList<BALL>();

//ボールの軌跡のクラス
class BALL {
  
  float bx, by, bz;
  float vbx, vby, vbz;
  float blife;
  float bpr;
  
  BALL() {
    bx = x;
    by = y;
    bz = z;
    vbx = (random(-bb, bb));
    vby = (random(-bb, bb));
    vbz = (random(-bb, bb));
    blife = 1.7;
    bpr = bpsr;
  }
  
  void ball_c_p() {
    
    push();
    
    colorMode(HSB, 360, 100, 100);
    noStroke();
    
    bx += vbx;
    by += vby;
    bz += vbz;
    
    blife -= 0.1;
    
    bpr -= 0.5;
    
    float l = blife;
    
    push();
    noLights();
    fill(
      map(l, 1, 0, bpc + 30, bpc),
      map(l, 1, 0, 100, 255),
      100,
      map(l, 1, 0, 255, 200)
    );
    translate(bx, by, bz);
    sphere(bpr);
    pop();
    
    pop();
  
    //光を元に戻す
    ambientLight(150, 150, 150); 
    lightSpecular(255, 255, 255);
    directionalLight(30, 30, 30, 0, 1, 0);
  }
}

ArrayList<HIT> hit = new ArrayList<HIT>();

//ラケットにボールが当たった時の爆発のクラス
class HIT {
  
  float rx, ry, rz;
  float xr, yr, zr;
  float rlife;
  float rs;
  float rp;
  float rc = bpc;
  float rw;
  
  HIT(int i) {
    rx = x;
    ry = y;
    rz = z;
    xr = random(0, PI * 2);
    yr = random(0, PI * 2);
    zr = random(0, PI * 2);
    rlife = 1;
    rs = random(2, 3);
    rp = 0;
    rw = i;
  }
  
  void hit_p() {
    push();
    translate(rx, ry, rz);
    rotateX(xr);
    rotateY(yr);
    rotateZ(zr);
    
    float l = rlife;
    
    colorMode(HSB, 360, 100, 100);
    
    strokeWeight(rw);
    stroke(
      map(l, 1, 0, bpc + 30, bpc),
      map(l, 1, 0, 100, 255),
      100,
      map(l, 1, 0, 255, 200)
    );
    line(rp, rp, rp + l * 20, rp + l * 20);
    
    rp += rs;
    rlife -= 0.02;
    
    pop();
  }
}
