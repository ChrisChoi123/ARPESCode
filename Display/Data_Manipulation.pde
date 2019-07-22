void getMaxVal(double[][] twoD) {
  double output = twoD[1][1];
  for (int i = 1;i < twoD.length;i++) {
    for (int j = 1;j < twoD[i].length;j++) {
      if (twoD[i][j] > threshhold || twoD[i][j] < -1*threshhold) ;
      else if (twoD[i][j] > output) {
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
      else if (twoD[i][j] < output) {
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

void normallise() {
  /*if (mode == 0 || mode == 1) {
    getMaxVal(data);
    getMinVal(data);
  }
  if (mode == 1) {
    getMaxVal(derivative);
    getMinVal(derivative);
  }*/
  if (mode == 2 || mode == 0) {
    getMaxVal(data3D);
    getMinVal(data3D);
  }
  if (mode == 3 || mode == 1) {
    getMaxVal(derivative3D);
    getMinVal(derivative3D);
  }
  /*if (mode == 0) {
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
  }*/
  if (mode == 2 || mode == 0){
    for (int i = 0;i < data3D.length;i++) {
      for (int j = 1;j < data3D[i].length;j++) {
        for (int k = 1;k < data3D[i][j].length;k++) {
          data3D[i][j][k] = (data3D[i][j][k]-min)/(max-min);
        }
      }
    }
  }
  else if (mode == 3 || mode == 1){
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

void differentiate2() {
  if (mode < 2) {    
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
  else {
   for (int e = 1;e < data3D[0].length;e++) {    
    for (int i = 0; i < data3D.length-1;i++) {
      for (int j = step+1; j < data3D[i][e].length-step-1;j++) {
        derivative3D[i][e][j] = (2*data3D[i][e][j] - data3D[i][e][j-step] - data3D[i][e][j+step]); 
      }
    }
   }
  }
}

void differentiate1() {
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
  else if (mode == 1){
    for (int i = 1;i < derivative.length;i++) {
      for (int j = 1;j < derivative[i].length;j++) {
        derivative[i][j] *= normRatio;
      }
    }
  }
}

void minGrad() {
  /*if (mode < 2) {
    for (int i = step+1; i < data.length-step-1;i++) {
      for (int j = step+1; j < data[1].length-step-1;j++) {
        double gradE = (data[i][j-step]-data[i][j+step])/(data[0][j-step]-data[0][j+step]);
        double gradA = (data[i-step][j]-data[i+step][j])/(data[i-step][0]-data[i+step][0]);
        derivative[i][j] = data[i][j]/Math.sqrt((gradE*gradE+gradA*gradA));
      }
    }
  }*/
  if (mode > 1) {
    for (int e = 1;e < data3D[0].length;e++) {    
      for (int i = 1; i < data3D.length-2;i++) {
        for (int j = step+1; j < data3D[i][e].length-step-1;j++) {
          double gradP = (data3D[i+1][e][j]-data3D[i-1][e][j])/(-2);
          double gradL = (data3D[i][e][j-step]-data3D[i][e][j+step])/(data3D[i][0][j-step]-data3D[i][0][j+step]);
          derivative3D[i][e][j] = data3D[i][e][j]/Math.sqrt((gradP*gradP+gradL*gradL));
        }
      }
    }
  }
  else {
    for (int i = 1;i < data3D.length-1;i++) {    
      for (int j = step+1;j < data3D[i].length-1-step;j++) {
        for (int k = step+1; k < data3D[i][j].length-step-1;k++) {
          /*double gradE = (data3D[i][j-step][k]-data3D[i][j+step][k])/(data3D[i][j-step][0]-data3D[i][j+step][0]);
          double gradA = (data3D[i][j][k-step]-data3D[i][j][k+step])/(data3D[i][0][k-step]-data3D[i][0][k+step]);
          derivative3D[i][j][k] = data3D[i][j][k]/(Math.sqrt((gradE*gradE+gradA*gradA))* (1.0/(1+Math.pow(2.718282,data3D[i][j][0]/.0194752))));*/
          double energy = Math.sqrt(data3D[i][j][0] + hv - 4.5);
          double delta1 = energy * (Math.sin(0.0174532925*data3D[i][0][k]) - Math.sin(0.0174532925*data3D[i][0][k+step]));
          double delta2 = energy * Math.cos(0.0174532925*data3D[i][0][k]) * (Math.sin(0.0174532925*(-8.0 + i * 1)) - Math.sin(0.0174532925*(-8.0 + (i + 1) * 1)));
          double sqrtdelta = Math.sqrt(delta1*delta1 + delta2 * delta2);
          derivative3D[i][j][k] = Math.pow((data3D[i][j][k] - data3D[i+1][j][k]) / delta2, 2) + Math.pow((data3D[i][j][k] - data3D[i-1][j][k]) / delta2, 2);
          derivative3D[i][j][k] += Math.pow((data3D[i][j][k] - data3D[i][j][k+step]) / delta1, 2) + Math.pow((data3D[i][j][k] - data3D[i][j][k-step]) / delta1, 2);
          derivative3D[i][j][k] += Math.pow((data3D[i][j][k] - data3D[i+1][j][k+step]) / sqrtdelta, 2) + Math.pow((data3D[i][j][k] - data3D[i-1][j][k-step]) / sqrtdelta, 2);
          derivative3D[i][j][k] += Math.pow((data3D[i][j][k] - data3D[i-1][j][k+step]) / sqrtdelta, 2) + Math.pow((data3D[i][j][k] - data3D[i+1][j][k-step]) / sqrtdelta, 2);
          derivative3D[i][j][k] = data3D[i][j][k] / ((Math.sqrt(derivative3D[i][j][k]) * (1.0/(1+Math.pow(2.718282,data3D[i][j][0]/.0194752)))) );
        }
      }
    }
  }
}
