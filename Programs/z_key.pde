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
