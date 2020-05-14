package com.example.demo.config;

import com.example.demo.model.BodyBuildingDAO;
import com.example.demo.model.BodyBuildingDAOImpl;
import com.example.demo.service.BodyBuildingService;
import com.example.demo.service.BodyBuildingServiceImpl;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

// @Configuration zymi konfiguracijos komponenta
// viduje leidzia kurti bean per metodus su @Bean
@Configuration

public class SpringConfig {

    //Bean tai objektai kurie sudaro spring aplikacijos pagrinda
    //Paprastai tai java klase realizuojanti tam tikra interfeise ir javabean specificija
    //Bean atitinka Singleton sablona programines irango projektavimo schema
    //kuri riboja klases ivykdyma vienu vieninteliu egzempliuriumi
    //tai naudinga kai reikia tiksliai vieno objekto norint koordinuoti  veiksmus visoje sistemoje
    @Bean
    // @Qualifier anotacija kartu su @Autowired patikslina su kuriuo konkreiciai bean susieti priklausomybe
    // jeigu @Configuration klasjeje yra daugiau negu viena bean @Qualifier anotacija yra privaloma
    //kitu atveju metama klaida
    // cibsuder making one of the beans as @Primary updating the consumer to accept multiple beans
    // or using @Qualifier to identify the bean that shoul be consumed
    @Qualifier("NumberDAO")
    public BodyBuildingDAO getNumberDAO() {
        return new BodyBuildingDAOImpl();
    }

    @Bean
    @Qualifier("NumberService")
    public BodyBuildingService getNumberService() {
        return new BodyBuildingServiceImpl();
    }
}
