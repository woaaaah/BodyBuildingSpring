package com.example.demo.controller;




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


@Controller

@EnableAutoConfiguration
public class BodyBuildingController {

    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;
    @Autowired

    @Qualifier("NumberService")
    public BodyBuildingService bodyBuildingService;

    @GetMapping({"/", "/bodyBuild"})
    String home(Model model) {

        model.addAttribute("number", new BodyBuilding());

        return "bodyBuild";
    }


    @RequestMapping(method = RequestMethod.POST, value = "/bodyBuildingShow")
    String bodyBuildingShow(@Valid @ModelAttribute("number") BodyBuilding e, BindingResult br,
                      @RequestParam HashMap<String, String> bodyBuildingTable, ModelMap modelMap) {

        if (br.hasErrors()) {
            return "bodyBuild";
        } else {
            String name = bodyBuildingTable.get("name");
            String surname = bodyBuildingTable.get("surname");
            String age = bodyBuildingTable.get("age");
            String groups = bodyBuildingTable.get("groups");




            modelMap.put("name", name);
            modelMap.put("surname", surname);
            modelMap.put("age", age);
            modelMap.put("groups", groups);


            bodyBuildingService.save(new BodyBuilding(name, surname, age, groups));

            return "bodyBuild";
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



