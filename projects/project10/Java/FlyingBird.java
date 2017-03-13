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
