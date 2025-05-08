PImage sbg;
PImage sbg2;
int sbgm = 112;

PImage p1bb, p2bb;
PImage p1rb, p1lb, p2rb, p2lb;
PImage p1okb, p2okb;
PImage okb, backb;
PImage sw, gmw, fgw;

PImage st1, st2, st3, st4, st5, st6, st7, st8;
PImage st, s2t, s3t;

PImage c1, c2, c3;

boolean a, d, j, l, f;

void select() {
  ret2 = bgm2.isPlaying();
  if (ret2 == false) {
    bgm2.play(0);
  }
  noLights();
  
  image(sbg, width, height/2, width * 2, height);
  
  push();
  tint(255, 120);
  image(sbg2, width - sbgm, height/2, height * 1.77, height);
  pop();
  
  sbgm --;
  if (sbgm == 0) {
    sbgm = 112;
  }
  
  image(backb, 150, 100, 250, 250);
  
  if (scene == "select") {
    r_select();
  } else if (scene == "select2") {
    r_select2();
  }
}

void r_select() { 
  image(p1rb, 610, 450, 200, 200);
  image(p1lb, 100, 450, 200, 200);

  if (bsp == true) {
    sound.rewind();
    sound.play();
    bsp = false;
    bgm2.pause();
    bgm2.rewind();
    scene = "title";
  }
  if (a == true) {
    server = true;
    a = false;
    sound.rewind();
    sound.play();
  }
  if (d == true) {
    server = false;
    d = false;
    sound.rewind();
    sound.play();
  }
  if (j == true) {
    gc -= 1;
    j = false;
    sound.rewind();
    sound.play();
  }
  if (l == true) {
    gc += 1;
    l = false;
    sound.rewind();
    sound.play();
  }
  if (f == true) {
    f_g_d = !(f_g_d);
    f = false;
    sound.rewind();
    sound.play();
  }
  if (ent == true) {
    sound.rewind();
    sound.play();
    ent = false;
    scene = "select2";
  }
  
  gc = constrain(gc, 1, 4);
  
  if (f_g_d == true) {
    image(fgw, width, 150, 775, 200);
  }
  
  if (server == true) {
    image(snm1, width/2, 450, 400, 400);
  } else {
    image(snm2, width/2, 450, 400, 400);
  }
  
  image(sw, width/2, 740, 775, 200);
}

int cd = 1;

void r_select2() {
  
  image(p1lb, 100, 450, 200, 200);
  
  if (bsp == true) {
    sound.rewind();
    sound.play();
    bsp = false;
    scene = "select";
  }
  
  if (a == true) {
    cd --;
    a = false;
    sound.rewind();
    sound.play();
  }
  if (d == true) {
    cd ++;
    d = false;
    sound.rewind();
    sound.play();
  }
  
  if (cd == 1) {
    image(st1, width, 450, 900, 900);
  } else if (cd == 2) {
    image(st2, width, 450, 900, 900);
  } else if (cd == 3) {
    image(st3, width, 450, 900, 900);
  } else if (cd == 4) {
    image(st4, width, 450, 900, 900);
  } else if (cd == 5) {
    image(st5, width, 450, 900, 900);
  } else if (cd == 6) {
    image(st6, width, 450, 900, 900);
  } else if (cd == 7) {
    image(st7, width, 450, 900, 900);
  } else if (cd == 8) {
    image(st8, width, 450, 900, 900);
  }
  
  cd = constrain(cd, 1, 8);
  
  if (ent == true) {
    sound.rewind();
    sound.play();
    ent = false;
    switch(cd) {
      case 1:
        k = 0.6;
        c = 0.99;
        ccr = 0;
        ccg = 128;
        ccb = 0;
        ccr2 = 100;
        ccg2 = 255;
        ccb2 = 100;
        lcr = 255;
        lcg = 255;
        lcb = 255;
        scr = 135;
        scg = 206;
        scb = 250;
        gs = 1;
        break;
        
      case 2:
        k = 0.5;
        c = 0.7;
        ccr = 170;
        ccg = 60;
        ccb = 0;
        ccr2 = 240;
        ccg2 = 110;
        ccb2 = 30;
        lcr = 255;
        lcg = 255;
        lcb = 255;
        scr = 135;
        scg = 206;
        scb = 250;
        gs = 1;
        break;
      
      case 3:
        k = 0.7;
        c = 0.7;
        ccr = 0;
        ccg = 0;
        ccb = 255;
        ccr2 = 60;
        ccg2 = 60;
        ccb2 = 255;
        lcr = 255;
        lcg = 255;
        lcb = 255;
        scr = 135;
        scg = 206;
        scb = 250;
        gs = 1;
        break;
        
      case 4:
        k = 0.8;
        c = 1.2;
        ccr = 250;
        ccg = 250;
        ccb = 250;
        ccr2 = 50;
        ccg2 = 0;
        ccb2 = 150;
        lcr = 0;
        lcg = 0;
        lcb = 0;
        scr = 20;
        scg = 0;
        scb = 60;
        gs = 1;
        break;
        
      case 5:
        k = 0.6;
        c = 1.08;
        ccr = 0;
        ccg = 0;
        ccb = 0;
        ccr2 = 0;
        ccg2 = 0;
        ccb2 = 120;
        lcr = 255;
        lcg = 255;
        lcb = 255;
        scr = 100;
        scg = 0;
        scb = 160;
        gs = 1;
        break;
        
      case 6:
        k = 1.1;
        c = 0.5;
        ccr = 50;
        ccg = 230;
        ccb = 200;
        ccr2 = 100;
        ccg2 = 230;
        ccb2 = 200;
        lcr = 0;
        lcg = 160;
        lcb = 130;
        scr = 135;
        scg = 206;
        scb = 250;
        gs = 1;
        break;
        
      case 7:
        k = 0.6;
        c = 1;
        ccr = 0;
        ccg = 0;
        ccb = 0;
        ccr2 = 0;
        ccg2 = 0;
        ccb2 = 0;
        lcr = 180;
        lcg = 160;
        lcb = 255;
        scr = 0;
        scg = 0;
        scb = 0;
        gs = 0.7;
        break;
        
      case 8:
        k = 0.4;
        c = 1.6;
        ccr = 0;
        ccg = 0;
        ccb = 0;
        ccr2 = 0;
        ccg2 = 0;
        ccb2 = 0;
        lcr = 240;
        lcg = 50;
        lcb = 255;
        scr = 240;
        scg = 100;
        scb = 255;
        gs = 1;
        break;
    }
    bgm2.pause();
    bgm2.rewind();
    auds.rewind();
    auds.play();
    scene = "audience";
  }
}
