package satAut.pagoTC;

import com.intuit.karate.junit5.Karate;

public class pagoTcRunner {

    @Karate.Test
    Karate testPagoTc() {
        return Karate.run("pagoTC").relativeTo(getClass());
    }
}
