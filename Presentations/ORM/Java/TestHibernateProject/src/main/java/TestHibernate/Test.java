package TestHibernate;

import org.hibernate.Session;

import java.util.List;

public class Test {
    public static void main(String[] args) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        /*
        //Add new Employee object
        EmployeeEntity emp = new EmployeeEntity();
        emp.setEmail("petia@gmail.com");
        emp.setFirstName("Petro");
        emp.setLastName("Petrenko");

        session.save(emp);


        ExpertEntity expEnt = new ExpertEntity();
        expEnt.setEmail("michael@gmail.com");
        expEnt.setName("Michael_228");
        session.save(expEnt);
        session.getTransaction().commit();



        OpinionEntity opinionEntity = new OpinionEntity();
        opinionEntity.setDiscussionId(1);
        opinionEntity.setExpertId(3);
        opinionEntity.setOpinionText("It's better than Prometheus");
        session.save(opinionEntity);
        session.getTransaction().commit();
*/

        DiscussionEntity discussionEntity = new DiscussionEntity();
        discussionEntity.setName("About new Alien");
        session.save(discussionEntity);
        session.getTransaction().commit();

        //List<EmployeeEntity> list = session.createCriteria(EmployeeEntity.class).list();
        HibernateUtil.shutdown();
    }
}
