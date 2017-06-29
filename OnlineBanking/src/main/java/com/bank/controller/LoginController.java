package com.bank.controller;

import com.bank.dao.CredentialHibernateDAO;
import com.bank.model.Credential;
import javafx.application.Application;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by danieltang on 6/29/17.
 */
@Controller
@RequestMapping("/login")
@SessionAttributes({"username","userid"})
public class LoginController {
    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView login(@RequestParam("username") String username, @RequestParam("password")String password){
        System.out.println(username+ password);
        ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
        CredentialHibernateDAO credentiaoDao = (CredentialHibernateDAO) context.getBean("credentialDAO");
        ModelAndView model = new ModelAndView();
        Credential credential = new Credential();
        credential.setLoginId(username);
        credential.setPassword(password);
        List list = credentiaoDao.login(credential);
        credential = (Credential) list.get(0);
        if(list.isEmpty()){
            model.setViewName("index");
        }
        else{
            model.setViewName("home");
            model.addObject("username",credential.getLoginId());
        }
        return model;
    }
}
