import java.util.*;
import java.io.*;
double[][] data;

void loadData(String filename) throws FileNotFoundException {
  String[] vals = loadStrings(filename);
  /*File text = new File(filename);
  Scanner scan = new Scanner(text);
  */
  data = new double[1055][801];
  for (int i = 0;i < vals.length;i++){
    String[] nums = vals[i].split("  ");
    for (int j = 0;j < nums.length;j++) {
      if (i == 0 && j == 0) {
        j++;
      }
      data[i][j] = Double.parseDouble(nums[j]);
    }
  }
}

void setup() {
  size(520,280);
  try{
    loadData("cro_001.txt");
    System.out.println("OHIYO");
  }
  catch(FileNotFoundException e){
    System.out.println("Invalid text file");
  }  
}

void draw() {
  background(255);
}
