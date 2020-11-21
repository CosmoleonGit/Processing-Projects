int[][] lineData = {
  /*0*/{1, 1, 1, 0, 1, 1, 1},
  /*1*/{0, 0, 0, 0, 0, 1, 1},
  /*2*/{0, 1, 1, 1, 1, 1, 0},
  /*3*/{0, 0, 1, 1, 1, 1, 1},
  /*4*/{1, 0, 0, 1, 0, 1, 1},
  /*5*/{1, 0, 1, 1, 1, 0, 1},
  /*6*/{1, 1, 1, 1, 1, 0, 1},
  /*7*/{0, 0, 1, 0, 0, 1, 1},
  /*8*/{1, 1, 1, 1, 1, 1, 1},
  /*9*/{1, 0, 1, 1, 1, 1, 1}
};

String text = "0123456789";

void setup(){
  println((int)'0');
  
  size(1000, 300);
  fill(255, 50, 50);
  
  for (char c : text.toCharArray()){
    if ((int)c >= 48 && (int)c <= 57){
      drawNumber((int)c - 48);
      translate(80, 0);
    }
  }
  
  
  
}

void drawNumber(int num){
  if (lineData[num][0] == 1){
    rect(0, 10, 10, 50);
  }
  
  if (lineData[num][1] == 1){
    rect(0, 70, 10, 50);
  }
  
  if (lineData[num][2] == 1){
    rect(10, 0, 50, 10);
  }
  
  if (lineData[num][3] == 1){
    rect(10, 60, 50, 10);
  }
  
  if (lineData[num][4] == 1){
    rect(10, 120, 50, 10);
  }
  
  if (lineData[num][5] == 1){
    rect(60, 10, 10, 50);
  }
  
  if (lineData[num][6] == 1){
    rect(60, 70, 10, 50);
  }
}
