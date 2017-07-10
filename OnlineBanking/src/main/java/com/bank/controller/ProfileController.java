package com.bank.controller;

import com.bank.dao.UserHibernateDAO;
import com.bank.model.Address;
import com.bank.model.User;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.GenericEntity;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.awt.*;

/**
 * Created by Kristian Lucero on 7/10/2017.
 */
@Controller
public class ProfileController {
    @RequestMapping(value = "/getUserInfo", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON)
    @ResponseBody
    public Response getInfo(HttpSession session){
        System.out.print("I am in get info");
        User user = (User) session.getAttribute("user");
        user.setCredentials(null);
        user.setAccounts(null);
        user.getAddress().setUsers(null);
        System.out.println(user.toString());
        GenericEntity<User> userGenericEntity = new GenericEntity<User>(user){};
        return Response.ok(userGenericEntity).build();
    }

    @RequestMapping(value = "/updateUser", method = RequestMethod.POST)
    public ModelAndView updateUser(HttpServletRequest request, HttpSession session){
        System.out.println("I'm in update user method");
        User user = (User) session.getAttribute("user");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setPhoneNumber(phoneNumber);
        ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
        UserHibernateDAO userHibernateDAO = (UserHibernateDAO) context.getBean("userDAO");
        userHibernateDAO.update(user, user.getId());
//        String email = request.getParameter("email");
//        String dateOfBirth = request.getParameter("dateOfBirth");
//        String phoneNumber = request.getParameter("phoneNumber");
//        String street = request.getParameter("street");
//        String city = request.getParameter("city");
//        String state = request.getParameter("state");
//        String state = request.getParameter("state");
        return null;
    }
}
