/* Birds.java illustrates inheritance and polymorphism.
 *
 * Begun by: Dr. Nelesen, CS 214 at Calvin College.
 * Completed by: Ethan Clark Lab10
 * Date: April 21, 2016
 */

public class Birds{

    public static void main (String[] args){
	
	//Bird bird1 = new Bird();

	// Test the Parent Bird class
	Bird bird1 = new Bird("Hawkeye");
	System.out.println(bird1.getName());
	System.out.println(bird1.call());
	bird1.print();

	// Test the Duck child class
	Duck bird2 = new Duck("Donald");
	bird2.print();

	// Test the Goose child class
	Goose bird3 = new Goose("Mother");
	bird3.print();

	// Test the Owl child class
	Owl bird4 = new Owl("Woodsey");
	bird4.print();
    }

}
