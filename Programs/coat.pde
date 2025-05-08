float aud_m = 0, aud2_m = 0, aud3_m = 0;
float aud_mF = 0, aud2_mF = -PI / 2, aud3_mF = -PI;
float aud_mff = PI/30;
float aud_ms = 1;

int ccr, ccg, ccb, ccr2, ccg2, ccb2, lcr, lcg, lcb, scr, scg, scb;

void coat() {
  //3Dモデルの配置
  push();
  translate(162, 450, -100);
  shape(net);
  translate(180, 1, 100);
  shape(stadium);
  pop();
  
  push();
  translate(500, aud_m + 400, -1000);
  shape(audience1);
  pop();
  
  push();
  translate(-500, aud2_m + 400, 0);
  shape(audience2);
  pop();
  
  push();
  translate(400, aud3_m + 400, 1180);
  shape(audience3);
  pop();
  
  aud_mF += aud_mff;
  aud2_mF += aud_mff;
  aud3_mF += aud_mff;
  
  if (aud_mF > PI / 6 && aud_mF < PI * 5 / 6) {
    aud_m -= 5 * cos(aud_mF) * aud_ms;
  }
  if (aud_mF > PI * 2) {
    aud_m = 0;
    aud_mF = 0;
  }
  
  if (aud2_mF > PI / 6 && aud2_mF < PI * 5 / 6) {
    aud2_m -= 5 * cos(aud2_mF) * aud_ms;
  }
  if (aud2_mF > PI ) {
    aud2_m = 0;
    aud2_mF = -PI / 2;
  }
  
  if (aud3_mF > PI / 6 && aud3_mF < PI * 5 / 6) {
    aud3_m -= 5 * cos(aud3_mF) * aud_ms;
  }
  if (aud3_mF > PI / 2 * 3) {
    aud3_m = 0;
    aud3_mF = -PI;
  }
  
  //コートの周り
  push();
  translate(width/2, height/2, 0);
  noStroke();
  fill(ccr2, ccg2, ccb2);
  beginShape();
  vertex(-width * 1.5, 0, 2000);
  vertex(-width * 1.5, 0, -2000);
  vertex(width * 1.5, 0, -2000);
  vertex(width * 1.5, 0, 2000);
  beginContour();
  vertex(-548, 0, 1188);
  vertex(548, 0, 1188);
  vertex(548, 0, -1188);
  vertex(-548, 0, -1188);
  endContour();
  endShape();
  
  //コート
  beginShape();
  fill(ccr, ccg, ccb);
  vertex(548.5, 0, 1188.5);
  vertex(-548.5, 0, 1188.5);
  vertex(-548.5, 0, -1188.5);
  vertex(548.5, 0, -1188.5);
  endShape(CLOSE);
  
  noLights();
  push();
  translate(0, -1, 0);
    rotateX(PI/2);
    if (cd == 5) {
      image(st, 0, 0);
    } else if (cd == 7) {
      image(s2t, 0, 0);
    } else if (cd == 8) {
      image(s3t, 0, 0);
    }
  pop();
  ambientLight(150, 150, 150); 
  lightSpecular(255, 255, 255);
  directionalLight(30, 30, 30, 0, 1, 0); //影
  
  //ライン
  push();
  translate(0, -2, 0);
  noStroke();
  fill(lcr, lcg, lcb);
  rotateX(PI/2);
  rect(-548.5, 0, 10, 2377);
  rect(548.5, 0, 10, 2377);//サイドライン(外側)
  rect(-411.5, 0, 10, 2377);
  rect(411.5, 0, 10, 2377);//サイドライン(内側)
  rect(0, 640, 823, 10);
  rect(0, -640, 823, 10);//サービスライン
  rect(0, 0, 10, 1280);//センターライン
  rect(0, 1179, 10, 18);
  rect(0, -1179, 10, 18);//センターマーク
  rect(0, 1188.5, 1107, 10);
  rect(0, -1188.5, 1107, 10);//ベースライン
  pop();
  pop();
}

void final_draw() {
  
  //player2のラケット
  push();
    translate(p2x, p2y, p2z);
    rotateY(-radians(p2r));
    rotateZ(p2rZ);
    push();
      translate(p2rhX, p2rhY, p2rhZ);
      rotateX(p2hrt);
      translate(p2rhX, 0, p2rhZ );
      rotateY(PI/2);
      rotateZ(-PI/2);
      if (step == "serve" && server == false) {
        image(r_f9s, 0, 0, 50, 100);
      }else if (vz > 0 || z > 0 || x < p2x + 10) {
        image(r_f9s, 0, 0, 50, 100);
      }
    pop();
    
    push();
      translate(p2lhX, p2lhY, p2lhZ);
      rotateX(-p2hrt);
      translate(p2lhX, 0, p2lhZ );
      rotateY(-PI/2);
      rotateZ(-PI/2);
      if (step == "serve" && server == false) {
      }else if (vz <= 0 && z < 0 && x > p2x + 10) {
        image(r_f9s, 0, 0, 50, 100);
      }
    pop();
  pop();
  
  //ネット (最後じゃないと透けない)
  push();
  translate(width/2, height/2 - 50, 0);
  noStroke();
  fill(100, 100);
  rect(0, 0, 1230, 100);
  pop();
  
  //ラケット (ネットの後じゃないと透けない)
  push();
    translate(p1x, p1y, p1z);
    rotateY(-radians(p1r));
    rotateZ(p1rZ);
    push();
      translate(prhX, prhY, prhZ);
      rotateX(phrt);
      translate(prhX, 0, prhZ);
      rotateY(PI/2);
      rotateZ(-PI/2);
      if (step == "serve" && server == true) {
        image(r_f9s, 0, 0, 50, 100);
      }else if (vz < 0 || z < 0 || x > p1x - 10) {
        image(r_f9s, 0, 0, 50, 100);
      }
    pop();
    
    push();
      translate(plhX, plhY, plhZ);
      rotateX(-phrt);
      translate(plhX, 0, plhZ);
      rotateY(-PI/2);
      rotateZ(-PI/2);
      if (step == "serve" && server == true) {
      } else if (vz >= 0 && z > 0 && x < p1x - 10) {
        image(r_f9s, 0, 0, 50, 100);
      }
    pop();
  pop();
}
