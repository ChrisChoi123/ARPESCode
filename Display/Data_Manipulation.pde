void getMaxVal(double[][] twoD) {
  double output = twoD[1][1];
  for (int i = 1;i < twoD.length;i++) {
    for (int j = 1;j < twoD[i].length;j++) {
      if (twoD[i][j] > threshhold || twoD[i][j] < -1*threshhold) ;
      else if (derivative[i][j] > output) {
        output = twoD[i][j];
      }
    }
  }
  max = output;
}
void getMaxVal(double[][][] threeD) {
  double output = threeD[0][1][1];
  for (int i = 1;i < threeD.length;i++) {
    for (int j = 1;j < threeD[i].length;j++) {
      for (int k = 1;k < threeD[i][j].length;k++) {
        if (threeD[i][j][k] > threshhold || threeD[i][j][k] < -1*threshhold) ;
        else if (threeD[i][j][k] > output) {
          output = threeD[i][j][k];
        }  
      }
    }
  }
  max = output;
}
void getMinVal(double[][] twoD) {
  double output = twoD[1][1];
  for (int i = 1;i < twoD.length;i++) {
    for (int j = 1;j < twoD[i].length;j++) {
      if (twoD[i][j] > threshhold || twoD[i][j] < -1*threshhold) ;
      else if (derivative[i][j] < output) {
        output = twoD[i][j];
      }
    }
  }
  min = output;
}
void getMinVal(double[][][] threeD) {
  double output = threeD[0][1][1];
  for (int i = 1;i < threeD.length;i++) {
    for (int j = 1;j < threeD[i].length;j++) {
      for (int k = 1;k < threeD[i][j].length;k++) {
        if (threeD[i][j][k] > threshhold || threeD[i][j][k] < -1*threshhold) ;
        else if (threeD[i][j][k] < output) {
          output = threeD[i][j][k];
        }  
      }
    }
  }
  min = output;
}

/*void getMaxVal() {
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
        for (int k = 1;k < data3D[i][j].length;k++) {
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
        for (int k = 1;k < data3D[i][j].length;k++) {
          if (data3D[i][j][k] < output) {
            output = data3D[i][j][k];
          }
        }
      }
    }
  }
  min = output;  
}
*/

void normallise() {
  if (mode == 0) {
    getMaxVal(data);
    getMinVal(data);
  }
  if (mode == 1) {
    getMaxVal(derivative);
    getMinVal(derivative);
  }
  if (mode == 2) {
    getMaxVal(data3D);
    getMinVal(data3D);
  }
  if (mode == 3) {
    getMaxVal(derivative3D);
    getMinVal(derivative3D);
  }
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
        for (int k = 1;k < data3D[i][j].length;k++) {
          data3D[i][j][k] = (data3D[i][j][k]-min)/(max-min);
        }
      }
    }
  }
  else if (mode == 3){
    for (int i = 0;i < derivative3D.length;i++) {
      for (int j = 1;j < derivative3D[i].length;j++) {
        for (int k = 1;k < derivative3D[i][j].length;k++) {
          derivative3D[i][j][k] = (derivative3D[i][j][k]-min)/(max-min);
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
  if (mode < 2) {
    for (int i = step+1; i < data.length-step-1;i++) {
      for (int j = step+1; j < data[1].length-step-1;j++) {
        double gradE = (data[i][j-step]-data[i][j+step])/(data[0][j-step]-data[0][j+step]);
        double gradA = (data[i-step][j]-data[i+step][j])/(data[i-step][0]-data[i+step][0]);
        derivative[i][j] = data[i][j]/Math.sqrt((gradE*gradE+gradA*gradA));
      }
    }
  }
  else {
    for (int i = 1; i < data3D.length-2;i++) {
      for (int j = step+1; j < data3D[i][energy].length-step-1;j++) {
        double gradP = (data3D[i+1][energy][j]-data3D[i-1][energy][j])/(-2);
        double gradL = (data3D[i][energy][j-step]-data3D[i][energy][j+step])/(data3D[i][0][j-step]-data3D[i][0][j+step]);
        derivative3D[i][energy][j] = data3D[i][energy][j]/Math.sqrt((gradP*gradP+gradL*gradL));
      }
    }
  }
}
