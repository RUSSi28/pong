int y = 260;
int i = 500;
int j = 5;
int game = 0;//ゲーム進行中

boolean bollX = false;
boolean bollY = false;
boolean stop = true;

void setup(){
  size(1000,600);
  background(150);
  
}


void draw(){
  game = 0;
  background(150);
  strokeWeight(5);
  stroke(0);
  fill(0);


//マウスによる操作  player1
  int m = constrain(mouseY,40,560);
  line(10,m - 40,10,m + 40);


//キーボードによる操作　player2
  if(keyPressed){
    if(keyCode == UP){
      y -= 10;
    }
    if(keyCode == DOWN){
      y += 10;
    }
  }
//棒が画面上から消えないためのコード
  if(y <= 0){
    y = 0;
  }
  if(y >= 520){
    y = 520;
  }
  line(990,y,990,y + 80);


//ボールを描く➡中心（i,j）半径５
  noFill();
  strokeWeight(2);
  ellipse(i,j,10,10);


//ボールの動き（跳ね返りも含める）
  //player1の動き
  if((i == 15) && ((m - 40 <= j) && (j <= m + 40))){
    bollX = true;//X軸正の向き
  }
  if((i == 15) && ((j <= m - 40) || (m + 40 <= j))){
    background(0,0,255);
    textSize(50);
    fill(255);
    text("player2 win",400,275);
    game = 2;
    noLoop();
  }
  //plater2の動き
  if((i == 985) && ((y <= j) && (j <= y + 80))){
    bollX = false;//X軸負の向き
  }
  if((i == 985) && ((j <= y) || (y + 80 <= j))){
    background(255,0,0);
    textSize(50);
    fill(255);
    text("player1 win",400,275);
    game = 1;
    noLoop();
  }

  if(j == 5){
    bollY = true;//Y軸正の向き
  }
  if(j == 595){
    bollY = false;//Y軸負の向き
  }


    if(bollX == true){
      i += 5;
    }
    if(bollX == false){
      i -= 5;
    }
    if(bollY == true){
      j += 5;
    }
    if(bollY == false){
      j -= 5;
    }

//エスケープを使うと画面が消えてしまうためaとsで、それぞれストップとスタートを表した
if(keyPressed){
  if((key == 'a') && (stop == true)){
    stop = false;
    noLoop();
  }
}


}

//rで終了したゲームを再び始める（最初は負けた方の向きに球が飛ぶようになっている）
void keyPressed(){
  if((key == 'r') && ((game == 1) || (game == 2))){
    i = 500;
    j = 5;
    boolean bollX = false;
    boolean bollY = false;
    loop();
  }
  if((key == 's') && (stop == false)){
    stop = true;
    loop();
  }
}

