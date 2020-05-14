package com.example.demo.controller;

/// !!!! IMPORTU GAL REIK ???


import com.example.demo.model.BodyBuilding;
import com.example.demo.model.User;
import com.example.demo.service.BodyBuildingService;
import com.example.demo.service.SecurityService;
import com.example.demo.service.UserService;
import com.example.demo.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;

// WEB kontroleris. pazymi MVC valdikli. leidzia viduje naudoti @RequestMapping
// @RestController anotacija nurodo , jog spring tipo rezultatas turetu buti isspaudinamas klientui toks kok yra.

// @RestController negrazina view
// kadangi mums riekia grazinti view pagal Spring MVC naudojamas @Controller
@Controller
//@EnableAutoConfiguration - zymi konfiguracijos kompnenta. Videju leidzia kurti bean per metodus @Bean
// Si klases lygio anotacija nurodo Spring karkasui "atspeti" konfiguracija
// remiantis priklausomybemes (jar bibliotekos) , kurias programuotojas itrauke i projekta
// siuo atveju ji viekia kartu su main metodu
@EnableAutoConfiguration
public class BodyBuildingController {
    // autowire naudojamas automatinei priklausomybiu injekcijai
    // kad panaudoti @Autowired anotacija riekia pirmiausiai turetu apsirasius @Bean @Configuration klaseje
    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;
    @Autowired
    // @Qualifier anotacija kartu su @Autowired patikslina su kuriuo konkreiciai bean susieti priklausomybe
    // jeigu @Configuration klasjeje yra daugiau negu viena bean @Qualifier anotacija yra privaloma
    //kitu atveju metama klaida
    // cibsuder making one of the beans as @Primary updating the consumer to accept multiple beans
    // or using @Qualifier to identify the bean that shoul be consumed
    @Qualifier("NumberService")
    public BodyBuildingService bodyBuildingService;

    @GetMapping({"/", "/bodyBuild"})
    String home(Model model) {
        // jeigu model "number" nepraeina validacijos - per ji grazinamos validacijos klaidos i view
        model.addAttribute("number", new BodyBuilding());
        // graziname JSP faila turi buti talpinami webapp > web-inf > jsp aplanke
        return "bodyBuild";
    }


    @RequestMapping(method = RequestMethod.POST, value = "/bodyBuildingShow")
    String bodyBuildingShow(@Valid @ModelAttribute("number") BodyBuilding e, BindingResult br,
                      @RequestParam HashMap<String, String> bodyBuildingTable, ModelMap modelMap) {

        if (br.hasErrors()) { // jeigu validacijos klaidos (zr . number klaseje aprasyta validacija prie kiekvieno skaiciaus)
            return "bodyBuild"; // vartotojas lieka skaiciuotuvo lange tol kol neistaiso validacijos klaidu
        } else {
            String name = bodyBuildingTable.get("name");
            String surname = bodyBuildingTable.get("surname");
            int age = Integer.parseInt(bodyBuildingTable.get("age"));
            String groups = bodyBuildingTable.get("groups");



            // ModelMap objektas naudojamas siusti reiksmes is spring MVC Controller i JSP
            modelMap.put("name", name);
            modelMap.put("surname", surname);
            modelMap.put("age", age);
            modelMap.put("groups", groups);

            // Kreipiames i service kuris savo ruoztu krepiausi i DAO ir issaugo irasa DB
            bodyBuildingService.save(new BodyBuilding(name, surname, age, groups));

            return "bodyBuildingShow";
        }
    }


    @RequestMapping(method = RequestMethod.GET, value = "/bodyBuildingTable")
    public String getAllNumbers(Model model) {
        model.addAttribute("bodyBuildingTable", bodyBuildingService.getAll());
        return "bodyBuildingTable";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/show{id}")
    public String getById(@RequestParam("id") int id, Model model) {
        model.addAttribute("bodyBuilder", bodyBuildingService.getById(id));
        return "bodyBuilder";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/deleting{id}")
    public String delete(@RequestParam("id") int id, Model model) {
        bodyBuildingService.delete(id);
        model.addAttribute("bodyBuildingTable", bodyBuildingService.getAll());
        return "bodyBuildingTable";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/updateBodyBuilding{id}")
    public String update(@RequestParam("id") int id, Model model) {
        model.addAttribute("bodyBuilder", bodyBuildingService.getById(id));
        return "updateBodyBuilding";
    }

    @RequestMapping(method = RequestMethod.POST, value = "/updateBodyBuildings")
    public String updateNumber(@ModelAttribute("id") BodyBuilding bodyBuilding) {
    bodyBuildingService.update(bodyBuilding);
    return "redirect:/show?id=" + bodyBuilding.getId();
    }


    @GetMapping("/register")
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "register";
    }

    @PostMapping("/register")
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "register";
        }

        userService.save(userForm);

        securityService.autoLogin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect://localhost:8090";
    }

    @GetMapping("/login")
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Username or password is incorrect");

        if (logout != null)
            model.addAttribute("message", "Successfullly logged out");

            return "login";
    }
}



