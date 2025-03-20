package examples.database;

import com.intuit.karate.junit5.Karate;

public class DatabaseQueryRunner {
    
     @Karate.Test
    Karate testDatabaseQueries() {
        return Karate.run("oracle-db-query").relativeTo(getClass());
    }
}
