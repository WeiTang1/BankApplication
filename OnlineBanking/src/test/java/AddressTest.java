import com.bank.dao.AddressHibernateDAO;
import com.bank.model.Address;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by danieltang on 6/28/17.
 */
public class AddressTest {
    public static void main (String[] args){
        ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
        AddressHibernateDAO dao = (AddressHibernateDAO) context.getBean("addressDAO");
        Address address = new Address("109 Willis Ave", "Port Jefferson","NY","11777");
        Address address2 = new Address("371 Rush more Ave","Piscataway","NJ","08854");
//        dao.save(address);
//        dao.save(address2);
        dao.update(address,2);
        System.out.print(dao.get(1));
    }
}
