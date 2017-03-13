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
