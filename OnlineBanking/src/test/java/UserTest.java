import com.bank.dao.AddressHibernateDAO;
import com.bank.dao.UserHibernateDAO;
import com.bank.model.Address;
import com.bank.model.User;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Date;

/**
 * Created by danieltang on 6/28/17.
 */
public class UserTest {
    public static void main (String[] args){
        ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
        UserHibernateDAO dao = (UserHibernateDAO) context.getBean("userDAO");
        Date date = new Date();
        Address address = new Address();
//        Address address2 = new Address();
//        address2.setId(2);
        address.setId(1);
        User user = new User(address,"Wei","Tang","wei.tang@gamil.com","6319463426",date,(byte)0);
//        User user1 = new User(address2,"Victor","nunez","vz@gmail.com","110",date,(byte)1);
////        dao.save(user);
        user.setId(1);
        dao.save(user);
    }
}
