/* NamerTest.java implements and tests class Name.
 * Created by: Dr. Nelesen
 ************************************************************/
import org.junit.runner.Result;
import org.junit.runner.JUnitCore;
import org.junit.runner.notification.Failure;

public class TestRunner{
    public static void main(String[] args) {

	Name aName = new Name("John", "Paul", "Jones");
	System.out.println(aName);
	
	//Commented out for first testing...

	// Class file for test class must be referenced in next line
	Result result = JUnitCore.runClasses(NamerTest.class);

	// Print information for each test that fails
	for (Failure failure : result.getFailures()) {
	    System.out.println(failure.toString());
	}

	//Print summative information
	if (result.wasSuccessful()){
	    System.out.println("All tests passed!");
	}
	else {
	    System.out.println("At least one test failed");
	}
    }
}



