Script started on Mon 25 Apr 2016 07:58:21 PM EDT
elc3@boole:~/Documents/214/code/projects/project10/Java$ cat Bird.a java
/* Bird.java provides class Bird.
 *
 * Begun by: Dr. Nelesen, CS 214 at Calvin College.
 * Completed by: Ethan Clark Project10
 * Date: April 25, 2016
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

   /*****************************************************************
   * movement() returns the movement type for the Bird class        *
   * Receive: NONE                                                  *
   * Return: "moved"                                                *
   *****************************************************************/
    public String movement()
    {
	return "moved";
    }   

    /********************************************************************
    * print() returns the Bird name and its call                        * 
    * Receive: NONE                                                     *
    * Return: Returns the Bird name, Bird type, movement, and its call  *
    ********************************************************************/
    public void print()
    {
	System.out.println(getName() + ' ' + getClass().getName() +
					" just " + movement() + " and said " + call());
    }
   
}
elc3@boole:~/Documents/214/code/projects/project10/Java$ cat FlyingBird.java
/* FlyingBird.java provides a class for the FlyingBird types
 *
 * Created by: Ethan Clark Project10
 * Date: April 25, 2016
 */

public class FlyingBird extends Bird
{

	/*******************************************************
	* Constructor for FlyingBird class                     *
	* Calls the name constuctor for the Bird parent class  *
	*******************************************************/
	public FlyingBird(String name)
	{
		super(name);
	}

	/*****************************************************************
	* movement() returns the movement type for the FlyingBird class  *
	* Receive: NONE                                                  *
	* Return: "flew"                                                 *
	*****************************************************************/
	public String movement()
	{
		return "flew";
	}

}
elc3@boole:~/Documents/214/code/projects/project10/Java$ cat WalkingBird.java
/* WalkingBird.java provides a class for the WalkingBird types
 *
 * Created by: Ethan Clark Project10
 * Date: April 25, 2016
 */

public class WalkingBird extends Bird
{

	/*******************************************************
	* Constructor for WalkingBird class                    *
	* Calls the name constuctor for the Bird parent class  *
	*******************************************************/
	public WalkingBird(String name)
	{
		super(name);
	}

	/*****************************************************************
	* movement() returns the movement type for the WalkingBird class *
	* Receive: NONE                                                  *
	* Return: "walked"                                               *
	*****************************************************************/
	public String movement()
	{
		return "walked";
	}

}
elc3@boole:~/Documents/214/code/projects/project10/Java$ cat Duck.java
/* Duck.java models a Duck
 *
 * Begun by: Dr. Nelesen, CS 214 at Calvin College.
 * Completed by: Ethan Clark Project10
 * Date: April 25, 2016
 */

public class Duck extends FlyingBird
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
elc3@boole:~/Documents/214/code/projects/project10/Java$ cat Goose.java
/* Goose.java models a Goose
 *
 * Begun by: Dr. Nelesen, CS 214 at Calvin College.
 * Completed by: Ethan Clark Project10
 * Date: April 25, 2016
 */

public class Goose extends FlyingBird
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
elc3@boole:~/Documents/214/code/projects/project10/Java$ cat Owl.java
/* Owl.java models an Owl
 *
 * Begun by: Dr. Nelesen, CS 214 at Calvin College.
 * Completed by: Ethan Clark Project10
 * Date: April 25, 2016
 */

public class Owl extends FlyingBird
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
elc3@boole:~/Documents/214/code/projects/project10/Java$ cat Penguin.java
/* Penguin.java models a Penguin
 *
 * Created by: Ethan Clark Project10
 * Date: April 25, 2016
 */

public class Penguin extends WalkingBird
{

	/**********************************************
	* Constructor for the child Duck class        *
	* Sets name to be myName in the parent class  *
	**********************************************/
	public Penguin(String name)
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
		return "Huh-huh-huh-huuuuuh!";
	}
}
elc3@boole:~/Documents/214/code/projects/project10/Java$ cat Ostrich.java
/* Ostrich.java models a Ostrich
 *
 * Created by: Ethan Clark Project10
 * Date: April 25, 2016
 */

public class Ostrich extends WalkingBird
{

	/**********************************************
	* Constructor for the child Ostrich class     *
	* Sets name to be myName in the parent class  *
	**********************************************/
	public Ostrich(String name)
	{
		super(name);
	}

	/*************************************************
	* call() returns the sound for the Ostrich class *
	* Receive: NONE                                  *
	* Return: "Snork!"                               *
	*************************************************/
	public String call()
	{
		return "Snork!";
	}
}
elc3@boole:~/Documents/214/code/projects/project10/Java$ cat Kiwi.java
/* Kiwi.java models a Kiwi
 *
 * Created by: Ethan Clark Project10
 * Date: April 25, 2016
 */

public class Kiwi extends WalkingBird
{

	/**********************************************
	* Constructor for the child Kiwi class        *
	* Sets name to be myName in the parent class  *
	**********************************************/
	public Kiwi(String name)
	{
		super(name);
	}

	/**********************************************
	* call() returns the sound for the Kiwi class *
	* Receive: NONE                               *
	* Return: "Victory!"                          *
	**********************************************/
	public String call()
	{
		return "Victory!";
	}
}
elc3@boole:~/Documents/214/code/projects/project10/Java$ cat i Birds.java
/* Birds.java illustrates inheritance and polymorphism.
 *
 * Begun by: Dr. Nelesen, CS 214 at Calvin College.
 * Completed by: Ethan Clark Lab10
 * Date: April 21, 2016
 */

public class Birds{

    public static void main (String[] args){

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

	// Test the Penguin child class
	Penguin bird5 = new Penguin("HappyFeet");
	bird5.print();

	// Test the Ostrich child class
	Ostrich bird6 = new Ostrich("Speedy Gonzales");
	bird6.print();

	// Test the Kiwi child class
	Kiwi bird7 = new Kiwi("Tiny Tim");
	bird7.print();
    }

}
elc3@boole:~/Documents/214/code/projects/project10/Java$ javac Birds.java
jelc3@boole:~/Documents/214/code/projects/project10/Java$ java Birds
Hawkeye
Squaaaaaaaaaaawk!
Hawkeye Bird just moved and said Squaaaaaaaaaaawk!
Donald Duck just flew and said Quack!
Mother Goose just flew and said Honk!
Woodsey Owl just flew and said Whoot!
HappyFeet Penguin just walked and said Huh-huh-huh-huuuuuh!
Speedy Gonzales Ostrich just walked and said Snork!
Tiny Tim Kiwi just walked and said Victory!
elc3@boole:~/Documents/214/code/projects/project10/Java$ exit

Script done on Mon 25 Apr 2016 07:59:04 PM EDT
