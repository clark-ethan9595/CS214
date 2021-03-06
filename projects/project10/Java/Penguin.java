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
