package examples.operations;

import com.intuit.karate.junit5.Karate;

public class operationRunner {

    @Karate.Test
    Karate testOperation() {
        return Karate.run("operation").relativeTo(getClass());
    }

}
