boolean smash_b = false; //スマッシュできるかの判定
boolean smash_c = false; //スマッシュの範囲に入っているかの判定
boolean smash_c2 = false;

float sx;

PImage sm_p;
float smpr;

void smash() {
  if (bpc == 30) {
    smash_b = true;
  } else {
    smash_b = false;
  }
  smpr += PI/30;
  if (smpr > PI * 2) {
    smpr = 0;
  }
  
  if (smash_b == true) {
    if (vz > 0) {
      smash_c2 = false;
      push();
      translate(sx, height/2 - 2, 800);
      rotateX(PI/2);
      rotateZ(smpr);
      image(sm_p, 0, 0);
      pop();
      if (dist(p1x, p1z, sx, 800) < 100) {
        smash_c = true;
      } else {
        smash_c = false;
      }
    } else if (vz < 0) {
      smash_c = false;
      push();
      translate(sx, height/2 - 2, -800);
      rotateX(PI/2);
      rotateZ(smpr);
      image(sm_p, 0, 0);
      pop();
      if (dist(p2x, p2z, sx, -800) < 100) {
        smash_c2 = true;
      } else {
        smash_c2 = false;
      }
    }
  } else {
    smash_c = false;
    smash_c2 = false;
  }
  if (smash_c == true) {
    if (prhY > -70) {
      prhY -= 10;
    }
  } else {
    if (step != "serve") {
      prhY = -10;
    }
  }
  if (smash_c2 == true) {
    if (p2rhY > -70) {
      p2rhY -= 10;
    }
  } else {
    if (step != "serve") {
      p2rhY = -10;
    }
  }
}
