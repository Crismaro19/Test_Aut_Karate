package satAut.sqlSat;

import com.intuit.karate.junit5.Karate;

public class sqlSatRunner {
    @Karate.Test
    Karate testSqlSat() {
        return Karate.run("sqlSat").relativeTo(getClass());
    }
}
