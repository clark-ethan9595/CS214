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
