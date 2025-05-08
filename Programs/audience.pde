float cmm = 2000;
float wgm = 0, wgf = -10;

void aud() {
  aud_mff = PI/10;
  aud_ms = 4;
  
  camera(0, -200, cmm, -500, 0, cmm - 500, 0, 1, 0);
  
  if (cmm > 0) {
    cmm -= 8;
  } else {
    cmm = 2000;
    wgm = 0;
    wgf = -10;
    aud_mff = PI/30;
    aud_ms = 1;
    bords.rewind();
    bords.play();
    scene = "game";
  }
  push();
    camera(width/2, height/2, 780, width/2, height/2, 0, 0, 1, 0);
    
    if (wgf < 10) {
      wgf += 0.15;
      wgm = pow(wgf, 3) + 450;
    }
    
    if (gc == 1) {
      image(snm1, 250, wgm, 300, 300);
    } else if (gc == 2) {
      image(snm3, 250, wgm, 300, 300);
    } else if (gc == 3) {
      image(snm5, 250, wgm, 300, 300);
    } else if (gc == 4) {
      image(snm7, 250, wgm, 300, 300);
    }
    
    image(gmw, width + 100, wgm, 930, 240);
  pop();
}
