package com.example.demo.config;

import com.example.demo.BodyBuildingApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

//Servlet yra java programa , viekianti web serveryje.
// servlet paleidziamas , kai vartotojas spusteleja nuoroda, pateikia forma ar atlieka kito tipo veiksmus svetaineja.
// Kiekvienas kliento requestas praeina per servlet , kuris ji perduoda controllerio RequestMapping atributui

public class ServletInitializer extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(BodyBuildingApplication.class);
    }

}
