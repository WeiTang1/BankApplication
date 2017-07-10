package com.bank.controller;

import com.bank.model.Transaction;
import com.bank.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.ws.rs.core.GenericEntity;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.awt.*;
import java.awt.List;
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
}
