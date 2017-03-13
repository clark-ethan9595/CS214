/* Bird.java provides class Bird.
 *
 * Begun by: Dr. Nelesen, CS 214 at Calvin College.
 * Completed by: Ethan Clark Lab10
 * Date: April 21, 2016
 */

public class Bird {

    private String myName;

    /*********************************
    * Constructor for Bird Class     *
    * Set name to myName             *
    *********************************/
    public Bird(String name)
    {
	myName = name;
    }
   
    /*********************************
    * Accessor for Bird Class        *
    * Receive: NONE                  *
    * Return: myName                 *
    *********************************/
    public String getName()
    {
	return myName;
    }
   

    /***********************************************
    * call() returns the call of the current Bird  *
    * Receive: NONE                                *
    * Return: "Squaaaaaaaaaaaaaawk!"               *
    ***********************************************/
    public String call()
    {
	return "Squaaaaaaaaaaawk!";
    }
   

    /*********************************************************
    * print() returns the Bird name and its call             * 
    * Receive: NONE                                          *
    * Return: Returns the Bird name, Bird type and its call  *
    *********************************************************/
    public void print()
    {
	System.out.println(getName() + ' ' + getClass().getName() +
					" says " + call());
    }
   
}
