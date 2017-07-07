import com.bank.dao.AccountHibernateDAO;
import com.bank.dao.TransactionHibernateDAO;
import com.bank.dao.UserHibernateDAO;
import com.bank.model.Account;
import com.bank.model.Transaction;
import com.bank.model.User;
import javafx.application.Application;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Date;

/**
 * Created by danieltang on 7/6/17.
 */
public class TransactionTest {
    public static void main(String[] args){
        ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
        AccountHibernateDAO accountHibernateDAO = (AccountHibernateDAO) context.getBean("accountDAO");
        TransactionHibernateDAO transactionHibernateDAO = (TransactionHibernateDAO) context.getBean("transactionDAO");

        Account transfer = (Account) accountHibernateDAO.get(1);
        Account recipient = (Account) accountHibernateDAO.get(2);
        Transaction transfer_transaction = new Transaction();
        transfer_transaction.setAccount(transfer);
        transfer_transaction.setAmount(3.0);
        transfer_transaction.setAvailableBalance(transfer.getBalance());
        Date date = new Date();
        transfer_transaction.setDate(date);
        transfer_transaction.setDescription("transfer");
        transfer_transaction.setTransactionStatusId(1);
        transfer_transaction.setTransactionTypeId(1);
        transactionHibernateDAO.save(transfer_transaction);
    }
}
