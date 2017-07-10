package com.bank.controller;

import com.bank.dao.AccountHibernateDAO;
import com.bank.dao.AccountTypeHibernateDAO;
import com.bank.dao.UserHibernateDAO;
import com.bank.model.Account;
import com.bank.model.AccountType;
import com.bank.model.User;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.GenericEntity;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.*;

/**
 * Created by danieltang on 7/7/17.
 */
@Controller
public class OpenAccountController {
    @RequestMapping(value="/getuserinfo", method = RequestMethod.GET,produces = MediaType.APPLICATION_JSON)
    @ResponseBody
    public Response getUser(HttpSession session){
        System.out.println(" i am in open account controller");
        User user = (User) session.getAttribute("user");
        user.setCredentials(null);
        user.setAccounts(null);
        user.getAddress().setUsers(null);
        System.out.println(user.toString());
        GenericEntity<User> userGenericEntity = new GenericEntity<User>(user){};
        return Response.ok(userGenericEntity).build();
    }

    @RequestMapping(value="/getAccountType", method=RequestMethod.GET,produces = MediaType.APPLICATION_JSON)
    @ResponseBody
    public Response getAccountType(){
        System.out.println(" I am in get AccountType method");
        ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
        AccountTypeHibernateDAO accountTypeHibernateDAO = (AccountTypeHibernateDAO) context.getBean("accountTypeDAO");
        List list  = accountTypeHibernateDAO.list();
        GenericEntity<List<AccountType>> entity = new GenericEntity<List<AccountType>>(list){};
        return Response.ok(entity).build();
    }

    @RequestMapping(value="/openaccount",method = RequestMethod.POST)
    public ModelAndView openAccount(HttpServletRequest request,HttpSession session){
        ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
        AccountHibernateDAO accountHibernateDAO = (AccountHibernateDAO) context.getBean("accountDAO");
        UserHibernateDAO userHibernateDAO = (UserHibernateDAO) context.getBean("userDAO");

        System.out.println("I am in openAccount");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("accounts");
        System.out.println(request.getParameter("accountType"));
        System.out.println(request.getParameter("initialBalance"));
        User currentUser = (User)session.getAttribute("user");
        Random random = new Random();
        int account_number = random.nextInt();
        Account account = new Account();
        account.setAccountNumber(Integer.toString(account_number));
        account.setAccountTypeId(Integer.parseInt(request.getParameter("accountType")));
        account.setBalance(Integer.parseInt(request.getParameter("initialBalance")));
        account.setOpenedDate(new Date());
        Set users = new HashSet(0);
        users.add(currentUser);
        account.setUsers(users);
        accountHibernateDAO.save(account);


        return modelAndView;
    }
}
