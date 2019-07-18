void getMaxVal(int mode) {
  double output;
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
  else {
    output = derivative[1][1];
    for (int i = 1;i < derivative.length;i++) {
      for (int j = 1;j < derivative[i].length;j++) {
        if (derivative[i][j] > output) {
          output = derivative[i][j];
        }
      }
    }
  }
  max = output;  
}
void getMinVal(int mode) {
  double output;
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
  else {
    output = derivative[1][1];
    for (int i = 1;i < derivative.length;i++) {
      for (int j = 1;j < derivative[i].length;j++) {
        if (derivative[i][j] < output) {
          output = derivative[i][j];
        }
      }
    }
  }
  min = output;  
}

void normallise(int mode) {
  getMaxVal(mode);
  getMinVal(mode);
  if (mode == 0) {
    for (int i = 1;i < data.length;i++) {
      for (int j = 1;j < data[i].length;j++) {
        data[i][j] = (data[i][j]-min)/(max-min);
      }
    }
  }
  else {
    for (int i = 1;i < derivative.length;i++) {
      for (int j = 1;j < derivative[i].length;j++) {
        derivative[i][j] = (derivative[i][j]-min)/(max-min);
      }
    }
  }
}

void findAvg(int mode) {
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
  else {
    for (int i = 1;i < derivative.length;i++) {
      for (int j = 1;j < derivative[i].length;j++) {
        total += derivative[i][j];
        amount++;
      }
    }
  }
  avg = total/amount; 
}

void removeBackground(int mode) {
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

void minGrad(int step) {
  
}
