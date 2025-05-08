float p1_v = 0;
float p2_v = 0;
float p1cx, p1cz;
float p2cx, p2cz;

PImage winw, losew, winw2, losew2;

void win() {
  p1_v += PI/1000;
  push();
  translate(p1x, p1z);
  p1cx = cos(p1_v);
  p1cz = sin(p1_v);
  pop();
  
  if (winner == true) {
    camera(500 * p1cx, 300, 500 * p1cz, p1x, 400, p1z, 0, 1, 0);
    prhY = -60;
    p2rhY =10;
    push();
      camera(width/2, height/2, 780, width/2, height/2, 0, 0, 1, 0);
      if (p1_game == 0) {
        image(snm0, width/2, 300, 200, 200);
      } else if (p1_game == 1) {
        image(snm1, width/2, 300, 200, 200);
      } else if (p1_game == 2) {
        image(snm2, width/2, 300, 200, 200);
      } else if (p1_game == 3) {
        image(snm3, width/2, 300, 200, 200);
      } else if (p1_game == 4) {
        image(snm4, width/2, 300, 200, 200);
      }
      image(winw, width/2, 100, 775, 200);
    pop();
  } else {
    camera(500 * p1cx, 0, 500 * p1cz, p1x, 400, p1z, 0, 1, 0);
    p2rhY = -60;
    prhY = 10;
    push();
      camera(width/2, height/2, 780, width/2, height/2, 0, 0, 1, 0);
      if (p1_game == 0) {
        image(snm0, width/2, 300, 200, 200);
      } else if (p1_game == 1) {
        image(snm1, width/2, 300, 200, 200);
      } else if (p1_game == 2) {
        image(snm2, width/2, 300, 200, 200);
      } else if (p1_game == 3) {
        image(snm3, width/2, 300, 200, 200);
      } else if (p1_game == 4) {
        image(snm4, width/2, 300, 200, 200);
      }
      image(losew, width/2, 100, 775, 200);
    pop();
  }
  if (ent == true) {
    for (int i = 0; i < 2; i++) {
      for (int j = 0; j < 7; j++) {
        score[i][j] = 0;
      }
    }
    gcw = false;
    scoreY = 0;
    scoreY2 = 0;
    score_f = -10;
    score_f2 = -10;
    score_e = 1;
    score_e2 = 1;
    cameraY = 200;
    cameraZ = 1000;
    cameraX = 50;
    cameraY2 = 200;
    cameraZ2 = 1000;
    cameraX2 = 50;
    aud_mff = PI/30;
    aud_ms = 1;
    s_r = false;
    s_p = !(s_p);
    b2b = 0;
    bs = 0;
    bb = 0;
    bpc = 10;
    bpcd = 1;
    prhY = -10;
    p2rhY = -10;
    smash_b = false;
    smash_c = false;
    smash_c2 = false;
    ws = true;
    f_j = true;
    x = width/2;
    y = 0;
    z = 1180;
    bzr = -90;
    byr = 60;
    bs = 0;
    p1x = width/2;
    p1y = height/2 - 60;
    p2z = 1000;
    p2x = width/2;
    p2y = height/2 - 60;
    p2z = -1000;
    bord_m = 0;
    bord = 1;
    t_count = 0;
    game_c = 1;
    p1_game = 0;
    p2_game = 0;
    server = true;
    s_p = true;
    sc = 3;
    gc = 4;
    cd = 1;
    gs = 1;
    deuces = false;
    f_g_d = true;
    f_game = false;
    finish = false;
    gcw = false;
    fw = false;
    cw = false;
    ent = false;
    bgm4.pause();
    bgm4.rewind();
    scene = "title";
  }
}
