class SecondApplet extends PApplet {
  public void settings() {
    size(displayWidth/2, displayHeight, P3D);
  }

  public void setup() {
    
    surface.setLocation(displayWidth/2, 0); //スクリーン上の右上に位置付ける
    noCursor();
    noStroke();
    p2x = 50;
    p2y = height/2 - 60;
    p2z = -1000;
    
    rectMode(CENTER);
    imageMode(CENTER);
  }

  public void draw() {
    background(scr, scg, scb);
    
    if (scene == "title") {
      title_scene_2();
    } else if (scene == "select" || scene == "select2") {
      select_2();
    } else if (scene == "audience") {
      audience_2();
    } else if (scene == "game") {
      game_2();
    } else if (scene == "winner") {
      winner_2();
    }
  }
  
  void game_2() {
    ambientLight(150, 150, 150);
    lightSpecular(255, 255, 255);
    directionalLight(30, 30, 30, 0, 1, 0);
    step2();
    coat_2();
    ball_2();
    player2_draw();
    
    noLights();
    smash2();
    bord2();
    final_draw2();
    draw_2d2();
  }
  
  void winner_2() {
    ambientLight(150, 150, 150);
    lightSpecular(255, 255, 255);
    directionalLight(30, 30, 30, 0, 1, 0);
    coat_2();
    player2_draw();
    
    noLights();
    final_draw2();
    win2();
  }
  
  void audience_2() {
    ambientLight(150, 150, 150); 
    lightSpecular(255, 255, 255);
    directionalLight(30, 30, 30, 0, 1, 0); //影
    coat_2();
    
    noLights();
    aud_2();
  }
  
  void title_scene_2() {
    camera(width/2, height/2, 780, width/2, height/2, 0, 0, 1, 0);
    
    noLights();
    image(title, 0, height/2, width * 2, height);
    
    push();
    tint(255, logo_t);
    image(logo, 900 - width, height/3 * 2, logo_s, logo_s * 0.43);
    pop();
    logo_s -= 40;
    logo_s = constrain(logo_s, 1000, 3000);
    logo_t += 3;
    logo_t = constrain(logo_t, 0, 255);
    
    image(cursor, cux - width, cuy, 100, 130);
  }
  
  void player2_draw() {
    
    p2lhY = p2rhY;
    p2hrt = -radians((p2rhY + 10) * 1.5);
    
    //影
    push();
    translate(p2x, height/2 - 3, p2z);
    fill(0, 150);
    rotateX(PI/2);
    circle(0, 0, p2y/5);
    pop();
    
    //胴体
    push();
    translate(p2x, p2y, p2z);
    rotateY(-radians(p2r));
    rotateZ(p2rZ);
    push();
    translate(0, 30, 85);
    shape(p2t);
    pop();
    
    if (r_s2 == true) {
      r_s2();
    } else if (s_s2 == true) {
      s_s2();
    }
    
    //右手
    push();
    fill(255, 200, 100);
    translate(p2rhX, p2rhY, p2rhZ);
    rotateX(p2hrt);
    sphere(15);
    pop();
    
    //左手
    push();
    fill(255, 200, 100);
    translate(p2lhX, p2lhY, p2lhZ);
    rotateX(-p2hrt);
    sphere(15);
    if (scene == "game" && step == "serve" && s_r == false && server == false) { //サーブの球
      translate(0, -20, 0);
      fill(255);
      sphere(r);
    }
    pop();
    
    //頭
    push();
    fill(255, 200, 100);
    translate(p2hX, -60, p2hZ);
    sphere(30);
    pop();

    pop();
    
    //player1
    //影
    push();
    translate(p1x, height/2 - 3, p1z);
    fill(0, 150);
    rotateX(PI/2);
    circle(0, 0, p1y/5);
    pop();
    
    push();
    //胴体
    translate(p1x, p1y, p1z);
    rotateY(-radians(p1r));
    rotateZ(p1rZ);
    push();
    translate(0, 30, 85);
    shape(p1t);
    pop();
    
    //ラケットと手
    push();
    fill(255, 200, 100);
    translate(prhX, prhY, prhZ);
    rotateX(phrt);
    sphere(15);
    pop();
    
    //左手
    push();
    fill(255, 200, 100);
    translate(plhX, plhY, plhZ);
    rotateX(-phrt);
    sphere(15);
    push();
    if (scene == "game" && step == "serve" && s_r == false && server == true) {
      translate(0, -20, 0);
      fill(255);
      sphere(r);
    }
    pop();
    pop();
    
    push();
    if (scene == "game" && step == "serve" && s_r == true && server == true) {
      translate(plhX, prhY * 3 - prhY - 20, plhZ);
      fill(255);
      sphere(r);
    }
    pop();
    
    //頭
    push();
    fill(255, 200, 100);
    translate(phX, -60, phZ);
    sphere(30);
    pop();
    
    pop();
    
    if (scene == "winner" && winner == true) {
      p2y = height/2 - 60;
    } else{
      p2y += 2 * cos(p2ym);
      p2ym += PI/20;
      if (p2ym == PI) {
        p2ym = 0;
      }
    }
  }
    
  void s_s2() {
    p2y = height/2 - 60;
    p2rZ = 0;
    s_sm2 += PI/12;
    p2r = 90;
    
    if (vret == true) {
      v_t.play();
      vret = false;
    }
    
    if (s_sm2 > PI * 6) {
      v_t.pause();
      v_t.rewind();
      p2rhY = -10;
      s_sm2 = PI;
      s_r = false;
      s_s2 = false;
      if (ws == false) {
        bords.rewind();
        bords.play();
        bord_m = 0;
        bord = 5;
        AIP.ai_ss = true;
        score(true);
      } else {
        bords.rewind();
        bords.play();
        bord_m = 0;
        bord = 4;
        AIP.ai_ss = true;
        ws = false;
      }
    } else {
      p2rhY -= 4 * cos(s_sm2 / 7);
      push();
      translate(p2lhX, p2rhY * 3 - 20, p2lhZ);
      fill(255);
      sphere(r);
      pop();
      s_r = true;
    
      if (ssd == true || ssc == true) {
        v_t.pause();
        v_t.rewind();
        s_s2 = false;
        s_sm2 = PI;
        bzc = 0;
        if (ssd == true) {
          bpc = 10;
          cut = false;
          ssd = false;
        } else if (ssc == true) {
          bpc = 170;
          cut = true;
          ssc = false;
        }
        x = p2x;
        y = height/2 - 300;
        z = p2z;
        if (-68.5 > p2rhY) {
          hits2.rewind();
          hits2.play();
          bb = 2;
          bs = 60;
          byr = -180;
        } else {
          bs = 45;
          byr = -175;
        }
        p2rhY = -10;
        if (s_p == true) {
          bzr = 0.42 * PI;
          bzcd = true;
        } else {
          bzr = 0.58 * PI;
          bzcd = false;
        }
        vy = bs * sin(radians(byr)) - gs * 0.2;
        for (int i = 0; i < 50; i++) {
          hit.add(new HIT(5));
        }
        
        AIP.ai_ss = true;
        v_h.rewind();
        v_h.play();
        hits.rewind();
        hits.play();
        step = "game";
      }
    }
  }
    
  void coat_2() {
    
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
  
  void ball_2() { //ボールの、描画だけ(計算は"ball"で行う)
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
    
    for (int i = 0; i < ball_c.size(); i++) {
    
      float l = ball_c.get(i).blife;
      
      push();
  
      colorMode(HSB, 360, 100, 100);
      noStroke();
      
      noLights();
      fill(
        map(l, 1, 0, bpc + 30, bpc),
        map(l, 1, 0, 100, 255),
        100,
        map(l, 1, 0, 255, 200)
      );
      translate(ball_c.get(i).bx, ball_c.get(i).by, ball_c.get(i).bz);
      sphere(ball_c.get(i).bpr);
      pop();
      
      //光を元に戻す
      ambientLight(150, 150, 150);
      lightSpecular(255, 255, 255);
      directionalLight(30, 30, 30, 0, 1, 0);
    }
    
    for (int i = 0; i < hit.size(); i++) {
      push();
      translate(hit.get(i).rx, hit.get(i).ry, hit.get(i).rz);
      rotateX(hit.get(i).xr);
      rotateY(hit.get(i).yr);
      rotateZ(hit.get(i).zr);
      
      float l = hit.get(i).rlife;
      
      colorMode(HSB, 360, 100, 100);
      
      strokeWeight(5);
      stroke(
        map(l, 1, 0, bpc + 30, bpc),
        map(l, 1, 0, 100, 255),
        100,
        map(l, 1, 0, 255, 200)
      );
      line(hit.get(i).rp, hit.get(i).rp, hit.get(i).rp + l * 20, hit.get(i).rp + l * 20);
      
      hit.get(i).rp += hit.get(i).rs;
      hit.get(i).rlife -= 0.02;
      
      pop();
    }
  }
  
  void final_draw2() {
    
    //player1のラケット
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
    
    //ネット (最後じゃないと透けない)
    push();
    translate(width/2, height/2 - 50, 0);
    noStroke();
    fill(100, 100);
    rect(0, 0, 1230, 100);
    pop();
    
    //ラケット (ネットの後じゃないと透けない)
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
        } else if (vz > 0 || z > 0 || x < p2x + 10) {
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
        } else if (vz <= 0 && z < 0 && x > p2x + 10) {
          image(r_f9s, 0, 0, 50, 100);
        }
      pop();
    pop();
  }
  
  void select_2() {
    noLights();
    image(sbg, 0, height/2, width * 2, height);
    
    push();
    tint(255, 120);
    image(sbg2, width - sbgm - 54, height/2, height * 1.77, height);
    pop();
    
    image(okb, 570, 100, 250, 250);
    
    if (scene == "select") {
      r_select_2();
    } else if (scene == "select2") {
        r_select_22();
    }
  }
  
  void r_select_2() {
    image(p2rb, 610, 450, 200, 200);
    image(p2lb, 100, 450, 200, 200);
    
    gc = constrain(gc, 1, 4);
    
    if (f_g_d == true) {
      image(fgw, 0, 150, 775, 200);
    }
    
    if (gc == 1) {
      image(snm1, width/2, 450, 400, 400);
    } else if (gc == 2) {
      image(snm3, width/2, 450, 400, 400);
    } else if (gc == 3) {
      image(snm5, width/2, 450, 400, 400);
    } else if (gc == 4) {
      image(snm7, width/2, 450, 400, 400);
    }
    
    image(gmw, width/2, 750, 775, 200);
  }

  void r_select_22() {
    image(p1rb, 610, 450, 200, 200);
    
    if (cd == 1) {
      image(st1, 0, 450, 900, 900);
    } else if (cd == 2) {
      image(st2, 0, 450, 900, 900);
    } else if (cd == 3) {
      image(st3, 0, 450, 900, 900);
    } else if (cd == 4) {
      image(st4, 0, 450, 900, 900);
    } else if (cd == 5) {
      image(st5, 0, 450, 900, 900);
    } else if (cd == 6) {
      image(st6, 0, 450, 900, 900);
    } else if (cd == 7) {
      image(st7, 0, 450, 900, 900);
    } else if (cd == 8) {
      image(st8, 0, 450, 900, 900);
    }
  }
  
  void smash2() {
    if (smash_b == true) {
      if (vz > 0) {
        push();
        translate(sx, height/2 - 2, 800);
        rotateX(PI/2);
        rotateZ(smpr);
        image(sm_p, 0, 0);
        pop();
      } else if (vz < 0) {
        push();
        translate(sx, height/2 - 2, -800);
        rotateX(PI/2);
        rotateZ(smpr);
        image(sm_p, 0, 0);
        pop();
      }
    }
  }
  
  void keyPressed() {
    if (step != "count") {
      if (key == 'd') p1_right = true;
      if (key == 'a') p1_left = true;
      
      if (step != "serve" || server != true) {
        if (key == 'w') p1_up = true;
        if (key == 's') p1_down = true;
      } else {
        if (key == 'w') {
          p1r = -90;
          s_s = true;
          vret = true;
        }
      }
      
      if (ai == false) {
        if (key == 'l') p2_right = true;
        if (key == 'j') p2_left = true;
        
        if (step != "serve" || server != false) {
          if (key == 'i') p2_up = true;
          if (key == 'k') p2_down = true;
        } else {
          if (key == 'i') {
            p2r = 90;
            s_s2 = true;
            vret = true;
          }
        }
      }
      
      if (s_s == true || s_s2 == true) {
        if (server == true) {
          if (key == 'e') ssd = true;
          if (key == 'r') ssc = true;
        } else {
          if (ai == false) {
            if (key == 'o') ssd = true;
            if (key == 'p') ssc = true;
          }
        }
      }
      
      if (step != "serve" || server != true) {
        if (key == 'e' || key == 'r' || key == 't') {
          p1r = -90;
          prhY = -10;
          r_s = true;
        }
      }
      if (z > 0) {
        if (key == 'e') bpcd = 1;
        if (key == 'r') bpcd = 2;
        if (key == 't') bpcd = 3;
      }
      
      if (step != "serve" || server != false) {
        if (ai == false) {
          if (key == 'o' || key == 'p' || key == '@') {
            p2r = 90;
            p2rhY = -10;
            r_s2 = true;
          }
        }
      }
      if (z < 0) {
        if (ai == false) {
          if (key == 'o') bpcd = 1;
          if (key == 'p') bpcd = 2;
          if (key == '@') bpcd = 3;
        }
      }
    }
    if (keyCode == UP) cuup = true;
    if (keyCode == DOWN) cudown = true;
    if (keyCode == ENTER) ent = true;
    if (keyCode == BACKSPACE) bsp = true;
    
    if (scene == "select" || scene == "select2") {
      if (key == 'a') a = true;
      if (key == 'd') d = true;
      if (key == 'j') j = true;
      if (key == 'l') l = true;
      if (key == 'f') f = true;
    }
  }
  
  void keyReleased() {
    if (key == 'd') p1_right = false;
    if (key == 'a') p1_left = false;
    if (key == 'w') p1_up = false;
    if (key == 's') p1_down = false;
    
    if (key == 'l') p2_right = false;
    if (key == 'j') p2_left = false;
    if (key == 'i') p2_up = false;
    if (key == 'k') p2_down = false;
    if (keyCode == UP) cuup = false;
    if (keyCode == DOWN) cudown = false;
    if (keyCode == ENTER) ent = false;
    if (keyCode == BACKSPACE) bsp = false;
    
    if (scene == "select" || scene == "select2") {
      if (key == 'a') a = false;
      if (key == 'd') d = false;
      if (key == 'j') j = false;
      if (key == 'l') l = false;
      if (key == 'f') f = false;
    }
  }

  void step2() {
    if (step == "serve") {
      serve_step2();
    } else if (step == "game") {
      game_step2();
    } else if (step == "count") {
      count_step2();
    }
  }

  void serve_step2() {
    
    if (server == false) {
      p2z = constrain(p2z, -1200, -1200);
      if (s_p == true) {
        camera(p2x - 50, height/2 - 200, p2z - 400, p2x + 548, height/2 - 50, 1188, 0, 1, 0);
        p2x = constrain(p2x, width/2 - 400, width/2 - 50);
      } else {
        camera(p2x + 50, height/2 - 200, p2z - 400, p2x - 548, height/2 - 50, 1188, 0, 1, 0);
        p2x = constrain(p2x, width/2 + 50, width/2 + 400);
      }
    } else {
      camera(width/2 + (p2x - width/2) * 0.7, -height/8 + p2z * 0.1, -1400 + p2z * 0.5, width/2 + (p2x - width/2) * 0.7, height + p2z * 0.1, 1000 + p2z * 0.5, 0, 1, 0);
    }
  }
  
  void game_step2() {
    if (cameraZ2 < 1600 && server == false) {
      cameraY2 += 17;
      cameraZ2 += 20;
      cameraX2 -= 6;
      if (s_p == true) {
        camera(p2x - cameraX2, height/2 - cameraY2, p2z * 0.5 - cameraZ2, p2x + cameraX2 + 200, height/2, 1000 - p2z * 0.5, 0, 1, 0);
      } else {
        camera(p2x + cameraX2, height/2 - cameraY2, p2z * 0.5 - cameraZ2, p2x - cameraX2 - 200, height/2, 1000 - p2z * 0.5, 0, 1, 0);
      }
    } else {
      camera(width/2 + (p2x - width/2) * 0.7, -height/8 + p2z * 0.1, -1400 + p2z * 0.5, width/2 + (p2x - width/2) * 0.7, height + p2z * 0.1, 1000 + p2z * 0.5, 0, 1, 0);
    }
  }
  
  void count_step2() {
    if (t_count == 60) {
      score_s2();
    }
  }

  void bord2() {
    push();
    translate(width/2, 230, 2494);
    rotateY(PI);
    switch(bord) {
      case 1:
        image(s_b1, 0, 0, 1550, bord_m);
        break;
        
      case 2:
        image(s_b2, 0, 0, 1550, bord_m);
        break;
        
      case 3:
        image(out_b, 0, 0, 1550, bord_m);
        break;
        
      case 4:
        image(f_b, 0, 0, 1550, bord_m);
        break;
        
      case 5:
        image(df_b, 0, 0, 1550, bord_m);
        break;
        
      case 6:
        image(b2_b, 0, 0, 1550, bord_m);
        break;
        
      case 7:
        image(d_b, 0, 0, 1550, bord_m);
        break;
    }
    pop();
  }

  void score_s2() {
    push();
      noLights();
      translate(0, -height * 10);
      camera(width/2, height/2, 780, width/2, height/2, 0, 0, 1, 0);
      if (score_f2 < 10) {
        score_f2 += 0.15;
        scoreY2 = pow(score_f2, 3) + 450;
      }
      if (game_s == true) {
        if (p_get == true) {
          scoreY2 = -scoreY2 + 900;
        }
        push();
          translate(width/2, scoreY2);
          image(p2_ss, 0, 0, 775 * score_e2, 200 * score_e2);
          
          if (p2_game == 0) {
            image(snm0, -200, 0, 200 * score_e2, 200 * score_e2);
          } else if (p2_game == 1) {
            image(snm1, -200, 0, 200 * score_e2, 200 * score_e2);
          } else if (p2_game == 2) {
            image(snm2, -200, 0, 200 * score_e2, 200 * score_e2);
          } else if (p2_game == 3) {
            image(snm3, -200, 0, 200 * score_e2, 200 * score_e2);
          } else if (p2_game == 4) {
            image(snm4, -200, 0, 200 * score_e2, 200 * score_e2);
          }
        pop();
        
      } else {
        if (deuces == true) {
          translate(0, scoreY);
          image(deucess, 0, 0, 1550, 200);
        } else {
          if (p_get == true) {
            scoreY2 = -scoreY2 + 900;
          }
          translate(width/2, scoreY2);
          image(p2_ss, 0, 0, 775 * score_e2, 200 * score_e2);
        
          if (score[1][game_c - 1] > sc && adv == false) {
            image(sadv, -100, 0, 320 * score_e2, 180 * score_e2);
          } else if (score[1][game_c - 1] == 0) {
            image(snm0, -200, 0, 200 * score_e2, 200 * score_e2);
          } else if (score[1][game_c - 1] == 1) {
            image(snm1, -200, 0, 200 * score_e2, 200 * score_e2);
          } else if (score[1][game_c - 1] == 2) {
            image(snm2, -200, 0, 200 * score_e2, 200 * score_e2);
          } else if (score[1][game_c - 1] == 3) {
            image(snm3, -200, 0, 200 * score_e2, 200 * score_e2);
          } else if (score[1][game_c - 1] == 4) {
            image(snm4, -200, 0, 200 * score_e2, 200 * score_e2);
          } else if (score[1][game_c - 1] == 5) {
            image(snm5, -200, 0, 200 * score_e2, 200 * score_e2);
          } else if (score[1][game_c - 1] == 6) {
            image(snm6, -200, 0, 200 * score_e2, 200 * score_e2);
          } else if (score[1][game_c - 1] == 7) {
            image(snm7, -200, 0, 200 * score_e2, 200 * score_e2);
          } 
        }
      }
      ambientLight(150, 150, 150); 
      lightSpecular(255, 255, 255);
      directionalLight(30, 30, 30, 0, 1, 0);
    pop();
  }
  
  void win2() {
    p2_v += PI/1000;
    push();
    translate(p1x, p1z);
    p2cx = cos(p2_v);
    p2cz = sin(p2_v);
    pop();
    
    if (winner == false) {
      camera(500 * p2cx, 300, 500 * p2cz, p2x, 400, p2z, 0, 1, 0);
      push();
        camera(width/2, height/2, 780, width/2, height/2, 0, 0, 1, 0);
        if (p2_game == 0) {
          image(snm0, width/2, 300, 200, 200);
        } else if (p2_game == 1) {
          image(snm1, width/2, 300, 200, 200);
        } else if (p2_game == 2) {
          image(snm2, width/2, 300, 200, 200);
        } else if (p2_game == 3) {
          image(snm3, width/2, 300, 200, 200);
        } else if (p2_game == 4) {
          image(snm4, width/2, 300, 200, 200);
        }
        image(winw2, width/2, 100, 775, 200);
      pop();
    } else {
      camera(500 * p2cx, 0, 500 * p2cz, p2x, 400, p2z, 0, 1, 0);
      push();
        camera(width/2, height/2, 780, width/2, height/2, 0, 0, 1, 0);
        if (p2_game == 0) {
          image(snm0, width/2, 300, 200, 200);
        } else if (p2_game == 1) {
          image(snm1, width/2, 300, 200, 200);
        } else if (p2_game == 2) {
          image(snm2, width/2, 300, 200, 200);
        } else if (p2_game == 3) {
          image(snm3, width/2, 300, 200, 200);
        } else if (p2_game == 4) {
          image(snm4, width/2, 300, 200, 200);
        }
        image(losew2, width/2, 100, 775, 200);
      pop();
    }
  }
  
  void draw_2d2() {
    push();
      noLights();
      camera(width/2, height/2, 780, width/2, height/2, 0, 0, 1, 0);
      
      if (gcw == true) {
        push();
          translate(-width, 200);
          image(gamecs, scoreY * 2 - 180, 0, 744, 192);
        pop();
      }
      
      if (fw == true) {
        push();
          image(fgw, 0, fgm, 930, 240);
        pop();
      }
      
      if (fw == false) {
        if (cw == true) {
          if (game_c > 0) {
            if (f_game == true) { 
              if ((score[1][game_c - 1] + score[0][game_c - 1]) % 2 == 0) {
                if (ccd == true) {
                  image(cszw, 0, fgm, 930, 240);
                } else {
                  image(csvw, 0, fgm, 930, 240);
                }
              }
            } else {
              if ((game_c - 1) % 2 == 0) {
                image(csvw, 0, fgm, 930, 240);
              } else {
                image(cszw, 0, fgm, 930, 240);
              }
            }
          }
        }
      }
      
      if (step == "game") {
        if (ai) {
          push();
            strokeWeight(10);
            strokeJoin(ROUND);
            
            if (p2_up == true) {
              stroke(124,252,0);
              fill(124,252,0, 100);
            } else {
              stroke(100);
              fill(100, 100);
            }
            rect(370, 100, 70, 70);
            
            if (p2_left == true) {
              stroke(124,252,0);
              fill(124,252,0, 100);
            } else {
              stroke(100);
              fill(100, 100);
            }
            rect(300, 185, 70, 70);
            
            if (p2_down == true) {
              stroke(124,252,0);
              fill(124,252,0, 100);
            } else {
              stroke(100);
              fill(100, 100);
            }
            rect(385, 185, 70, 70);
            
            if (p2_right == true) {
              stroke(124,252,0);
              fill(124,252,0, 100);
            } else {
              stroke(100);
              fill(100, 100);
            }
            rect(470, 185, 70, 70);
            
            if (r_s2 == true && bpcd == 1) {
              stroke(255,69,0);
              fill(255,69,0, 100);
            } else {
              stroke(100);
              fill(100, 100);
            }
            rect(455, 100, 70, 70);
            
            if (r_s2 == true && bpcd == 2) {
              stroke(0,191,255);
              fill(0,191,255, 100);
            } else {
              stroke(100);
              fill(100, 100);
            }
            rect(540, 100, 70, 70);
            
            if (r_s2 == true && bpcd == 3) {
              stroke(255,255,0);
              fill(255,255,0, 100);
            } else {
              stroke(100);
              fill(100, 100);
            }
            rect(625, 100, 70, 70);
            
          pop();
        }
      }
    pop();
  }
  
  void aud_2() {
    camera(-500, -1000, 1500, 1000, -1000, cmm, 0, 1, 0);
    
    push();
      camera(width/2, height/2, 780, width/2, height/2, 0, 0, 1, 0);
      image(gmw, 100, wgm, 930, 240);
    pop();
  }
}
