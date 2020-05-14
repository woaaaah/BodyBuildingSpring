package com.example.demo.validator;

import com.example.demo.model.BodyBuilding;
import com.example.demo.model.User;
import com.example.demo.service.BodyBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.util.regex.Pattern;

public class FormValidator implements Validator {
    private static final Pattern NAME_REGEX =
            Pattern.compile("^[a-zA-Z]$");
    private static final Pattern SURNAME_REGEX =
            Pattern.compile("^[a-zA-Z]$");
    @Autowired
    private BodyBuildingService bodyBuildingService;

    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        BodyBuilding bodyBuilding = (BodyBuilding) o;


        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "NotEmpty");
        if (bodyBuilding.getName() != null && !NAME_REGEX.matcher(bodyBuilding.getName()).matches()) {
            errors.rejectValue("email", "Regex.userform.name");
        }
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "NotEmpty");
        if (bodyBuilding.getSurname() != null && !SURNAME_REGEX.matcher(bodyBuilding.getSurname()).matches()) {
            errors.rejectValue("email", "Regex.userform.surname");
        }

    }
}
