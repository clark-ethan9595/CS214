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
