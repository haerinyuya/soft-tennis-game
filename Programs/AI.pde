boolean ai = false;

AI AIP = new AI();

class AI {
  
  boolean ball_lr_p; //自分から見てボールはどこにあるか true == 右, false == 左
  boolean ball_fb_p; //自分から見てボールはどこにあるか true == 前, false == 後ろ
  boolean p1_lr; //プレイヤー１はどこにいるか true == AIから見て右, false == AIから見て左
  boolean p1_fb; //プレイヤー１はどこにいるか true == ネットの近く, false == 普通
  boolean w_s; //フォアハンドにする？バックハンドにする？ true == フォアハンド, false == バックハンド
  boolean ai_d; //攻める？守る？ true == 攻める, false == 守る
  int ball_kinds; //どれを打つ？ ドライブ == 1, カット == 2, ロブ == 3
  int ai_dd;
  float ball_lr; //ボールとの左右の距離
  float ball_fb; //ボールとの前後の距離
  float ball_fb_d;
  float st; //打つタイミング
  float ai_p; //AIの戻るポジション
  int ai_s_d; //サーブの種類
  float ai_s_t; //サーブを打つタイミング
  
  float ai_px, ai_pz; //AIのポジション
  
  boolean ai_s;
  boolean ai_ss;
  
  float ai_st;
  float ai_rt;
  float ai_pd;
  
  AI() {
    
    ball_fb_d = 300;
    st = random(150, 180);
    ai_s = true;
    ai_ss = true;
    ai_p = -1300;
    ai_s_d = int(random(1, 2.99));
    ai_s_t = random(-70, -67);
    ai_d = false;
  }
  
  void ai() {
    ai_decide(); //変数の決定をする
    ai_move();
    ai_shoot();
  }
  
  void ai_decide() {
    
    if (bpcd == 3) {
      ball_fb_d = 600;
    } else {
      ball_fb_d = 300;
    }
    
    //ボールは右か左か
    if (p2x >= x) {
      ball_lr_p = true;
    } else if (p2x < x) {
      ball_lr_p = false;
    }
    
    //ボールは前か後ろか
    if (p2z + ball_fb_d <= z) {
      ball_fb_p = true;
    } else if (p2z + ball_fb_d > z) {
      ball_fb_p = false;
    }
    
    //プレイヤー１は右か左か
    if (p1x >= width/2) {
      p1_lr = true;
    } else if (p1x < width/2) {
      p1_lr = false;
    }
    
    //プレイヤー１はネットの近くにいるか
    if (p1z < 300) {
      p1_fb = true;
    } else {
      p1_fb = false;
    }
    
    //ボールとの距離
    ball_lr = x - p2x;
    ball_fb = z - p2z;
    
    //AIのポジション決め
    if (ai_d == false) {
      ai_p = -900 -p1z/2;
    } else {
      ai_p = -200 -p1z/2;
    }
    
    ai_pz = ai_p;
    ai_px = sin(atan2(p1z + 1188, p1x - width/2) + HALF_PI) * (abs(-1188 - ai_pz)) + width/2;
    
    if (ai_d == true) {
      if (ai_px >= width/2) ai_px += 50;
      if (ai_px < width/2) ai_px -= 50;
    }
    
  }
  
  void ai_move() {
    if (step == "serve") { //サーブの動き
      
      if (server == true) {
        if (s_p == true) {
          p2x = (p1x - 700)/2;
        } else {
          p2x = (p1x - 50)/2 + 700;
        }
      } else {
        p2_right = false;
        p2_left = false;
        p2_up = false;
        p2_down = false;
      }
      
      
    } else if (step == "game") { //ラリー中の動き
      
      
      if (vz > 0) {
        
        //push();
        //strokeWeight(10);
        //stroke(255);
        //point(ai_px, height/2, ai_pz);
        //pop();
        
        //打った後ポジションに戻る
        if (abs(p2x - ai_px) < 10) {
          p2_right = false;
          p2_left = false;
        } else if (p2x < ai_px) {
          p2_right = false;
          p2_left = true;
        } else if (p2x > ai_px) {
          p2_right = true;
          p2_left = false;
        }
        
        if (abs(p2z - ai_pz) < 10) {
          p2_up = false;
          p2_down = false;
        } else if (p2z > ai_pz) {
          p2_up = false;
          p2_down = true;
        } else if (p2z < ai_pz) {
          p2_up = true;
          p2_down = false;
        }
        
      } else {
        
        //左右の動き
        if (ai_d == true || smash_b == true || z < 0) {
          if (z < 0) {
            if (ball_lr_p == true) {
              p2_right = true;
              p2_left = false;
            } else  if (ball_lr_p == false) {
              p2_right = false;
              p2_left = true;
            }
          }
          
          //前後の動き
          if (f_j == false) {
            if (ball_fb_p == true) {
              p2_up = true;
              p2_down = false;
            } else { 
              p2_up = false;
              p2_down = true;
            }
          }
        }
      }
      
      
    } else if (step == "count") {
      p2_right = false;
      p2_left = false;
      p2_up = false;
      p2_down = false;
    }
  }
  
  void ai_shoot() {
    if (step == "serve") { //サーブの動き
      
      if (server == false) {
        //サーブを打つ
        if (ai_ss == true) {
          p2r = 90;
          s_s2 = true;
          vret = true;
          ai_ss = false;
          ai_s_d = int(random(1, 2.7));
          ai_s_t = random(-69, -67);
        
        }
        
        if (ai_s_t > p2rhY) {
          if (ai_s_d == 1) {
            ssd = true;
          } else {
            ssc = true;
          }
          if (f_j == true) {
            ai_d = false;
          }
        }
      }
    
      
    } else if (step == "game") { //ラリー中の動き
    
    
      //ボールを打つ
      if (ai_s == true) {
        if (f_j == false) {
          if (-st < ball_fb && ball_fb < st && abs(ball_lr) < 140) {
            p2r = 90;
            p2rhY = -10;
            r_s2 = true;
            ai_s = false;
            ai_dd = int(random(0, 100));
            st = random(150, 180);
            if (p1_fb == true) {
              ball_kinds = int(random(1, 3.8));
              if (ball_kinds == 1) {
                bpcd = 1;
              } else {
                bpcd = 3;
              }
            } else {
              bpcd = int(random(1, 2.7)); 
            }
            
            //まえにでるか、戻るか
            if (ai_d == false) {
              if (ai_dd < 30) ai_d = true;
            } else {
              if (ai_dd < 40) ai_d = false;
            }
          }
        }
      }
      
      
    }
  }
}
