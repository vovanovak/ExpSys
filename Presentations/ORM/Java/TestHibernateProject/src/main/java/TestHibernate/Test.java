package TestHibernate;

import org.hibernate.Session;

import java.util.List;

public class Test {
    public static void main(String[] args) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();

        //Add new Employee object
        EmployeeEntity emp = new EmployeeEntity();
        emp.setEmail("petia@gmail.com");
        emp.setFirstName("Petro");
        emp.setLastName("Petrenko");

        session.save(emp);

        session.getTransaction().commit();
        List<EmployeeEntity> list = session.createCriteria(EmployeeEntity.class).list();
        HibernateUtil.shutdown();
    }
}
