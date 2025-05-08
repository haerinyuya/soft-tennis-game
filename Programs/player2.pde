float p2x = 0;
float p2y = height/2 - 60;
float p2z = -1000;
float p2r;
float p2s = 0;

float p2rZ = 0;
float p2rhX = 0, p2rhY = -10, p2rhZ = 50; //右手の座標
float p2lhX = 0, p2lhY = -10, p2lhZ = -50; //左手の座標
float p2hX = 0, p2hZ = 0; //頭の座標
float p2hrt = 0; //手首の角度
float p2ym = 0; //上下運動
float p2ry = 250; //打てる高さ

boolean r_s2 = false; //ラケットを振った判定
boolean s_s2 = false; //サーブのトスの判定
float r_sm2 = PI;
float s_sm2 = PI;
boolean r_h2 = false; //ボールに当たった判定

void player2_move() {
  if (r_s2 == false && s_s2 == false) {
    if (p2_right == true && p2_left == true || p2_up == true && p2_down == true || p2_right == false && p2_left == false && p2_up == false && p2_down == false) {
      p2s = 0;
      p2r = 90;
      p2rZ = 0;
    } else {
      p2s = 15;
      p2rZ = PI/8;
    }
    
    if (p2_right == true) {
      p2r = 180;
      if (p2_up == true) {
        p2r = 135;
      } else if (p2_down == true) {
        p2r = -135;
      }
    } else if (p2_left == true) {
      p2r = 0;
      if (p2_up == true) {
        p2r = 45;
      } else if (p2_down == true) {
        p2r = -45;
      }
    } else if (p2_up == true) {
      p2r = 90;
    } else if (p2_down == true) {
      p2r = -90;
    }
    
    p2x += p2s * cos(radians(p2r));
    p2z += p2s * sin(radians(p2r));
  }
  
  p2x = constrain(p2x, -width + 30, width * 2 - 30);
  p2z = constrain(p2z, -1700, -80);
  
}

void r_s2() {
  p2y = height/2 - 60;
  p2rZ = 0;
  r_sm2 += PI/12;
  if (vz > 0 ||  z > 0 || x < p2x + 10) {
    p2r += 24 * cos(r_sm2);
  } else {
    p2r -= 24 * cos(r_sm2);
  }
  if (r_sm2 > PI * 1.5) {
    r_h2 = false;
  }
  if (r_sm2 > PI * 2) {
    r_sm2 = PI;
    r_s2 = false;
    r_h2 = false;
    AIP.ai_s = true;
  }
  if (r_h2 == false) {
    if (vz < 0) {
      r_h2();
    }
  }
}

void r_h2() {
  if (smash_c2 == true) {
    p2ry = 350;
  } else {
    p2ry = 250;
  }
  
  if (abs(p2z - z) < 100 && abs(p2x - x) < 140 && y > height/2 - 250) {
    r_h2 = true;
    b2b = 0;
    bzc = 0;
    p2rhY = -10;
    
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
    
    r_h2_r();
  }
}

void r_h2_r() {
  
  hits.rewind();
  hits.play();
  
  if (PI * brange1 < r_sm2 && r_sm2 <= PI * brange2) { //ぴったり
    hits2.rewind();
    hits2.play();
  
    bb = 2;
    
    if (770 < x) {
      bzr = atan2(1000 - z, 740 - x);
    } else if (-50 > x) {
      bzr = atan2(1000 - z, 0 - x);
    } else {
      bzr = PI/2;
    }
    
    y = 250;
    byr = atan2(250 - y, 0 - z) + PI/20;
    
    if (bpcd == 3) {
      bs = -p2z / 120 + 23;
      byr = atan2(250 - y, 0 - z) + PI/3;
    } else {
      bs = -p2z / 50 + 28;
    }
    
  } else if (PI * brange2 < r_sm2) { //早い
    bb = 0;
    
    if (x < p2x + 10) {
      bzr = atan2(1000 - z, 670 - x);
    } else {
      bzr = atan2(1000 - z, 50 - x);
    }
    
    byr = atan2(300 - y, 0 - z);
    
   if (bpcd == 3) {
      bs = -p2z / 160 + 18;
    } else {
      bs = -p2z / 50 + 15;
    }
    
  } else if (PI < r_sm2 && r_sm2 <= PI * brange1) { //遅い
    bb = 0;
    
    if (x < p2x + 10) {
      bzr = atan2(1000 - z, 50 - x);
    } else {
      bzr = atan2(1000 - z, 670 - x);
    }
    
    byr = atan2(300 - y, 0 - z);
    
    if (bpcd == 3) {
      bs = -p2z / 160 + 18;
    } else {
      bs = -p2z / 50 + 15;
    }
  }
  
  if (x < p2x + 10) {
    bzcd = true;
  } else {
    bzcd = false;
  }
  
  sx = x + (abs(z - 800) * cos(bzr));
  
  if (bpcd == 1) {
    vy = bs * sin(byr - PI/10);
  } else if (bpcd == 2) {
    bs *= 0.9;
    vy = bs * sin(byr - PI/8);
  } else if (bpcd == 3) {
    vy = bs * sin(byr - PI/2);
    smps.rewind();
    smps.play();
  }
  
  if (smash_b == true && smash_c2 == true) {
    hits2.rewind();
    hits2.play();
    y = 100;
    vy = atan2(450 - 100, 800 - z);
    bb = 2;
    bs = 60;
  }
  
  wh = false;
}
