Script started on Thu 21 Apr 2016 09:17:52 PM EDT
elc3@hollerith:~/Documents/214/code/10/java$ cat Bird.java
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
elc3@hollerith:~/Documents/214/code/10/java$ cat Duck,java
cat: Duck,java: No such file or directory
elc3@hollerith:~/Documents/214/code/10/java$ cat   t Duck.java
/* Duck.java models a Duck
 *
 * Begun by: Dr. Nelesen, CS 214 at Calvin College.
 * Completed by: Ethan Clark Lab10
 * Date: April 21, 2016
 */

public class Duck extends Bird
{

	/**********************************************
	* Constructor for the child Duck class        *
	* Sets name to be myName in the parent class  *
	**********************************************/
	public Duck(String name)
	{
		super(name);
	}

	/**********************************************
	* call() returns the sound for the Duck class *
	* Receive: NONE                               *
	* Return: "Quack!"                            *
	**********************************************/
	public String call()
	{
		return "Quack!";
	}
}
elc3@hollerith:~/Documents/214/code/10/java$ cat Goose.java
/* Goose.java models a Goose
 *
 * Begun by: Dr. Nelesen, CS 214 at Calvin College.
 * Completed by: Ethan Clark Lab10
 * Date: April 21, 2016
 */

public class Goose extends Bird
{

	/**********************************************
	* Constructor for the child Goose class       *
	* Sets name to be myName in the parent class  *
	**********************************************/
	public Goose(String name)
	{
		super(name);
	}

	/***********************************************
	* call() returns the sound for the Goose class *
	* Receive: NONE                                *
	* Return: "Honk!"                              *
	***********************************************/
	public String call()
	{
		return "Honk!";
	}

}
elc3@hollerith:~/Documents/214/code/10/java$ cat Owl.java
/* Owl.java models an Owl
 *
 * Begun by: Dr. Nelesen, CS 214 at Calvin College.
 * Completed by: Ethan Clark Lab10
 * Date: April 21, 2016
 */

public class Owl extends Bird
{

	/**********************************************
	* Constructor for the child Owl class         *
	* Sets name to be myName in the parent class  *
	**********************************************/
	public Owl(String name)
	{
		super(name);
	}

	/***********************************************
	* call() returns the sound for the Owl class   *
	* Receive: NONE                                *
	* Return: "Whoot!"                             *
	***********************************************/
	public String call()
	{
		return "Whoot!";
	}

}
elc3@hollerith:~/Documents/214/code/10/java$ cat Birds.java
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
elc3@hollerith:~/Documents/214/code/10/java$ javac Birds.java
elc3@hollerith:~/Documents/214/code/10/java$ java Birds
Hawkeye
Squaaaaaaaaaaawk!
Hawkeye Bird says Squaaaaaaaaaaawk!
Donald Duck says Quack!
Mother Goose says Honk!
Woodsey Owl says Whoot!
elc3@hollerith:~/Documents/214/code/10/java$ exit

Script done on Thu 21 Apr 2016 09:18:20 PM EDT
