/*
 * Array_Sum.java computes the sum of a set of numbers from a file
 *
 * Created by: Dr. Nelesen
 * Completed by: Ethan Clark Lab11
 * Date: May 2, 2016
 */

import java.io.*;

class Array_Sum {

    int [] inputs; // instance data for input array
    int numValues;

    //method to populate array with data from file
    public void readFile(String fname)
    {
	File f = new File(fname);
	BufferedReader reader = null;
	int i = 0;
	
	try {
	    reader = new BufferedReader(new FileReader(f));
	    String text = null;
	    
	    // Read in number of values first.
	    numValues = Integer.parseInt(reader.readLine());
	    
	    inputs = new int[numValues];
	    
	    // read and throw away blank line
	    reader.readLine();
	    
	    while ((text = reader.readLine()) != null) {
		// System.out.println("text is " + text + " and i is " + i);
		inputs[i] = Integer.parseInt(text);
		i++;
	    }
	    reader.close();
	} catch (Exception e) {
	    e.printStackTrace();
	}
    }

    //Worker method that computes the sum
    public void doSummation(){
	int total = 0;
	long startTime = System.nanoTime();
	for (int i = 0; i < inputs.length; i++){
	    total += inputs[i];
	}
	long endTime = System.nanoTime();
	System.out.println("Total is: " + total);
	System.out.println("time: " + (endTime - startTime));
    }

    // main kicks things off and gets out of the way
    public static void main (String [] args){
	if (args.length != 1) {
	    System.out.println("Usage: java Array_Sum <filename> \n");
	    System.exit(-1);
	}
	Array_Sum sum = new Array_Sum();
	
	//read values from file
	sum.readFile(args[0]);
	sum.doSummation();

    }
}
