/* Average.java is a driver for method avg().
 * Started By: Dr. Nelesen
 * Completed By: Ethan Clark Lab6
 * Date: 3/24/2016
 * Precondition: theArray, is an array of double values.
 * Output: the average of the numbers in theArray.
 ***************************************************************/

public class Average
{
  public static void main(String[] args)
    {
      double[] theArray = {9.0, 8.0, 7.0, 6.0};
 
      // output the average of the values in theArray
      System.out.println("The average is " + avg(theArray));
    }
  

  /* sum() is a method that computes the sum of all the values
   * in an array of doubles.
   * Receive: anArray, an array of doubles.
   * Return: the sum of the values in anArray.
   ************************************************************/
   public static double sum(double[] theArray) {

	double total = 0.0;

	// add up all the elements in the array
	for (int i = 0; i < theArray.length; i++) {
		total += theArray[i];
	}

	return total;
   }

  
  /* avg() is a method that computes the average of the values
   * in an array.
   * Receive: anArray, an array of doubles.
   * Return: the average of the values in anArray.
   ************************************************************/
   public static double avg(double[] theArray) {

     // if there are no elements in the array, return a sum of 0
     if (theArray.length == 0)
	return 0.0;

     // otherwise return the sum of the numbers divided by the number of elements
     else
        return sum(theArray) / theArray.length;
   }
}
