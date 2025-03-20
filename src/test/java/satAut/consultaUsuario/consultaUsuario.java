package satAut.consultaUsuario;

import com.intuit.karate.junit5.Karate;

public class consultaUsuario {

    @Karate.Test
    Karate testConsultaUsuario() {
        return Karate.run("consultaUsuario").relativeTo(getClass());
    }
}
