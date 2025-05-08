boolean gcw = false;
boolean fw = false;
boolean cw = false;
PImage cszw, csvw;

float fgm = 0;
float fg_f = -10;

boolean ccd = true;

void draw_2d() {
  push();
    noLights();
    camera(width/2, height/2, 780, width/2, height/2, 0, 0, 1, 0);
    
    if (gcw == true) {
      push();
        translate(0, 200);
        image(gamecs, scoreY * 2 - 180, 0, 744, 192);
      pop();
    }
    
    if (fw == true) {
      push();
        image(fgw, width, fgm, 930, 240);
      pop();
      if (fg_f < 10) {
        fg_f += 0.25;
        fgm = pow(fg_f, 3) + 450;
      } else {
        fw = false;
        fgm = 0;
        fg_f = -10;
      }
    }
    
    if (fw == false) {
      if (cw == true) {
        if (game_c > 0) {
          if (f_game == true) { 
            if ((score[1][game_c - 1] + score[0][game_c - 1]) % 2 == 0) {
              if (ccd == true) {
                image(cszw, width, fgm, 930, 240);
              } else {
                image(csvw, width, fgm, 930, 240);
              }
            }
          } else {
            if ((game_c - 1) % 2 == 0) {
              image(csvw, width, fgm, 930, 240);
            } else {
              image(cszw, width, fgm, 930, 240);
            }
          }
        }
        if (fg_f < 10) {
          fg_f += 0.25;
          fgm = pow(fg_f, 3) + 450;
        } else {
          ccd = !(ccd);
          cw = false;
          fgm = 0;
          fg_f = -10;
        }
      }
    }
  pop();
}
