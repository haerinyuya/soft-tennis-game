PImage title;
PImage title2;
PImage logo;
PImage cursor;
PImage cursor2;

int t2x = -width * 3;
int bsi = 0;
int logo_s = 3000;
int logo_t = 0;

PImage tb1, tb2, tb3, tb4;

float bs1, bs2, bs3, bs4 = 1;

float cux = 585, cuy = 130;

void title_scene() {
  camera(width/2, height/2, 780, width/2, height/2, 0, 0, 1, 0);
  
  noLights();
  image(title, width, height/2, width * 2, height);
  
  push();
  tint(255, 160);
  image(title2, t2x, height/2, height, height);
  pop();
  t2x += 20;
  t2x = constrain(t2x, -width * 3, 350);
  
  push();
  
  bsi += 4;
  bsi = constrain(bsi, 0, 255);
  tint(255, bsi);
  
  image(tb1, 440, 150, 400 * bs1, 210 * bs1);
  if (cuy == 130) {
    bs1 += 0.03;
      if (ent == true) {
        bgm1.pause();
        bgm1.rewind();
        bpa.play();
        bpa.rewind();
        ent = false;
        ai = false;
        scene = "select";
      }
  } else {
    bs1 -= 0.03;
  }

  image(tb2, 395, 250, 400 * bs2, 210 * bs2);
  if (cuy == 230) {
    bs2 += 0.03;
    if (ent == true) {
      bgm1.pause();
      bgm1.rewind();
      bpa.play();
      bpa.rewind();
      ent = false;
      ai = true;
      
      scene = "select";
    }
  } else {
    bs2 -= 0.03;
  }

  image(tb3, 350, 350, 400 * bs3, 210 * bs3);
  if (cuy == 330) {
    bs3 += 0.03;
  } else {
    bs3 -= 0.03;
  }

  image(tb4, 305, 450, 400 * bs4, 210 * bs4);
  if (cuy == 430) {
    bs4 += 0.03;
  } else {
    bs4 -= 0.03;
  }

  image(cursor, cux, cuy);
  
  pop();
  
  if (cuup == true) {
    if (cuy == 130) {
      cuy += 300;
      cux -= 135;
    } else {
      cuy -= 100;
      cux += 45;
    }
    ba.rewind();
    ba.play();
    cuup = false;
  } else if (cudown == true) {
    if (cuy == 430) {
      cuy -= 300;
      cux += 135;
    } else {
      cuy += 100;
      cux -= 45;
    }
    ba.rewind();
    ba.play();
    cudown = false;
  }
  
  push();
  tint(255, logo_t);
  image(logo, 900, height/3 * 2, logo_s, logo_s * 0.43);
  pop();
  logo_s -= 40;
  logo_s = constrain(logo_s, 1000, 3000);
  logo_t += 3;
  logo_t = constrain(logo_t, 0, 255);
  
  cuy = constrain(cuy, 130, 430);
  bs1 = constrain(bs1, 1, 1.2);
  bs2 = constrain(bs2, 1, 1.2);
  bs3 = constrain(bs3, 1, 1.2);
  bs4 = constrain(bs4, 1, 1.2);
}
