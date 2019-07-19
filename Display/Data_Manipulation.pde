void getMaxVal() {
  double output =0;
  if (mode == 0) {
    output = data[1][1];
    for (int i = 1;i < data.length;i++) {
      for (int j = 1;j < data[i].length;j++) {
        if (data[i][j] > output) {
          output = data[i][j];
        }
      }
    }
  }
  else if (mode == 1) {
    output = derivative[1][1];
    for (int i = 1;i < derivative.length;i++) {
      for (int j = 1;j < derivative[i].length;j++) {
        if (derivative[i][j] > threshhold || derivative[i][j] < -1*threshhold) {
          
        }
        else if (derivative[i][j] > output) {
          output = derivative[i][j];
        }
      }
    }
  }
  else if (mode == 2){
    output = data3D[0][1][1];
    for (int i = 0;i < data3D.length;i++) {
      for (int j = 1;j < data3D[i].length;j++) {
        for (int k = 1;j < data3D[i][j].length;j++) {
          if (data3D[i][j][k] > output) {
            output = data3D[i][j][k];
          }
        }
      }
    }
  }
  max = output;  
}
void getMinVal() {
  double output = 0;
  if (mode == 0) {
    output = data[1][1];
    for (int i = 1;i < data.length;i++) {
      for (int j = 1;j < data[i].length;j++) {
        if (data[i][j] < output) {
          output = data[i][j];
        }
      }
    }
  }
  else if (mode == 1) {
    output = derivative[1][1];
    for (int i = 1;i < derivative.length;i++) {
      for (int j = 1;j < derivative[i].length;j++) {
        if (derivative[i][j] > threshhold || derivative[i][j] < -1*threshhold) {
          
        }
        else if (derivative[i][j] < output) {
          output = derivative[i][j];
        }
      }
    }
  }
  else if (mode == 2){
    output = data3D[0][1][1];
    for (int i = 0;i < data3D.length;i++) {
      for (int j = 1;j < data3D[i].length;j++) {
        for (int k = 1;j < data3D[i][j].length;j++) {
          if (data3D[i][j][k] < output) {
            output = data3D[i][j][k];
          }
        }
      }
    }
  }
  min = output;  
}

void normallise() {
  getMaxVal();
  getMinVal();
  if (mode == 0) {
    for (int i = 1;i < data.length;i++) {
      for (int j = 1;j < data[i].length;j++) {
        data[i][j] = (data[i][j]-min)/(max-min);
      }
    }
  }
  else if (mode == 1) {
    for (int i = 1;i < derivative.length;i++) {
      for (int j = 1;j < derivative[i].length;j++) {
        derivative[i][j] = (derivative[i][j]-min)/(max-min);
      }
    }
  }
  else if (mode == 2){
    for (int i = 0;i < data3D.length;i++) {
      for (int j = 1;j < data3D[i].length;j++) {
        for (int k = 1;j < data3D[i][j].length;j++) {
          data3D[i][j][k] = (data3D[i][j][k]-min)/(max-min);
        }
      }
    }
  }
}

void findAvg() {
  double total = 0;
  int amount = 0;
  if (mode == 0) {
    for (int i = 1;i < data.length;i++) {
      for (int j = 1;j < data[i].length;j++) {
        total += data[i][j];
        amount++;
      }
    }
  }
  else if (mode == 1){
    for (int i = 1;i < derivative.length;i++) {
      for (int j = 1;j < derivative[i].length;j++) {
        total += derivative[i][j];
        amount++;
      }
    }
  }
  else if (mode == 2){
    for (int i = 0;i < data3D.length;i++) {
      for (int j = 1;j < data3D[i].length;j++) {
        for (int k = 1;j < data3D[i][j].length;j++) {
          total += data3D[i][j][k];
          amount++;
        }
      }
    }
  }
  avg = total/amount; 
}

void removeBackground() {
  findAvg();
  if (mode == 0) {
    for (int i = 1;i < data.length;i++) {
      for (int j = 1;j < data[i].length;j++) {
        data[i][j] = data[i][j] - avg;
        if (data[i][j] < 0) {
          data[i][j] = 0;
        }
      }
    }
  }
  else {
    for (int i = 1;i < derivative.length;i++) {
      for (int j = 1;j < derivative[i].length;j++) {
        derivative[i][j] = derivative[i][j]-avg;
        if (derivative[i][j] < 0) {
          derivative[i][j] = 0;
        }
      }
    }
  }
}

void differentiate2(int step) {
  for (int i = 1;i < data.length;i++) {
    for (int j = 1;j < data[i].length;j++) {
      if (j < step || j > data[i].length-(step+1)) {
        derivative[i][j] = 0;
      }
      else {
        derivative[i][j] = (2*data[i][j]-data[i][j-step]-data[i][j+step]);
      }
    }
  }
}

void differentiate1(int step) {
  for (int i = 1;i < data.length;i++) {
    for (int j = 1;j < data[i].length;j++) {
      if (j < step) {
        derivative[i][j] = 0;
      }
      else {
        derivative[i][j] = (data[i][j]-data[i][j-step]);
      }
    }
  }
}

void alterData() {
  if (mode == 0) {
    for (int i = 1;i < data.length;i++) {
      for (int j = 1;j < data[i].length;j++) {
        data[i][j] *= normRatio;
      }
    }
  }
  else {
    for (int i = 1;i < derivative.length;i++) {
      for (int j = 1;j < derivative[i].length;j++) {
        derivative[i][j] *= normRatio;
      }
    }
  }
}

void minGrad(int step) {
  for (int i = step+1; i < data.length-step-1;i++) {
    for (int j = step+1; j < data[1].length-step-1;j++) {
      double gradE = (data[i][j-step]-data[i][j+step])/(data[0][j-step]-data[0][j+step]);
      double gradA = (data[i-step][j]-data[i+step][j])/(data[i-step][0]-data[i+step][0]);
      derivative[i][j] = data[i][j]/Math.sqrt((gradE*gradE+gradA*gradA));
    }
  }
}
