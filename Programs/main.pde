import ddf.minim.*;

Minim minim;

import com.jogamp.opengl.GLProfile;
{
  GLProfile.initSingleton();
}

SecondApplet sa;

void settings() {
  size(displayWidth/2, displayHeight, P3D); //3D
}

void setup() {
  String[] args = {"blah"};
  sa = new SecondApplet();
  PApplet.runSketch(args, sa); //ウィンドウを2つにするための操作
  
  surface.setLocation(0, 0); //スクリーン上の左上に位置付ける
  
  noStroke();
  noCursor();
  
  rectMode(CENTER);
  imageMode(CENTER);
  
  //ーーーーーーーーーーーーーーーーーーーーーーー画像の読み込み
  
  title = loadImage("title.png");
  title2 = loadImage("title2.png");
  logo = loadImage("soft_logo.png");
  cursor = loadImage("cursor.png");
  cursor.resize(96, 128);
  cursor2 = loadImage("cursor2.png");
  cursor2.resize(96, 128);
  tb1 = loadImage("b_vs.png");
  tb2 = loadImage("b_vs_com.png");
  tb3 = loadImage("b_t.png");
  tb4 = loadImage("b_all_r.png");
  p1bb = loadImage("b_p1_b.png");
  p2bb = loadImage("b_p2_b.png");
  p1rb = loadImage("b_p1_r.png");
  p1lb = loadImage("b_p1_l.png");
  p2rb = loadImage("b_p2_r.png");
  p2lb = loadImage("b_p2_l.png");
  p1okb = loadImage("b_p1_ok.png");
  p2okb = loadImage("b_p2_ok.png");
  okb = loadImage("b_ok.png");
  backb = loadImage("b_b.png");
  sbg = loadImage("background.png");
  sbg2 = loadImage("background2.png");
  sm_p = loadImage("smash_point.png");
  sm_p.resize(300, 300);
  
  s_b1 = loadImage("1st_serve.png");
  s_b2 = loadImage("2nd_serve.png");
  out_b = loadImage("out.png");
  f_b = loadImage("fault.png");
  df_b = loadImage("double_fault.png");
  b2_b = loadImage("2bound.png");
  d_b = loadImage("direct.png");
  sw = loadImage("server.png");
  gmw = loadImage("game_match.png");
  fgw = loadImage("final_game.png");
  cszw = loadImage("change_size.png");
  csvw = loadImage("change_service.png");
  
  st1 = loadImage("stage1.png");
  st2 = loadImage("stage2.png");
  st3 = loadImage("stage3.png");
  st4 = loadImage("stage4.png");
  st5 = loadImage("stage5.png");
  st6 = loadImage("stage6.png");
  st7 = loadImage("stage7.png");
  st8 = loadImage("stage8.png");
  
  st = loadImage("stage_t.png");
  s2t = loadImage("stage_t2.png");
  s3t = loadImage("stage_t3.png");
  
  c1 = loadImage("com_1.png");
  c2 = loadImage("com_2.png");
  c3 = loadImage("com_3.png");
  
  p1_ss = loadImage("p1_score.png");
  p2_ss = loadImage("p2_score.png");
  deucess = loadImage("deuce.png");
  gamecs = loadImage("game_count.png");
  
  snm0 = loadImage("number0.png");
  snm1 = loadImage("number1.png");
  snm2 = loadImage("number2.png");
  snm3 = loadImage("number3.png");
  snm4 = loadImage("number4.png");
  snm5 = loadImage("number5.png");
  snm6 = loadImage("number6.png");
  snm7 = loadImage("number7.png");
  sadv = loadImage("adv.png");
  
  winw = loadImage("winner.png");
  losew = loadImage("loser.png");
  winw2 = loadImage("winner2.png");
  losew2 = loadImage("loser2.png");
  
  r_f9s = loadImage("r_f-laser_9s.png");
  
  //ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
  
  //ーーーーーーーーーーーーーーーーーーーーー3Dモデルの読み込み
  
  //3Dモデル(ネット)の読み込み
  net = loadShape("tennis_net.obj");
  net.scale(10);
  net.rotateX(PI/2);
  
  //3Dモデル(スタジアム)の読み込み
  stadium = loadShape("tennis_stadium.obj");
  stadium.scale(20);
  stadium.rotateX(PI/2);
  
  //3Dモデル(観客×3)の読み込み
  audience1 = loadShape("audience_1.obj");
  audience1.scale(20);
  audience1.rotateX(PI/2);
  
  audience2 = loadShape("audience_2.obj");
  audience2.scale(20);
  audience2.rotateX(PI/2);
  
  audience3 = loadShape("audience_3.obj");
  audience3.scale(20);
  audience3.rotateX(PI/2);
  
  //3Dモデル(プレイヤーの体)の読み込み
  p1t = loadShape("tennis_p1.obj");
  p1t.scale(3);
  p1t.rotateX(PI/2);
  
  p2t = loadShape("tennis_p2.obj");
  p2t.scale(3);
  p2t.rotateX(PI/2);
  
  //ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
  
  //ーーーーーーーーーーーーーーーーーーーーーーー音楽の読み込み
  
  minim = new Minim(this);
  ba = minim.loadFile("ba.mp3");
  bpa = minim.loadFile("bpa.mp3");
  bgm1 = minim.loadFile("tennis_title.mp3");
  bgm2 = minim.loadFile("soft_select.mp3");
  bgm3 = minim.loadFile("soft_game.mp3");
  bgm4 = minim.loadFile("soft_win.mp3");
  hits = minim.loadFile("soft.mp3");
  hits2 = minim.loadFile("soft_just.mp3");
  v_h = minim.loadFile("hit_v.mp3");
  v_t = minim.loadFile("toss_v.mp3");
  rss = minim.loadFile("racket_s.mp3");
  ball_b = minim.loadFile("ball_bound.mp3");
  smps = minim.loadFile("smash_point.mp3");
  bords = minim.loadFile("bord.mp3");
  scores = minim.loadFile("score_s.mp3");
  auds = minim.loadFile("audience_s.mp3");
  sound = minim.loadFile("sound.mp3");
  
  //ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
  
  //ボールの座標
  x = width/2;
  y = 0;
  z = 1180;
  bzr = -90; //ボールの角度
  byr = 60;
  bs = 0; //ボールの速さ
  
  //プレイヤーの座標
  p1x = 700;
  p1y = height/2 - 60;
  p2z = 1000;
  
}

void draw() {
  background(scr, scg, scb);
  
  if (scene == "title") {
    title();
  } else if (scene == "select" || scene == "select2") {
    select();
  } else if (scene == "audience") {
    audience();
  } else if (scene == "game") {
    game();
  } else if (scene == "winner") {
    winner();
  }
}

void title() {
  ret1 = bgm1.isPlaying();
  if (ret1 == false) {
    bgm1.play(0);
  }
  title_scene();
}

void game() {
  ret3 = bgm3.isPlaying();
  if (ret3 == false) {
    bgm3.play(0);
  }
  ambientLight(150, 150, 150); 
  lightSpecular(255, 255, 255);
  directionalLight(30, 30, 30, 0, 1, 0); //影
  step();
  coat();
  ball();
  ball_m();
  ball_p();
  player1_move();
  player1_draw();
  player2_move();
  
  if (ai == true) {
    AIP.ai();
  }
  
  noLights(); //ここからは画像
  smash();
  bord();
  final_draw();
  draw_2d();
}

void winner() {
  ret4 = bgm4.isPlaying();
  if (ret4 == false) {
    bgm4.play(0);
  }
  ambientLight(150, 150, 150); 
  lightSpecular(255, 255, 255);
  directionalLight(30, 30, 30, 0, 1, 0); //影
  coat();
  player1_draw();
  
  noLights(); //ここからは画像
  final_draw();
  win();
}

void audience() {
  ambientLight(150, 150, 150); 
  lightSpecular(255, 255, 255);
  directionalLight(30, 30, 30, 0, 1, 0); //影
  coat();
  
  noLights();
  aud();
}
//3Dモデルの変数
PShape net;
PShape stadium;
PShape audience1, audience2, audience3;
PShape p1t, p2t;

//プレイヤー操作の変数
boolean p1_right = false;
boolean p1_left = false;
boolean p1_up = false;
boolean p1_down = false;
boolean p2_right = false;
boolean p2_left = false;
boolean p2_up = false;
boolean p2_down = false;

boolean ssd = false;
boolean ssc = false;

boolean cuup = false;
boolean cudown = false;
boolean ent = false;
boolean bsp = false;

//シーン
String scene = "title";

//
AudioPlayer ba, bpa, bgm1, bgm2, bgm3, bgm4, hits, hits2, v_h, v_t, rss, ball_b, smps, bords, scores, auds, sound;
boolean ret1, ret2, ret3, ret4;
boolean vret = false;
