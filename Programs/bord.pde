PImage s_b1, s_b2, out_b, f_b, df_b, b2_b, d_b;

int bord = 1;
float bord_m = 0;

void bord() {
  if (bord_m < 400) {
    bord_m += 20;
  }
  
  push();
  translate(width/2, 230, -2494);
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
      if (bord_m == 380) {
        bords.rewind();
        bords.play();
        bord_m = 0;
        bord = 2;
      }
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
