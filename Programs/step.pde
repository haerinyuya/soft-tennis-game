String step = "serve";

boolean server = true; //サーバーの判定, true == player1, false == player2
boolean s_p = true; //サーブを打つ位置の判定, true == 右, false == 左
boolean ws = true; //ファーストかセカンドか, true == 1st, false == 2nd
boolean f_j = true; //フォルトを判定するかどうかの判定

float cameraY = 200; //カメラの動き
float cameraZ = 1000;
float cameraX = 50;

float cameraY2 = 200; //カメラの動き
float cameraZ2 = 1000;
float cameraX2 = 50;

void step() {
  if (step == "serve") {
    serve_step();
  } else if (step == "game") {
    game_step();
  } else if (step == "count") {
    count_step();
  }
}

void serve_step() {
  
  if (server == true) {
    p1z = constrain(p1z, 1200, 1200);
    if (s_p == true) {
      camera(p1x + 50, height/2 - 200, p1z + 400, p1x - 548, height/2 - 50, -1188, 0, 1, 0);
      p1x = constrain(p1x, width/2 + 50, width/2 + 400);
    } else {
      camera(p1x - 50, height/2 - 200, p1z + 400, p1x + 548, height/2 - 50, -1188, 0, 1, 0);
      p1x = constrain(p1x, width/2 - 400, width/2 - 50);
    }
  } else {
    camera(width/2 + (p1x - width/2) * 0.7, -height/8 - p1z * 0.1, 1400 + p1z * 0.5, width/2 + (p1x - width/2) * 0.7, height - p1z * 0.1, -1000 + p1z * 0.5, 0, 1, 0);
  }
}

void game_step() {
  if (cameraZ < 1600 && server == true) {
    cameraY += 17;
    cameraZ += 20;
    cameraX -= 6;
    if (s_p == true) {
      camera(p1x + cameraX, height/2 - cameraY, p1z * 0.5 + cameraZ, p1x - cameraX - 200, height/2, -1000 + p1z * 0.5, 0, 1, 0);
    } else {
      camera(p1x - cameraX, height/2 - cameraY, p1z * 0.5 + cameraZ, p1x + cameraX + 200, height/2, -1000 + p1z * 0.5, 0, 1, 0);
    }
  } else {
    camera(width/2 + (p1x - width/2) * 0.7, -height/8 - p1z * 0.1, 1400 + p1z * 0.5, width/2 + (p1x - width/2) * 0.7, height - p1z * 0.1, -1000 + p1z * 0.5, 0, 1, 0);
    //camera(width, -300, 2000, 0, 0, 0, 0, 1, 0);
  }
}

int t_count = 0; //点数の演出まで少し待つ

void count_step() {
  
  if (t_count < 60) {
    t_count ++;
    if (t_count == 59) {
      scores.rewind();
      scores.play();
      auds.rewind();
      auds.play();
      aud_mff = PI/10;
      aud_ms = 4;
    }
  } else {
    score_s();
  }
}
