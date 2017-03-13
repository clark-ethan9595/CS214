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
