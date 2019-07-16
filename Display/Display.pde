import java.util.*;
import java.io.*;
import java.lang.Character;
double[][] data;

void loadData(String filename) throws FileNotFoundException {
  File text = new File(filename);
  Scanner scan = new Scanner(text);
  
  data = new double[1055][801];
  int i = 0;
  while(scan.hasNextLine()){
    String line = scan.nextLine();
    String[] nums = line.split("  ");
    for (int j = 0;j < nums.length;j++) {
      if (i == 0 && j == 0) {
        j++;
      }
      data[i][j] = Double.parseDouble(nums[j]);
    }
    i++;
  }
  scan.close();
}

void setup() {
  size(520,280);
  try{
    loadData("cro001.txt");
  }
  catch(FileNotFoundException e){
    System.out.println("Invalid text file");
  }  
}

void draw()  {
  background(255);
}
