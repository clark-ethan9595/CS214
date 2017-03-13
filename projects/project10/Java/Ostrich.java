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
