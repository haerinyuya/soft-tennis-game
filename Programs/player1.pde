float p1x = 0;
float p1y = height - 60;
float p1z = 1000;
float p1r;
float p1s = 0;

float p1rZ = 0;
float prhX = 0, prhY = -10, prhZ = 50; //右手の座標
float plhX = 0, plhY = -10, plhZ = -50; //左手の座標
float phX = 0, phZ = 0; //頭の座標
float phrt = 0; //手首の角度
float p1ym = 0; //上下運動
float p1ry = 250; //打てる高さ

boolean r_s = false; //ラケットを振った判定
boolean s_s = false; //サーブのトスの判定
boolean s_ss = false; //サーブのスイングの判定
float r_sm = PI;
float s_sm = PI;
boolean r_h = true; //ラケットがボールに当たった判定
boolean s_r = false; //ボールを手から離したかの判定, 離している == true

float brange1, brange2; //強打の範囲

PImage r_f9s;

void player1_move() {
  
  if (r_s == false && s_s == false) {
    if (p1_right == true && p1_left == true || p1_up == true && p1_down == true || p1_right == false && p1_left == false && p1_up == false && p1_down == false) {
      p1s = 0;
      p1r = -90;
      p1rZ = 0;
    } else {
      p1s = 15;
      p1rZ = PI/8;
    }
  
  
    if (p1_right == true) {
      p1r = 0;
      if (p1_up == true) {
        p1r = -45;
      } else if (p1_down == true) {
        p1r = 45;
      }
    } else if (p1_left == true) {
      p1r = 180;
      if (p1_up == true) {
        p1r = -135;
      } else if (p1_down == true) {
        p1r = 135;
      }
    } else if (p1_up == true) {
      p1r = -90;
    } else if (p1_down == true) {
      p1r = 90;
    }
    
    p1x += p1s * cos(radians(p1r));
    p1z += p1s * sin(radians(p1r));
  }

  p1x = constrain(p1x, -width + 30, width * 2 - 30);
  p1z = constrain(p1z, 80, 1700);
}

void player1_draw() {
  plhY = prhY;
  phrt = -radians((prhY + 10) * 1.5);
  
  push();
    translate(p1x, height/2 - 3, p1z);
    fill(0, 150);
    rotateX(PI/2);
    circle(0, 0, p1y/5);
  pop();
  
  push();
    //胴体
    translate(p1x, p1y, p1z);
    rotateY(-radians(p1r));
    rotateZ(p1rZ);
    push();
      translate(0, 30, 85);
      shape(p1t);
    pop();
    
    if (r_s == true) {
      r_s();
    }
    if (step == "serve" && s_s == true) {
      s_s();
    }
    //右手
    push();
      fill(255, 200, 100);
      translate(prhX, prhY, prhZ);
      rotateX(phrt);
      sphere(15);
    pop();
    
    //左手
    push();
      fill(255, 200, 100);
      translate(plhX, plhY, plhZ);
      rotateX(-phrt);
      sphere(15);
      if (scene == "game" && step == "serve" && s_r == false && server == true) { //サーブの球
        translate(0, -20, 0);
        fill(255);
        sphere(r);
      }
    pop();
    
    //頭
    push();
      fill(255, 200, 100);
      translate(phX, -60, phZ);
      sphere(30);
    pop();
  pop();
  
  //player2
  //影
  push();
    translate(p2x, height/2 - 2, p2z);
    fill(0, 100);
    rotateX(PI/2);
    circle(0, 0, p2y/5);
  pop();
  
  //胴体
  push();
    translate(p2x, p2y, p2z);
    rotateY(-radians(p2r));
    rotateZ(p2rZ);
    push();
      translate(0, 30, 85);
      shape(p2t);
    pop();
    
    //右手
    push();
      fill(255, 200, 100);
      translate(p2rhX, p2rhY, p2rhZ);
      rotateX(phrt);
      sphere(15);
    pop();
    
    //左手
    push();
      fill(255, 200, 100);
      translate(p2lhX, p2lhY, p2lhZ);
      rotateX(-phrt);
      sphere(15);
      if (scene == "game" && step == "serve" && s_r == false && server == false) { //サーブの球
        translate(0, -20, 0);
        fill(255);
        sphere(r);
      }
    pop();
    
    push();
      if (scene == "game" && step == "serve" && s_r == true && server == false) {
        translate(p2lhX, p2rhY * 3 - 20, p2lhZ);
        fill(255);
        sphere(r);
      }
    pop();
    
    //頭
    push();
      fill(255, 200, 100);
      translate(p2hX, -60, p2hZ);
      sphere(30);
    pop();
  pop();
  
  if (scene == "winner" && winner == false) {
      p1y = height/2 - 60;
  } else{
    p1y += 2 * cos(p1ym);
    p1ym += PI/20;
    if (p1ym == PI) {
      p1ym = 0;
    }
  }
}

void s_s() {
  p1y = height/2 - 60;
  p1rZ = 0;
  s_sm += PI/12;
  p1r = -90;
  
  if (vret == true) {
    v_t.play();
    vret = false;
  }
  
  if (s_sm > PI * 6) {
    v_t.pause();
    v_t.rewind();
    prhY = -10;
    s_sm = PI;
    s_r = false;
    s_s = false;
    if (ws == false) {
      bords.rewind();
      bords.play();
      bord_m = 0;
      bord = 5;
      score(false);
    } else {
      bords.rewind();
      bords.play();
      bord_m = 0;
      bord = 4;
      ws = false;
    }
  } else {
    prhY -= 4 * cos(s_sm / 7);
    push();
    translate(plhX, prhY * 3 - 20, plhZ);
    fill(255);
    sphere(r);
    pop();
    s_r = true;
    if (ssd == true || ssc == true) {
      v_t.pause();
      v_t.rewind();
      s_s = false;
      s_sm = PI;
      bzc = 0;
      if (ssd == true) {
        bpc = 10;
        cut = false;
        ssd = false;
      } else if (ssc == true) {
        bpc = 170;
        cut = true;
        ssc = false;
      }
      x = p1x;
      y = height/2 - 300;
      z = p1z;
      if (-68.5 > prhY) {
        hits2.rewind();
        hits2.play();
        bb = 2;
        bs = 60;
        byr = 0;
      } else {
        bs = 45;
        byr = -5;
      }
      prhY = -10;
      if (s_p == true) {
        bzr = -0.58 * PI;
        bzcd = false;
      } else {
        bzr = -0.42 * PI;
        bzcd = true;
      }
      vy = bs * sin(radians(byr)) - gs * 0.2;
      for (int i = 0; i < 50; i++) {
        hit.add(new HIT(5));
      }
      
      v_h.rewind();
      v_h.play();
      hits.rewind();
      hits.play();
      step = "game";
    }
  }
}

void r_s() {
  p1y = height/2 - 60;
  p1rZ = 0;
  r_sm += PI/12;
  
  if (vz < 0 || x > p1x - 10 || z < 0) { //普通に打つ
    p1r += 24 * cos(r_sm);
  } else {
    p1r -= 24 * cos(r_sm);
  }
  if (r_sm > PI * 1.5) {
    r_h = false;
  }
  if (r_sm > PI * 2) {
    r_sm = PI;
    r_s = false;
    r_h = false;
  }
  if (r_h == false) {
    if (vz > 0) {
      r_h();
    }
  }
}

void r_h() {
  if (smash_c == true) {
    p1ry = 350;
  } else {
    p1ry = 250;
  }
  //ボールを打つ
  if (abs(p1z - z) < 100 && abs(p1x - x) < 140 && y > height/2 - 250) {
    r_h = true;
    b2b = 0;
    bzc = 0;
    prhY = -10;
    
    if (bpc == 170) {
      brange1 = 1.15;
      brange2 = 1.35;
    } else {
      brange1 = 1.2;
      brange2 = 1.3;
    }
    
    switch(bpcd) {
      
      case 1:
        bpc = 10;
        cut = false;
        break;
        
      case 2:
        bpc = 170;
        cut = true;
        break;
        
      case 3:
        bpc = 30;
        cut = false;
        break;
    }
    
    for (int i = 0; i < 50; i++) {
      hit.add(new HIT(5));
    }
    
    r_h_r();
  }
}

void r_h_r() {
  
  hits.rewind();
  hits.play();
  
  if (PI * brange1 < r_sm && r_sm <= PI * brange2) { //ぴったり
    hits2.rewind();
    hits2.play();
  
    bb = 2;
    
    if (-50 > x) {
      bzr = atan2(-1000 - z, -20 - x);
    } else if (770 < x) {
      bzr = atan2(-1000 - z, 740 - x);
    } else {
      bzr = -PI/2;
    }
    
    y = 250;
    byr = atan2(250 - y, 0 - z) - PI/20;
    
    if (bpcd == 3) {
      bs = p1z / 120 + 23;
      byr = atan2(250 - y, 0 - z) - PI/3;
    } else {
      bs = p1z / 50 + 28;
    }
    
  } else if (PI * brange2 < r_sm) { //早い
    bb = 0;
    
    if (x > p1x - 10) {
      bzr = atan2(-1000 - p1z, 50 - p1x);
    } else {
      bzr = atan2(-1000 - p1z, 670 - p1x);
    }
    
    byr = atan2(300 - y, 0 - z);
    
    if (bpcd == 3) {
      bs = p1z / 160 + 18;
    } else {
      bs = p1z / 50 + 15;
    }
    
  } else if (PI < r_sm && r_sm <= PI * brange1) { //遅い
    bb = 0;
    
    if (x > p1x - 10) {
      bzr = atan2(-1000 - z, 670 - x);
    } else {
      bzr = atan2(-1000 - z, 50 - x);
    }
    
    byr = atan2(300 - y, 0 - z);
    
    if (bpcd == 3) {
      bs = p1z / 160 + 18;
    } else {
      bs = p1z / 50 + 15;
    }
  }
  
  if (x > p1x - 10) {
    bzcd = true;
  } else {
    bzcd = false;
  }
  
  sx = x + ((z + 800) * cos(bzr));

  if (bpcd == 1) {
    vy = bs * sin(byr + PI/10);
  } else if (bpcd == 2) {
    bs *= 0.9;
    vy = bs * sin(byr + PI/8);
  } else if (bpcd == 3) {
    vy = bs * sin(byr + PI/2);
    smps.rewind();
    smps.play();
  }
  
  if (smash_b == true && smash_c == true) {
    hits2.rewind();
    hits2.play();
    y = 100;
    vy = atan2(450 - 100, -800 - z);
    bb = 2;
    bs = 60;
  }
  
  wh = true;
}
