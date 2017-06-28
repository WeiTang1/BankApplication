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

    }
}
