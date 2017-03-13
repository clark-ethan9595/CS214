/*
 * Threaded_Array.java computes the sum of a set of numbers from a file
 *
 * Created by: Dr. Nelesen
 * Completed by: Ethan Clark Lab11
 * Date: May 2, 2016
 */

import java.io.*;
import java.util.List;
import java.util.ArrayList;

class Threaded_Array {

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
    public void doSummation(int threadCount){
	int total = 0;
	long startTime = System.nanoTime();
	// Make and start all the workers, keeping them in a list.
	List<Worker> workers = new ArrayList<Worker>();
	int lenOneWorker = inputs.length / threadCount;
	for (int i=0; i<threadCount; i++) {
	    int start = i * lenOneWorker;
	    int end = (i+1) * lenOneWorker;
	    // Special case: make the last worker take up all the excess.
	    if (i==threadCount-1) end = inputs.length;
	    Worker worker = new Worker(start, end);
	    workers.add(worker);
	    worker.start();
	}
	
	// Wait to finish until all Workers have finished
	try {
	    for (Worker w: workers) w.join();
	} catch (InterruptedException ignored) {
	}
	
	// Gather sums from workers 
	for (Worker w: workers) total += w.getSum();
	long endTime = System.nanoTime();
	System.out.println("Total is: " + total);
	System.out.println("time: " + (endTime - startTime));
    }

    // main kicks things off and gets out of the way
    public static void main (String [] args){
	if (args.length != 2) {
	    System.out.println("Usage: java Threaded_Array <filename> \n");
	    System.exit(-1);
	}
	Threaded_Array sum = new Threaded_Array();
	
	//read values from file
	sum.readFile(args[0]);
	sum.doSummation(Integer.parseInt(args[1]));

    }

    // Worker inner class to add up a section of the array.
    private class Worker extends Thread {
	int start;
	int end;
	long sum;
	
	// Note the start and end indexes for this worker
	// in the array. Goes up to but not including end index.
	Worker(int start, int end) {
	    this.start = start;
	    this.end = end;
	    sum = 0;
	}
	// Computes the sum for our start..end section
	// in the array (client should call getSum() later).
	public void run() {
	    for (int i=start; i<end; i++) {
		sum += inputs[i];
	    }
	}
	
	public long getSum() {
	    return sum;
	}
    }
}
