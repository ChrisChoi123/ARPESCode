import java.util.*;
import java.io.*;

double[][] data;
double[][][] data3D;
double[][] derivative;
double[][][] derivative3D;
double max;
double min;
double avg;
double threshhold = 10;
int mode = 4;
int startGraph = 0;
double normRatio = 2;
int fileNum = 37; //18 or 37
int fileAmount = 30; // 33 or 30
int energy = 725; 
double hv = 82;
String fileName = "ZT50001.txt";
int step = 30;
int wid = 352; // 352 or 801
int hi = 747; // 747 or 1055

void loadData() throws FileNotFoundException {
  if (mode ==4) {
    String[] vals = loadStrings(fileName);
    data = new double[vals.length][wid];
    derivative = new double[vals.length][wid];
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
  else {
    data3D = new double[fileAmount][hi][wid];
    derivative3D = new double[fileAmount][hi][wid];
    for (int f = 1;f < fileAmount+1;f++) {
      String add = "";
      if (f < 10) {
        add = "0";
      }
      String[] vals = loadStrings("cro_0"+fileNum+"_S0"+add+f+".txt");
      System.out.println("cro_0"+fileNum+"_S0"+add+f+".txt"+": loaded");
      for (int i = 0;i < vals.length;i++){
        String[] nums = vals[i].split("\t");
        if (nums.length > 1) {
          for (int j = 0;j < nums.length;j++) {
            if (i == 0 && j == 0) {
              j++;
            }
            data3D[f-1][i][j] = Double.parseDouble(nums[j]) / (1.0/(1+Math.pow(2.718282,data3D[f-1][i][0]/.0194752)));
          }
        }
      }
    }
  }
}

void graph() {
  if (mode == 4) {
    for (int i = 1;i < data.length;i++) {
      for (int j = 1;j < data[i].length;j++) {
        if (data[i][j] > .5) {
          fill(255,(int)(255*(data[i][j]-.5)*2),0);
          rect(0+3*i/4,430-3*j/4,1,1);
        }
        else {
          fill((int)(255*(data[i][j]*2)),0,0);
          rect(0+3*i/4,430-3*j/4,1,1);
        }
      } 
    }
  }
  if (mode == 0) {  
    for (int i = 0;i < data3D[startGraph].length;i++) {
      for (int j = 1;j < data3D[startGraph][i].length;j++) {
        if (data3D[startGraph][i][j] > .5) {
          fill(255,(int)(255*(data3D[startGraph][i][j]-.5)*2),0);
          rect(85+j/3,400-i/3,1,1);
        }
        else {
          fill((int)(255*(data3D[startGraph][i][j]*2)),0,0);
          rect(85+j/3,400-i/3,1,1);
        }
      }
    }
  }
  else if (mode == 1) {
    /*for (int i = 1;i < derivative.length;i++) {
      for (int j = 1;j < derivative[i].length;j++) {
        if (derivative[i][j] > threshhold || derivative[i][j] < -1*threshhold) {
          fill(255,255,0);
          rect(65+i/3,330-j/3,1,1);
        }
        if (derivative[i][j] > .5) {
          fill(255,(int)(255*(derivative[i][j]-.5)*2),0);
          rect(65+i/3,330-j/3,1,1);
        }
        else {
          fill((int)(255*(derivative[i][j]*2)),0,0);
          rect(65+i/3,330-j/3,1,1);
        }
      }
    }*/
    for (int i = 0;i < derivative3D[startGraph].length;i++) {
      for (int j = 1;j < derivative3D[startGraph][i].length;j++) {
        if (derivative3D[startGraph][i][j] > .5) {
          fill(255,(int)(255*(derivative3D[startGraph][i][j]-.5)*2),0);
          rect(85+j/3,400-i/3,1,1);
        }
        else {
          fill((int)(255*(derivative3D[startGraph][i][j]*2)),0,0);
          rect(85+j/3,400-i/3,1,1);
        }
      }
    }
  }
  else if (mode == 2) {
    for (int i = 0;i < data3D.length;i++) {
      for (int j = 1;j < data3D[i][energy].length;j++) {
        if (data3D[i][energy][j] > .5) {
          fill(255,(int)(255*(data3D[i][energy][j]-.5)*2),0);
          rect(85+j/3,320-9*i,1,27);
        }
        else {
          fill((int)(255*(data3D[i][energy][j]*2)),0,0);
          rect(85+j/3,320-9*i,1,27);
        }
      }
    }
  }
  else if (mode == 3) {
    for (int i = 0;i < derivative3D.length;i++) {
      for (int j = 1;j < derivative3D[i][energy].length;j++) {
        if (derivative3D[i][energy][j] > .5) {
          fill(255,(int)(255*(derivative3D[i][energy][j]-.5)*2),0);
          rect(85+j/3,320-9*i,1,27);
        }
        else {
          fill((int)(255*(derivative3D[i][energy][j]*2)),0,0);
          rect(85+j/3,320-9*i,1,27);
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

void keyPressed() {
  if (key == CODED) {
    /*if (keyCode == UP) {
      normRatio /= .9;
      alterData();
      display();
    }
    if (keyCode == DOWN) {
      normRatio *= .9;
      alterData();
      display();
    }*/
    if (keyCode == LEFT) {
      if (mode > 1) {
        if (energy - 6 > 1) energy -= 6;
        display();
      }
      else {
        if (startGraph > 0) startGraph -= 1;
        display();
      }
    }
    if (keyCode == RIGHT) {
      if (mode > 1) {
        if (energy + 6 < hi) energy += 6;
        display();
      }
      else {
        if (startGraph < fileAmount) startGraph += 1;
        display();
      }    
    }
  }
  if (key == ' ') {
      if (mode == 0 || mode == 2) mode++;
      else mode--;
      if (mode == 2 || mode == 0) {
        normallise();
        display();
      }
      else if (mode == 3 || mode == 1) {
        //minGrad();
        //normallise();
        display();
      }
    }
}

void display() {
  background(255);
  noStroke();
  graph();
  noFill();
  stroke(0);
  if (mode < 2) {
    /*rect(63,329-data[0].length/3,data.length/3+4,data[0].length/3+3);
    textSize(14);
    fill(0);
    text("root:"+fileName+": "+(data.length-1)+" x "+ (data[1].length-1)+ " (no change)",110,42);
    labelAxes();*/
    textSize(14);
    fill(0);
    text("Polar Angle: "+(-8.0+startGraph),110,42);
    if (mode == 0) text("Original Data",110,15);
    else text("Minimum Gradient",110,15);
    text("Energy",5,200);
    text("Momentum",180,450);
  }
  else if (mode < 4){
    textSize(14);
    fill(0);
    text("Energy: "+data3D[0][energy][0],110,42);
    if (mode == 2) text("Original Data",110,15);
    else text("Minimum Gradient",110,15);
    text("Lateral",5,200);
    text("Angle",5,215);
    text("Polar Angle",180,385);
  }
}

void setup() {
  size(435,500); 
  try{
    loadData();
  }
  catch(FileNotFoundException e){
    System.out.println("Invalid text file");
  }
  //minGrad();
  //differentiate2();
  normallise();
  display();
}

void draw() {
}
