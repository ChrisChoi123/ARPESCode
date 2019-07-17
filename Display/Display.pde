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
        rect(20+i/3,20+j/3,1,1);
      }
      else {
        fill((int)(255*(data[i][j]*2)),0,0);
        rect(20+i/3,20+j/3,1,1);
      }
    }
  }
}

void setup() {
  size(425,400); //520,280
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
  rect(20,20,data.length/3,data[0].length/3);
}

void draw() {
}
