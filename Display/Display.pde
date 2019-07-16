import java.util.*;
import java.io.*;
import java.lang.Character;
public class Arpes {
  double[][] data;

  public Arpes() {
  }
  public void loadData(String filename) throws FileNotFoundException  {
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
    System.out.println(Arrays.toString(data[0]));
  }
  public static void main(String[] args) {
    try {
      Arpes a = new Arpes();
      a.loadData(args[0]);
    }
    catch(FileNotFoundException e){
      System.out.println("Invalid text file");
    }
  }
}
