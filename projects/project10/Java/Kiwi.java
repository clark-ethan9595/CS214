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
