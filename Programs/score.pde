int score[][] = {{0, 0, 0, 0, 0, 0, 0},
                 {0, 0, 0, 0, 0, 0, 0}};
int p1_game = 0;
int p2_game = 0; //取ったゲーム数

int sc = 3; //点数の判定
int gc = 4; //何ゲームマッチか
                 
int game_c = 1; //何ゲーム目かのカウント
boolean p_get; //どっちが点数を取ったかの判定, true == player1, false == player2
boolean f_game = false; //ファイナル？
boolean f_g_d = true; //ファイナルするかどうか
boolean winner; //勝ったのは!? true == player1, false == player2
boolean finish = false;

void score(boolean p) {
  if (p == true) {
    if (game_c <= 7) {
      score[0][game_c - 1] += 1;
    }
    p_get = true;
  } else {
    if (game_c <= 7) {
      score[1][game_c - 1] += 1;
    }
    p_get = false;
  }
  if (f_game == true) {
    sc = 6;
  }
  if (score[0][game_c - 1] >= sc && score[1][game_c - 1] == score[0][game_c - 1]) {
      deuces = true;
    }
  if (score[0][game_c - 1] > sc || score[1][game_c - 1] > sc) {
    if (score[0][game_c - 1] - score[1][game_c - 1] == 1) {
      adv = true;
    } else if (score[1][game_c - 1] - score[0][game_c - 1] == 1) {
      adv = false;
    }
    if (score[0][game_c - 1] > score[1][game_c - 1] + 1) {
      p1_game += 1;
      if (game_c < 7) {
        game_c += 1;
      }
      game_s = true;
      p_get = true;
    } else if (score[1][game_c - 1] > score[0][game_c - 1] + 1) {
      p2_game += 1;
      if (game_c < 7) {
        game_c += 1;
      }
      game_s = true;
      p_get = false;
    }
  }
  if (f_game == true) {
    if ((score[0][game_c - 1] + score[1][game_c - 1]) % 2 == 0) {
      server = !(server);
    }
  }
  if (p1_game >= gc - 1 || p2_game >= gc - 1) {
    if (p1_game == p2_game) {
      if (f_g_d == true) {
        f_game = true;
      }
    }
    if (p1_game == gc) {
      winner = true;
      finish = true;
    } else if (p2_game == gc) {
      winner = false;
      finish = true;
    }
  }
  step = "count";
}

float scoreY = 0, scoreY2 = 0; //スコア表示の座標
float score_f = -10; //スコア表示を動かすための変数
float score_f2 = -10;
float score_e = 1, score_e2 = 1;
boolean adv = true; //どっちがアドバンテージか, true == player1, false == player2
boolean deuces = false; //デュースかどうかの判定
boolean game_s = false; //ゲームカウントを見せるかどうかの判定

PImage p1_ss, p2_ss, deucess, gamecs;
PImage snm0, snm1, snm2, snm3, snm4, snm5, snm6, snm7, sadv;

void score_s() {
  if (p_get == true) {
    score_e = 1.4;
    score_e2 = 1;
  } else {
    score_e2 = 1.4;
    score_e = 1;
  }
  
  push();
    noLights();
    camera(width/2, height/2, 780, width/2, height/2, 0, 0, 1, 0);
    if (score_f < 10) {
      score_f += 0.15;
      scoreY = pow(score_f, 3) + 450;
    } else {
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
      if (s_p == true) {
        p1x = 700;
        p2x = 50;
      } else {
        p1x = 50;
        p2x = 700;
      }
      p1z = 900;
      p2z = -900;
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
      bords.rewind();
      bords.play();
      bord_m = 0;
      bord = 1;
      t_count = 0;
      deuces = false;
      if (game_s == true) {
        cw = true;
        game_s = false;
        s_p = true;
        server = !(server);
        p1x = 700;
        p2x = 50;
      }
      if (f_game == true) {
        if (score[0][game_c - 1] == 0 && score[1][game_c - 1] == 0) {
          fw = true;
        }
        if ((score[0][game_c - 1] + score[1][game_c - 1]) % 2 == 0) {
          cw = true;
        }
      }
      if (finish == true) {
        auds.rewind();
        auds.play();
        aud_mff = PI/10;
        aud_ms = 4;
        bgm3.pause();
        bgm3.rewind();
        scene = "winner";
      }
      step = "serve";
    }
    if (game_s == true) {
      if (p_get == false) {
        scoreY = -scoreY + 900;
      }
      gcw = true;
      push();
        translate(width/2, scoreY);
        image(p1_ss, 0, 0, 775 * score_e, 200 * score_e);
        
        if (p1_game == 0) {
          image(snm0, 200, 0, 200 * score_e, 200 * score_e);
        } else if (p1_game == 1) {
          image(snm1, 200, 0, 200 * score_e, 200 * score_e);
        } else if (p1_game == 2) {
          image(snm2, 200, 0, 200 * score_e, 200 * score_e);
        } else if (p1_game == 3) {
          image(snm3, 200, 0, 200 * score_e, 200 * score_e);
        } else if (p1_game == 4) {
          image(snm4, 200, 0, 200 * score_e, 200 * score_e);
        }
      pop();
      
      
    } else {
      if (deuces == true) {
        translate(width, scoreY);
        image(deucess, 0, 0, 1550, 200);
      } else {
        if (p_get == false) {
          scoreY = -scoreY + 900;
        }
        translate(width/2, scoreY);
        image(p1_ss, 0, 0, 775 * score_e, 200 * score_e);
      
        if (score[0][game_c - 1] > sc && adv == true) {
          image(sadv, 100, 0, 320 * score_e, 180 * score_e);
        } else if (score[0][game_c - 1] == 0) {
          image(snm0, 200, 0, 200 * score_e, 200 * score_e);
        } else if (score[0][game_c - 1] == 1) {
          image(snm1, 200, 0, 200 * score_e, 200 * score_e);
        } else if (score[0][game_c - 1] == 2) {
          image(snm2, 200, 0, 200 * score_e, 200 * score_e);
        } else if (score[0][game_c - 1] == 3) {
          image(snm3, 200, 0, 200 * score_e, 200 * score_e);
        } else if (score[0][game_c - 1] == 4) {
          image(snm4, 200, 0, 200 * score_e, 200 * score_e);
        } else if (score[0][game_c - 1] == 5) {
          image(snm5, 200, 0, 200 * score_e, 200 * score_e);
        } else if (score[0][game_c - 1] == 6) {
          image(snm6, 200, 0, 200 * score_e, 200 * score_e);
        } else if (score[0][game_c - 1] == 7) {
          image(snm7, 200, 0, 200 * score_e, 200 * score_e);
        }
      }
    }
    ambientLight(150, 150, 150); 
    lightSpecular(255, 255, 255);
    directionalLight(30, 30, 30, 0, 1, 0);
  pop();
}
