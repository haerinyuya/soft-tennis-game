float vx, vy, vz; //ボールの加速度
float x, y, z; //ボールの座標
float g = 0.6; //重力
float k = 0.6, c = 0.99; //ばねと摩擦
float r = 10; //ボールの半径
float bzr, byr; //ボールの飛ぶ角度
float bs; //ボールのスピード
float bzc = 0; //ボールの曲がりぐあい
boolean bzcd;

float gs = 1;

boolean cut = false; //カットかどうか
int b2b = 0; //ボールの2バンの判定
boolean b2bc = false; //を一回にするための判定

boolean wh; //どっちが打った?, true == plyer1

void ball() {
  if (step == "game") {
    vy += g * gs; //重力
  }
  
  vz = (bs * gs) * sin(bzr); //飛ぶ方向
  
  if (cut == true) {
    if (bzc < PI) {
      bzc += bs/700;
    }
    if (bzcd == true) {
      vx = (bs * gs) * cos(bzr) - bs/5 * cos(bzc);
    } else {
      vx = (bs * gs) * cos(bzr) + bs/5 * cos(bzc);
    }
  } else {
    bzc = 0;
    vx = (bs * gs) * cos(bzr);
  }
  
  x += vx;
  y += vy;
  z += vz; //加速
  
  if (y > height/2 - r) { //地面で跳ね返って減速する
    if (b2bc == false) {
      vy *= -k;
      bs *= c;
      y = height/2 - r;
      b2b ++;
      b2bc = true;
      
      if (b2b == 1) {
        if (x > 785 || x < -65 || z > 1300 || z < -1300) { //アウトの判定
          bords.rewind();
          bords.play();
          bord_m = 0;
          bord = 3;
          if (wh == false) {
            score(true);
          } else {
            score(false);
          }
        }
        if (f_j == true) {
          f_j = false;
          if (server == true && z > 0) {
            bords.rewind();
            bords.play();
            bord_m = 0;
            bord = 7;
            score(true);
          } else if (server == false && z < 0) {
            bords.rewind();
            bords.play();
            bord_m = 0;
            bord = 7;
            score(false);
          }
          else if (server == true && s_p == true && x > 370 || x < -65 ||   //フォルトの判定
              server == false && s_p == true && x < 350 || x > 785 || 
              server == true && s_p == false && x < 350 || x > 785 || 
              server == false && s_p == false && x > 370 || x < -65) {
            if (ws == false) {
              bords.rewind();
              bords.play();
              bord_m = 0;
              bord = 5;
              f_j = true;
              if (server == true) {
                score(false);
              } else {
                score(true);
              }
            } else {
              bords.rewind();
              bords.play();
              bord_m = 0;
              bord = 4;
              ws = false;
              f_j = true;
              b2b = 0;
              cameraY = 200;
              cameraZ = 1000;
              cameraX = 50;
              cameraY2 = 200;
              cameraZ2 = 1000;
              cameraX2 = 50;
              step = "serve";
            }
          }
        }
      }
      if (b2b == 2) {
        bords.rewind();
        bords.play();
        bord_m = 0;
        bord = 6;
        if (z > 0) {
          score(false);
        } else {
          score(true);
        }
      }
    }
  } else {
    b2bc = false;
  }
  
  if (x > -625 + width/2 && x < 625 + width/2) { //ネットに引っかかる
    if (z > 0 && y > height/2 - 107) {
      if (z < bs) {
        bs = 0;
        vy *= 0.5;
      }
    }
  }
  
  if (x > -625 + width/2 && x < 625 + width/2) { //逆側からネットに引っかかる
    if (z < 0 && y > height/2 - 107) {
      if (z > -bs) {
        bs = 0;
        vy *= 0.5;
      }
    }
  }
  
  push();
  translate(x, y, z);
  noStroke();
  fill(255);
  specular(255);
  if (step == "game") {
    sphere(r);
  }
  pop();
  
  if (step == "game") {
    //影
    push();
    translate(x, height/2 - 3, z);
    noStroke();
    fill(0, 150);
    rotateX(PI/2);
    circle(0, 0, y/15);
    pop();
  }
}

void ball_m(){
  //if (z > 2000) {
  //  b2b = 0;
  //  bb = 0;
  //  cut = false;
  //  bpcd = 3;
  //  bpc = 30;
  //  bs = 36;
  //  bzr += PI;
  //  byr = -40;
  //  vy = bs * sin(radians(byr));
  //}
  
  //if (z < -2000) {
  //  b2b = 0;
  //  bb = 0;
  //  cut = false;
  //  bpcd = 3;
  //  bpc = 30;
  //  bzr -= PI;
  //  byr = -40;
  //  bs = 36;
  //  vy = bs * sin(radians(byr));
  //}
}

void ball_p() {
  if (step == "game") {
    ball_c.add(new BALL());
  }
  for (int i = ball_c.size() - 1; i >= 0; i--) {
    ball_c.get(i).ball_c_p();
    if (ball_c.get(i).bpr <= 0) {
      ball_c.remove(i);
    }
  }
  for (int i = hit.size() - 1; i >= 0; i--) {
    hit.get(i).hit_p();
    if (hit.get(i).rlife <= 0) {
      hit.remove(i);
    }
  }
}

float bb = 0; //ボールの軌跡のぶれ
float bpc = 10; //ボールの軌跡の色
float bpsr = 10; //ボールの軌跡の大きさ
int bpcd = 1; //ボールの軌跡の色を判断する
