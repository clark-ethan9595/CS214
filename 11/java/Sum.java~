/*
 * Sum.java computes the sum of a set of numbers from a file
 *
 * Created by: Dr. Nelesen
 */

import java.io.*;

class Sum {

    //method to compute sum of data from file
    public void doWork(String fname)
    {
	File f = new File(fname);
	BufferedReader reader = null;
	int i = 0;
	
	try {
	    reader = new BufferedReader(new FileReader(f));
	    String text = null;
	    
	    // Read in number of values first (but ignore in this version)
	    int numValues = Integer.parseInt(reader.readLine());
	    
	    // read and throw away blank line
	    reader.readLine();

	    long startTime = System.nanoTime();
	    int total = 0;
	    while ((text = reader.readLine()) != null) {
		total += Integer.parseInt(text);
	    }
	    long endTime = System.nanoTime();
	    reader.close();
	    System.out.println("Total is: " + total);
	    System.out.println("time: " + (endTime - startTime));
	} catch (Exception e) {
	    e.printStackTrace();
	}
    }

    // main kicks things off and gets out of the way
    public static void main (String [] args){
	Sum sum = new Sum();
	
	//Do all the work of summing numbers from file
	sum.doWork(args[0]);
    }
}
