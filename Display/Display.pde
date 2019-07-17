import java.util.*;
import java.io.*;

double[][] data;
double[][] derivative;
double max;
double min;
String fileName = "cro_005.txt";

void loadData(String filename) throws FileNotFoundException {
  String[] vals = loadStrings(filename);
  data = new double[vals.length][801];
  derivative = new double[vals.length][801];
  for (int i = 0;i < vals.length;i++){
    String[] nums = vals[i].split("\t");
    if (nums.length > 1) {
      for (int j = 0;j < nums.length;j++) {
        if (i == 0 && j == 0) {
          j++;
        }
        data[i][j] = Double.parseDouble(nums[j]);
      }
    }
  }
}

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

void graph(int mode) {
  if (mode == 0) {
    for (int i = 1;i < data.length;i++) {
      for (int j = 1;j < data[i].length;j++) {
        if (data[i][j] > .5) {
          fill(255,(int)(255*(data[i][j]-.5)*2),0);
          rect(65+i/3,330-j/3,1,1);
        }
        else {
          fill((int)(255*(data[i][j]*2)),0,0);
          rect(65+i/3,330-j/3,1,1);
        }
      }
    }
  }
  else {
    for (int i = 1;i < derivative.length;i++) {
      for (int j = 1;j < derivative[i].length;j++) {
        if (derivative[i][j] > .5) {
          fill(255,(int)(255*(derivative[i][j]-.5)*2),0);
          rect(65+i/3,330-j/3,1,1);
        }
        else {
          fill((int)(255*(derivative[i][j]*2)),0,0);
          rect(65+i/3,330-j/3,1,1);
        }
      }
    }
  }
}

void labelAxes() {
  stroke(0);
  textSize(13);
  int a = 15;
  for (int i = data[0].length-1;i > 0;i--) {
    if (data[0][i] > a && data[0][i-1] < a) {
      line(63,330-i/3,53,330-i/3);
      if (a >= 10 || (a < 0 && a > -10)) text(""+a,33,330-i/3+5);
      else if (a < 10 && a >= 0) text(""+a,41,330-i/3+5);
      else if (a <= -10) text(""+a,23,330-i/3+5);
      a-= 5;
    }
  }
  text("deg",5,200);
  double e = -1.2;
  for (int i = 1;i < data.length-1;i++) {
    if (data[i][0] < e && data[i+1][0] > e) {
      line(63+i/3,333,63+i/3,341);
      if ((""+e).substring(0,4).equals("-2.9")) text("0.0",63+i/3-8,355);
      else if ((""+e).substring(0,3).equals("0.1")) text("0.2",63+i/3-8,355);
      else if (e < 0) text((""+e).substring(0,4),63+i/3-15,355);
      e += .2;
    }
  }
  text("Binding Energy (eV)",180,385);
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
        derivative[i][j] = -(data[i][j]-data[i][j-step]);
      }
    }
  }
}

void setup() {
  size(435,400); //520,280
  try{
    loadData(fileName);
  }
  catch(FileNotFoundException e){
    System.out.println("Invalid text file");
  }
  differentiate2(25);
  normallise(1);
  background(255);
  noStroke();
  graph(1);
  noFill();
  stroke(0);
  rect(63,329-data[0].length/3,data.length/3+4,data[0].length/3+3);
  textSize(14);
  fill(0);
  text("root:"+fileName+": "+(data.length-1)+" x "+ (data[1].length-1)+ " (no change)",110,42);
  labelAxes();
}

void draw() {
}
