import java.util.*;
import java.io.*;

double[][] data;
double max;

void loadData(String filename) throws FileNotFoundException {
  String[] vals = loadStrings(filename);
  data = new double[1055][801];
  for (int i = 0;i < vals.length;i++){
    String[] nums = vals[i].split("\t");
    for (int j = 0;j < nums.length;j++) {
      if (i == 0 && j == 0) {
        j++;
      }
      data[i][j] = Double.parseDouble(nums[j]);
    }
  }
}

void getMaxVal() {
  double output = 0;
  for (int i = 1;i < data.length;i++) {
    for (int j = 1;j < data[i].length;j++) {
      if (data[i][j] > output) {
        output = data[i][j];
      }
    }
  }
  max = output;  
}

void normallise() {
  for (int i = 1;i < data.length;i++) {
    for (int j = 1;j < data[i].length;j++) {
      data[i][j] = data[i][j]/max;
    }
  }
}

void graph() {
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
  text("deg",10,330-data[0].length);
}

void setup() {
  size(435,400); //520,280
  try{
    loadData("cro_001.txt");
  }
  catch(FileNotFoundException e){
    System.out.println("Invalid text file");
  }
  getMaxVal();
  normallise();
  background(255);
  noStroke();
  graph();
  System.out.println(max);
  noFill();
  stroke(0);
  rect(63,329-data[0].length/3,data.length/3+4,data[0].length/3+3);
  textSize(14);
  text("root:cro_001: 1054 x 800 (no change)",130,42);
  labelAxes();
}

void draw() {

  //text(""+mouseX+" "+mouseY, mouseX,mouseY);
}
