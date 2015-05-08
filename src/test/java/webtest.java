
import java.util.Date;
import java.util.List;
import java.util.Set;

import com.bank.domain.Teller;
import com.bank.domain.Personinfo;
import com.bank.domain.Status;
import com.bank.domain.User;
import com.bank.repository.UserDao;
import com.bank.service.UserService;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class webtest {

    private static ApplicationContext context = null;

    @BeforeClass
    public static void setUpBeforeClass() throws Exception {
        context = new FileSystemXmlApplicationContext("src/main/webapp/WEB-INF/applicationContext.xml");

    }

    @Test
    public void test() {
        System.out.println(context.getBean("sessionFactory").toString());


    }


    @Test
    public void usertest() {

        SessionFactory sf = (SessionFactory) context.getBean("sessionFactory");
        Session session = sf.openSession();
        Transaction tx = session.beginTransaction();
        User user = new User();
        user.setUsername("xiahaijiao");
        user.setPassword("password");

        Status status = new Status();
        status.setId(1);
        status.setName("启用");
        user.setStatus(status);
        session.save(user);
        tx.commit();
        session.close();

    }

    @Test
    public void statustest() {
        SessionFactory sf = (SessionFactory) context.getBean("sessionFactory");
        Session session = sf.openSession();
        Transaction tx = session.beginTransaction();
        Status status = new Status();
        status.setName("BG");
        status.setId(3);
//        Set<User> users=status.getUsers();
//        System.out.println(users.toString());
        session.save(status);
        tx.commit();
        session.close();
    }

    @Test
    public void tellertest() {
        SessionFactory sf = (SessionFactory) context.getBean("sessionFactory");
        Session session = sf.openSession();
        Transaction tx = session.beginTransaction();
        Teller teller = new Teller();
        teller.setUsername("jiaogeteller");
        teller.setPassword("hahahah");
        session.save(teller);
        tx.commit();
        session.close();

    }

    @Test
    public void personinfotest() {
        SessionFactory sf = (SessionFactory) context.getBean("sessionFactory");
        UserService service = (UserService) context.getBean("userService");
        UserService userService= (UserService) context.getBean("userService");
        Session session = sf.openSession();
        Transaction tx = session.beginTransaction();
        User user =service.getUser(14);
       // System.out.println(user.toString());
//        Personinfo personinfo=userService.getAllPersoninfo();
        System.out.println(user.getStatus().getName().toString());
        System.out.println(user.getPersoninfo().toString());
       System.out.println(user.getTransactionLog().toString());

    }
    @Test
    public void transactiontest(){

        SessionFactory sf = (SessionFactory) context.getBean("sessionFactory");
        UserService service = (UserService) context.getBean("userService");
        UserService userService= (UserService) context.getBean("userService");
        UserService userSerivice= (UserService) context.getBean("userSerivice");
        Session session = sf.openSession();
        Transaction tx = session.beginTransaction();
        User user =service.getUser(14);



    }

}
