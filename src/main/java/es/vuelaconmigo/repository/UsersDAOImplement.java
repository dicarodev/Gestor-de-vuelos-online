package es.vuelaconmigo.repository;

import es.vuelaconmigo.model.User;
import jakarta.persistence.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UsersDAOImplement implements UsersDAO {

    private EntityManagerFactory entityManagerFactory;
    private EntityManager entityManager;
    private String persistenceUnit = "VUELACONMIGO";

    public UsersDAOImplement() {
        entityManagerFactory = Persistence.createEntityManagerFactory(persistenceUnit);
    }

    @Override
    public boolean authenticateUser(String mail, String password) {
        entityManager = entityManagerFactory.createEntityManager();
        String hql = "from User u where u.mail = :mail";
        Query query = entityManager.createQuery(hql);
        query.setParameter("mail", mail);

        try {
            User user = (User) query.getSingleResult();
            return user.getPassword().equals(password);
        } catch (NoResultException e) {
            return false;
        }
    }

    @Override
    public String getUserRole(String mail) {
        entityManager = entityManagerFactory.createEntityManager();
        String hql = "from User u where u.mail = :mail";
        Query query = entityManager.createQuery(hql);
        query.setParameter("mail", mail);

        User user = (User) query.getSingleResult();

        return user.getRol();
    }

    @Override
    public User getUserByEmail(String email) {
        entityManager = entityManagerFactory.createEntityManager();
        String hql = "from User u where u.mail = :mail";
        Query query = entityManager.createQuery(hql);
        query.setParameter("mail", email);

        return (User) query.getSingleResult();
    }

    @Override
    public User getUserById(int idUser) {
        entityManager = entityManagerFactory.createEntityManager();
        return entityManager.find(User.class, idUser);
    }
    @Override
    public boolean addUser(User user) {
        entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            entityManager.merge(user);
            entityManager.getTransaction().commit();
            return true;
        }catch (Exception ex){
            return false;
        }
    }

    @Override
    public boolean editUser(User user) {
        entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            entityManager.merge(user);
            entityManager.getTransaction().commit();
            return true;
        }catch (Exception ex){
            return false;
        }
    }

    @Override
    public boolean removeUser(int idUser) {
        entityManager = entityManagerFactory.createEntityManager();
        try {
            User user = getUserById(idUser);
            entityManager.getTransaction().begin();
            entityManager.remove(user);
            entityManager.getTransaction().commit();
            return true;
        }catch (Exception ex){
            return false;
        }
    }

    @Override
    public List<User> getAllUsers(){
        entityManager = entityManagerFactory.createEntityManager();
        String hql = "from User u";
        Query query = entityManager.createQuery(hql);

        return query.getResultList();
    }
}
